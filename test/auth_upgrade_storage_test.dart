import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/kinde_secure_storage/kinde_secure_storage.dart';

import 'test_helpers/auth_platform_harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthPlatformHarness harness;

  setUp(() async {
    harness = AuthPlatformHarness();
    await harness.initialize();
  });
  tearDown(() => harness.close());

  test(
    'missing legacy session permits re-login and persistence on reload',
    () async {
      expect(await harness.sdk.isAuthenticated(), isFalse);
      await expectLater(
        harness.sdk.getToken(),
        throwsA(
          isA<KindeError>().having(
            (error) => error.code,
            'code',
            KindeErrorCode.sessionExpiredOrInvalid.code,
          ),
        ),
      );
      await harness.sdk.login();
      final stored = harness.savedAuthState;
      expect(stored['access_token'], AuthPlatformHarness.accessToken);
      expect(stored['refresh_token'], 'test-refresh-token');
      expect(stored['id_token'], AuthPlatformHarness.idToken);
      expect(stored['scope'], 'openid profile email offline');
      await harness.reloadStore();
      expect(await harness.sdk.getToken(), AuthPlatformHarness.accessToken);
      expect(harness.authCalls, hasLength(1));
    },
  );

  test(
    'unreadable auth state is not authenticated and re-login replaces it',
    () async {
      harness.values[AuthPlatformHarness.authStateKey] = 'legacy-ciphertext';
      harness.unreadableKeys.add(AuthPlatformHarness.authStateKey);
      harness.values['unrelated-app-secret'] = 'keep-me';
      await harness.reloadStore();
      expect(await harness.sdk.isAuthenticated(), isFalse);
      await harness.sdk.login();
      await harness.reloadStore();
      expect(await harness.sdk.getToken(), AuthPlatformHarness.accessToken);
      expect(harness.values['unrelated-app-secret'], 'keep-me');
      expect(
        harness.storageCalls.map((call) => call.method),
        isNot(contains('deleteAll')),
      );
    },
  );

  test(
    'forced refresh preserves client credentials and persists rotated tokens',
    () async {
      await harness.sdk.login();
      final adapter = harness.dio.httpClientAdapter as DioAdapter;
      adapter.onPost(
        '/oauth2/token',
        (server) => server.reply(200, {
          'access_token': 'rotated-access-token',
          'refresh_token': 'rotated-refresh-token',
          'id_token': 'rotated-id-token',
          'expires_in': 3600,
          'scope': 'openid profile email offline',
        }),
        data: {
          'refresh_token': 'test-refresh-token',
          'grant_type': 'refresh_token',
          'scope': 'openid profile email offline',
          'client_id': 'test-client-id',
        },
      );

      expect(
        await harness.sdk.getToken(forceRefresh: true),
        'rotated-access-token',
      );
      await harness.reloadStore();
      expect(await harness.sdk.getToken(), 'rotated-access-token');
      expect(harness.sdk.authState?.refreshToken, 'rotated-refresh-token');
      expect(harness.sdk.authState?.idToken, 'rotated-id-token');
    },
  );

  test(
    'secure keys and auth request state retain their storage keys',
    () async {
      final storage = KindeSecureStorage();
      final key = List<int>.generate(32, (index) => index);
      await storage.saveSecureKey(key);
      await storage.saveAuthRequestState('test-oauth-state');
      final reloadedStorage = KindeSecureStorage();
      expect(await reloadedStorage.getSecureKey(), key);
      expect(await reloadedStorage.getAuthRequestState(), 'test-oauth-state');
      await reloadedStorage.removeAuthRequestState();
      expect(await reloadedStorage.getAuthRequestState(), isNull);
      expect(await reloadedStorage.getSecureKey(), key);
    },
  );
}
