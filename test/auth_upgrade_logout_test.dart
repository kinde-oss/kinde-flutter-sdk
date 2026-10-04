import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

import 'test_helpers/auth_platform_harness.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late AuthPlatformHarness harness;

  setUp(() async {
    harness = AuthPlatformHarness();
    await harness.initialize();
    await harness.sdk.login();
    harness.authCalls.clear();
  });
  tearDown(() => harness.close());

  test(
    'browser logout omits ID-token hint and clears only Kinde session keys',
    () async {
      harness.values['unrelated-app-secret'] = 'keep-me';
      await harness.sdk.logout(macosLogoutWithoutRedirection: false);

      expect(harness.authCalls.single.method, 'endSession');
      final request = harness.arguments(harness.authCalls.single);
      expect(request['idTokenHint'], isNull);
      expect(request['postLogoutRedirectUrl'], 'com.kinde.test://logout');
      expect(request['additionalParameters'], {'client_id': 'test-client-id'});
      expect(
        request['externalUserAgent'],
        ExternalUserAgent.ephemeralAsWebAuthenticationSession.index,
      );
      expect(
        request['serviceConfiguration'],
        containsPair('endSessionEndpoint', 'https://authDomain/logout'),
      );
      expect(harness.values, isNot(contains(AuthPlatformHarness.authStateKey)));
      expect(harness.values, isNot(contains(AuthPlatformHarness.keysKey)));
      expect(harness.values['unrelated-app-secret'], 'keep-me');
      expect(
        harness.storageCalls.map((call) => call.method),
        isNot(contains('deleteAll')),
      );
      await harness.reloadStore();
      expect(await harness.sdk.isAuthenticated(), isFalse);
      expect(harness.sdk.authState, isNull);
    },
  );

  test(
    'logout timeout preserves session and reports request-timed-out',
    () async {
      final pending = Completer<void>();
      harness.endSessionWait = pending.future;
      await expectLater(
        harness.sdk.logout(
          macosLogoutWithoutRedirection: false,
          timeout: const Duration(milliseconds: 1),
        ),
        throwsA(
          isA<KindeError>().having(
            (error) => error.code,
            'code',
            KindeErrorCode.requestTimedOut.code,
          ),
        ),
      );
      expect(harness.values, contains(AuthPlatformHarness.authStateKey));
      pending.complete();
      harness.endSessionWait = null;
    },
  );

  test(
    'cancelled logout retains the session for a later logout attempt',
    () async {
      harness.authError = PlatformException(
        code: 'end_session_failed',
        message: 'User cancelled',
        details: {'user_did_cancel': 'true'},
      );
      await expectLater(
        harness.sdk.logout(macosLogoutWithoutRedirection: false),
        throwsA(
          isA<KindeError>().having(
            (error) => error.code,
            'code',
            KindeErrorCode.userCanceled.code,
          ),
        ),
      );
      expect(harness.values, contains(AuthPlatformHarness.authStateKey));
      await harness.reloadStore();
      expect(await harness.sdk.isAuthenticated(), isTrue);
    },
  );

  test('failed logout surfaces error and retains saved credentials', () async {
    final saved = harness.values[AuthPlatformHarness.authStateKey];
    harness.authError = PlatformException(
      code: 'end_session_failed',
      message: 'Browser logout failed',
    );
    await expectLater(
      harness.sdk.logout(macosLogoutWithoutRedirection: false),
      throwsA(
        isA<KindeError>().having(
          (error) => error.code,
          'code',
          'end_session_failed',
        ),
      ),
    );
    expect(harness.values[AuthPlatformHarness.authStateKey], saved);
    await harness.reloadStore();
    expect(await harness.sdk.isAuthenticated(), isTrue);
    harness.authError = null;
    await harness.sdk.logout(macosLogoutWithoutRedirection: false);
    expect(await harness.sdk.isAuthenticated(), isFalse);
  });

  test(
    'macOS direct logout keeps HTTP fallback and allows a new session',
    () async {
      await harness.sdk.logout(dio: harness.dio);
      expect(harness.authCalls, isEmpty);
      await harness.reloadStore();
      expect(await harness.sdk.isAuthenticated(), isFalse);
      await harness.sdk.login();
      await harness.reloadStore();
      expect(await harness.sdk.getToken(), AuthPlatformHarness.accessToken);
    },
    skip: !Platform.isMacOS,
  );
}
