import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/kinde_flutter_sdk.dart';

import 'mock_channels.dart';
import 'test_helpers/dio_adapter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const flutterAppauth =
      MethodChannel('crossingthestreams.io/flutter_appauth');

  group('native auth concurrency', () {
    late Dio mockDio;

    setUp(() async {
      mockChannels.setupMockChannel();
      mockDio = setupDioMock();
      await initializeKindeFlutterSdkForTest(
        authDomain: 'authDomain',
        authClientId: 'authClientId',
        loginRedirectUri: 'loginRedirectUri',
        logoutRedirectUri: 'logoutRedirectUri',
        dio: mockDio,
      );
    });

    tearDown(() async {
      await KindeFlutterSDK.instance.logout(dio: mockDio);
    });

    test('rejects overlapping login() with login-in-process', () async {
      final releaseAuthorizeFlow = Completer<void>();

      TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(flutterAppauth, (methodCall) async {
        if (methodCall.method == 'authorizeAndExchangeCode') {
          await releaseAuthorizeFlow.future;
          return tokenResponseMap;
        }
        if (methodCall.method == 'authorize') {
          return authorizeResponse;
        }
        if (methodCall.method == 'token') {
          return tokenResponseMap;
        }
        if (methodCall.method == 'endSession') {
          return endSessionResponse;
        }
        return null;
      });

      final firstLogin = KindeFlutterSDK.instance.login();
      await Future<void>.delayed(Duration.zero);

      await expectLater(
        KindeFlutterSDK.instance.login(),
        throwsA(
          isA<KindeError>().having(
            (error) => error.code,
            'code',
            KindeErrorCode.loginInProcess.code,
          ),
        ),
      );

      releaseAuthorizeFlow.complete();
      await firstLogin;
    });

    test('skips re-delivered invitation_code only after successful login',
        () async {
      var authorizeCallCount = 0;

      TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(flutterAppauth, (methodCall) async {
        if (methodCall.method == 'authorizeAndExchangeCode') {
          authorizeCallCount++;
          return tokenResponseMap;
        }
        if (methodCall.method == 'authorize') {
          return authorizeResponse;
        }
        if (methodCall.method == 'token') {
          return tokenResponseMap;
        }
        if (methodCall.method == 'endSession') {
          return endSessionResponse;
        }
        return null;
      });

      const invitationCode = 'invite-code-success';

      await KindeFlutterSDK.instance
          .handleInvitationCode(invitationCode);
      expect(authorizeCallCount, 1);
      expect(KindeFlutterSDK.instance.authState, isNotNull);

      await KindeFlutterSDK.instance
          .handleInvitationCode(invitationCode);
      expect(authorizeCallCount, 1);
    });

    test('allows invitation_code retry after failed login', () async {
      var authorizeCallCount = 0;
      var failNextAuthorize = true;

      TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(flutterAppauth, (methodCall) async {
        if (methodCall.method == 'authorizeAndExchangeCode') {
          authorizeCallCount++;
          if (failNextAuthorize) {
            throw PlatformException(
              code: 'authorize_failed',
              message: 'Simulated transient failure',
            );
          }
          return tokenResponseMap;
        }
        if (methodCall.method == 'authorize') {
          return authorizeResponse;
        }
        if (methodCall.method == 'token') {
          return tokenResponseMap;
        }
        if (methodCall.method == 'endSession') {
          return endSessionResponse;
        }
        return null;
      });

      const invitationCode = 'invite-code-retry';

      await KindeFlutterSDK.instance
          .handleInvitationCode(invitationCode);
      expect(authorizeCallCount, 1);
      expect(KindeFlutterSDK.instance.authState, isNull);

      failNextAuthorize = false;

      await KindeFlutterSDK.instance
          .handleInvitationCode(invitationCode);
      expect(authorizeCallCount, 2);
      expect(KindeFlutterSDK.instance.authState, isNotNull);

      await KindeFlutterSDK.instance
          .handleInvitationCode(invitationCode);
      expect(authorizeCallCount, 2);
    });
  });
}
