import 'package:dio/dio.dart';
import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

import 'test_helpers/dio_mock.dart';

/// tests for SelfServePortalApi
void main() {
  // final instance = KindeFlutterSdk().getSelfServePortalApi();
  Dio dio = DioAdapterMock();
  SelfServePortalApi instance = KindeApi(dio: dio).getSelfServePortalApi();

  group(SelfServePortalApi, () {
    // Get self-serve portal link
    //
    // Returns a link to the self-serve portal for the authenticated user. The user can use this link to manage their account, update their profile, and view their entitlements.
    //
    //Future<PortalLink> getPortalLink({ String subnav, String returnUrl }) async
    test('test getPortalLink', () async {
      // TODO
      final responseData = await instance.getPortalLink();
      expect(responseData, isNotNull);
    });
  });
}
