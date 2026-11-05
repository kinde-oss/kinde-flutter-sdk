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
  });
  tearDown(() => harness.close());

  test(
    'login preserves client, redirect, scopes and additional parameters',
    () async {
      final token = await harness.sdk.login(
        additionalParams: const AdditionalParameters(
          loginHint: 'person@example.com',
          orgCode: 'org-test',
          connectionId: 'connection-test',
          lang: 'en',
        ),
      );

      expect(token, AuthPlatformHarness.accessToken);
      final request = harness.arguments(harness.authCalls.single);
      expect(harness.authCalls.single.method, 'authorizeAndExchangeCode');
      expect(request['clientId'], 'test-client-id');
      expect(request['redirectUrl'], 'com.kinde.test://login');
      expect(request['scopes'], ['openid', 'profile', 'email', 'offline']);
      expect(request['promptValues'], ['login']);
      expect(
        request['externalUserAgent'],
        ExternalUserAgent.ephemeralAsWebAuthenticationSession.index,
      );
      expect(request['serviceConfiguration'], {
        'authorizationEndpoint': 'https://authDomain/oauth2/auth',
        'tokenEndpoint': 'https://authDomain/oauth2/token',
        'endSessionEndpoint': 'https://authDomain/logout',
      });
      expect(request['additionalParameters'], {
        'login_hint': 'person@example.com',
        'org_code': 'org-test',
        'connection_id': 'connection-test',
        'lang': 'en',
        'audience': 'test-audience',
        'supports_reauth': 'true',
      });
      await harness.reloadStore();
      expect(await harness.sdk.isAuthenticated(), isTrue);
      expect(harness.sdk.authState?.refreshToken, 'test-refresh-token');
      expect(harness.sdk.authState?.idToken, AuthPlatformHarness.idToken);
      expect(harness.sdk.getUserDetails()?.id, 'test-user');
      expect(harness.sdk.getPermission('read:test').isGranted, isTrue);
    },
  );

  test(
    'PKCE carries authorization code, verifier and nonce into token exchange',
    () async {
      expect(
        await harness.sdk.login(type: AuthFlowType.pkce),
        AuthPlatformHarness.accessToken,
      );
      expect(harness.authCalls.map((call) => call.method), [
        'authorize',
        'token',
      ]);
      final request = harness.arguments(harness.authCalls.last);
      expect(request['authorizationCode'], 'test-authorization-code');
      expect(request['codeVerifier'], 'test-code-verifier');
      expect(request['nonce'], 'test-nonce');
      expect(request['clientId'], 'test-client-id');
      expect(request['redirectUrl'], 'com.kinde.test://login');
      await harness.reloadStore();
      expect(await harness.sdk.getToken(), AuthPlatformHarness.accessToken);
    },
  );

  test(
    'registration and invitation login keep their distinct parameters',
    () async {
      await harness.sdk.register(
        additionalParams: const AdditionalParameters(
          loginHint: 'person@example.com',
        ),
      );
      final registration = harness.arguments(harness.authCalls.last);
      expect(
        registration['additionalParameters'],
        containsPair('start_page', 'registration'),
      );
      await harness.sdk.logout(macosLogoutWithoutRedirection: false);
      await harness.sdk.login(
        additionalParams: const AdditionalParameters(
          invitationCode: 'test-invite',
        ),
      );
      final invitation = harness.arguments(harness.authCalls.last);
      expect(invitation['promptValues'], ['create']);
      expect(
        invitation['additionalParameters'],
        containsPair('invitation_code', 'test-invite'),
      );
      expect(
        invitation['additionalParameters'],
        containsPair('is_invitation', 'true'),
      );
      await harness.reloadStore();
      expect(await harness.sdk.isAuthenticated(), isTrue);
    },
  );

  test(
    'cancelled login remains user-canceled without saving credentials',
    () async {
      harness.authError = PlatformException(
        code: 'authorize_failed',
        message: 'User cancelled',
        details: {'user_did_cancel': 'true'},
      );
      await expectLater(
        harness.sdk.login(),
        throwsA(
          isA<KindeError>().having(
            (error) => error.code,
            'code',
            KindeErrorCode.userCanceled.code,
          ),
        ),
      );
      expect(harness.values, isNot(contains(AuthPlatformHarness.authStateKey)));
      expect(await harness.sdk.isAuthenticated(), isFalse);
      harness.authError = null;
      await harness.sdk.login();
      await harness.reloadStore();
      expect(await harness.sdk.isAuthenticated(), isTrue);
    },
  );

  test(
    'authorization errors remain errors and a later login can succeed',
    () async {
      harness.authError = PlatformException(
        code: 'authorize_failed',
        message: 'Invalid authorization',
      );
      await expectLater(
        harness.sdk.login(type: AuthFlowType.pkce),
        throwsA(
          isA<KindeError>().having(
            (error) => error.code,
            'code',
            'authorize_failed',
          ),
        ),
      );
      expect(harness.values, isNot(contains(AuthPlatformHarness.authStateKey)));
      harness.authError = null;
      await harness.sdk.login(type: AuthFlowType.pkce);
      await harness.reloadStore();
      expect(await harness.sdk.isAuthenticated(), isTrue);
    },
  );

  test(
    'detached Android activity is surfaced without storing a session',
    () async {
      harness.authError = PlatformException(
        code: 'null_activity',
        message: 'No activity is attached',
      );
      await expectLater(
        harness.sdk.login(),
        throwsA(
          isA<KindeError>().having(
            (error) => error.code,
            'code',
            'null_activity',
          ),
        ),
      );
      expect(harness.values, isNot(contains(AuthPlatformHarness.authStateKey)));
      expect(await harness.sdk.isAuthenticated(), isFalse);
    },
  );
}
