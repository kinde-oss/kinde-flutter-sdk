// Tests for the reloadAuthState() guard in getToken().
//
// Bug (origin/main): getToken() called reloadAuthState() unconditionally, which
// read the (potentially stale) on-disk state and overwrote the freshly rotated
// in-memory token that the background refresh had just written. The Store
// authState setter uses a fire-and-forget disk write, so the disk copy lags
// behind memory during the write window — unconditionally reloading from disk
// during that window destroys the fresh token and causes an invalid_grant error.
//
// Fix (this branch): reloadAuthState() is skipped when _store.authState is
// already populated. It is only called on cold start (authState == null) to
// restore persisted state from disk, which is the original intent.
import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/store/store.dart';
import 'package:kinde_flutter_sdk/src/token/auth_state.dart';

import 'mock_channels.dart';
import 'test_helpers/dio_adapter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  mockChannels.setupMockChannel();

  group('getToken reloadAuthState guard', () {
    late KindeFlutterSDK sdk;

    setUp(() async {
      // Each test gets a fresh SDK + Store (Store.init() replaces the singleton).
      // loadFromStorage() reads from disk; the secure-storage mock returns null,
      // so Store.instance.authState starts as null after initialization.
      sdk = await initializeKindeFlutterSdkForTest(
        authDomain: 'authDomain',
        authClientId: 'authClientId',
        loginRedirectUri: 'loginRedirectUri',
        logoutRedirectUri: 'logoutRedirectUri',
        dio: setupDioMock(),
      );
    });

    test('returns in-memory token without reloading from disk', () async {
      // Inject a valid, non-expired auth state directly into the in-memory cache.
      // This simulates the state left by a completed background token refresh
      // whose fire-and-forget disk write has not yet finished.
      Store.instance.authState = AuthState(
        accessToken: 'rotated_access_token',
        refreshToken: 'rotated_refresh_token',
        accessTokenExpirationDateTime:
            DateTime.now().add(const Duration(hours: 1)),
        idToken: 'rotated_id_token',
        scope: 'openid profile email offline',
      );

      // The secure-storage mock returns null for ALL reads.
      // If getToken called reloadAuthState() unconditionally (the bug), it would:
      //   1. Overwrite _cachedAuthState with null (disk returns null)
      //   2. isAuthenticated() → false
      //   3. Attempt token refresh → no refresh token → throw KindeError
      //
      // With the fix, authState != null so reloadAuthState() is skipped and the
      // fresh in-memory token is returned directly.
      final token = await sdk.getToken();

      expect(token, equals('rotated_access_token'));
    });

    test('reads from disk when no auth state is cached (cold start)', () async {
      // After initializeKindeFlutterSdkForTest the store is fresh with no cached
      // state (mock disk returns null). This verifies the guard does NOT prevent
      // the cold-start disk read — only the redundant read while memory is warm.
      expect(Store.instance.authState, isNull);

      // getToken() sees authState == null → calls reloadAuthState().
      // reloadAuthState() reads null from disk → authState remains null.
      // isAuthenticated() → false, no refresh token → throws KindeError.
      expect(
        () => sdk.getToken(),
        throwsA(isA<KindeError>()),
      );
    });
  });
}
