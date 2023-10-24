import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/keys/keys.dart';
import 'package:kinde_flutter_sdk/src/store/store.dart';

import 'mock_channels.dart';

void main() async {

  TestWidgetsFlutterBinding.ensureInitialized();

  mockChannels.setupMockChannel();

  group(KindeFlutterSDK, () {
    test('test initializeSDK', () async {

      await KindeFlutterSDK.initializeSDK(
          authDomain: "authDomain",
          authClientId: "authClientId",
          loginRedirectUri: "loginRedirectUri",
          logoutRedirectUri: "logoutRedirectUri");

      Store.instance.keys = const Keys(keys: []);

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

      await KindeFlutterSDK.instance.logout();

      expect(KindeFlutterSDK.instance.authState, isNull);
    });

    test('test create org', () async {

      await KindeFlutterSDK.instance.createOrg(orgName: 'test');

    });

    test('test create org pkce', () async {

      await KindeFlutterSDK.instance.createOrg(orgName: 'test', type: AuthFlowType.pkce);

    });
  });
}
