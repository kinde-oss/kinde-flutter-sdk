import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/kinde_flutter_sdk.dart';

import 'mock_channels.dart';
import 'test_helpers/dio_adapter.dart';

void main() async {

  TestWidgetsFlutterBinding.ensureInitialized();

  mockChannels.setupMockChannel();
  final mockDio = setupDioMock();
  // final mockDio = DioAdapterMock();

  group(KindeFlutterSDK, () {
    test('test initializeSDK', () async {
      await initializeKindeFlutterSdkForTest(
          authDomain: "authDomain",
          authClientId: "authClientId",
          loginRedirectUri: "loginRedirectUri",
          logoutRedirectUri: "logoutRedirectUri",
          dio: mockDio);

      expect(() => KindeFlutterSDK.instance, returnsNormally);
    });

    test('test sdk login', () async {

      await KindeFlutterSDK.instance.login();

      expect(KindeFlutterSDK.instance.authState, isNotNull);
    });

    group('login prompt', () {
      const appAuthChannel =
          MethodChannel('crossingthestreams.io/flutter_appauth');

      Future<Object?> promptSentBy(
          Future<void> Function() login) async {
        Object? sentPrompt;
        TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
            .setMockMethodCallHandler(appAuthChannel, (methodCall) async {
          sentPrompt =
              (methodCall.arguments as Map<Object?, Object?>)['promptValues'];
          return tokenResponseMap;
        });
        addTearDown(mockChannels.setupMockChannel);

        await login();
        return sentPrompt;
      }

      test('sends prompt=login by default', () async {
        final prompt = await promptSentBy(KindeFlutterSDK.instance.login);

        expect(prompt, ['login']);
      });

      test('sends the caller prompt', () async {
        final prompt = await promptSentBy(() => KindeFlutterSDK.instance.login(
            additionalParams: const AdditionalParameters(prompt: KindePrompt.none)));

        expect(prompt, ['none']);
      });

      test('sends no prompt for useSession', () async {
        final prompt = await promptSentBy(() => KindeFlutterSDK.instance.login(
            additionalParams: const AdditionalParameters(prompt: KindePrompt.useSession)));

        expect(prompt, isNull);
      });

      test('an invitation code still sends create', () async {
        final prompt = await promptSentBy(() => KindeFlutterSDK.instance.login(
            additionalParams: const AdditionalParameters(
                invitationCode: 'inv_1', prompt: KindePrompt.useSession)));

        expect(prompt, ['create']);
      });

      test('register sends no prompt, as before', () async {
        final prompt = await promptSentBy(KindeFlutterSDK.instance.register);

        expect(prompt, isNull);
      });
    });

    test('test sdk login pkce', () async {

      await KindeFlutterSDK.instance.login(type: AuthFlowType.pkce);

      expect(KindeFlutterSDK.instance.authState, isNotNull);
    });

    test('test sdk register', () async {

      await KindeFlutterSDK.instance.register(type: AuthFlowType.pkce);

      expect(KindeFlutterSDK.instance.authState, isNotNull);
    });

    test('test sdk register pkce', () async {

      await KindeFlutterSDK.instance.register(type: AuthFlowType.pkce);

      expect(KindeFlutterSDK.instance.authState, isNotNull);
    });

    test('test sdk logout', () async {
      await KindeFlutterSDK.instance.logout(dio: mockDio);
      expect(KindeFlutterSDK.instance.authState, isNull);
    });

    test('test create org', () async {

      await KindeFlutterSDK.instance.createOrg(orgName: 'test');

    });

    test('test create org pkce', () async {
      await KindeFlutterSDK.instance.createOrg(
        orgName: 'test',
        type: AuthFlowType.pkce,
      );
    });
  });
}
