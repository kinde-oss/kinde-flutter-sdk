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
