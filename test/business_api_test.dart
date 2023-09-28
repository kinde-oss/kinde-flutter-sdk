import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:dio/dio.dart';
import '../test/test_helpers/dio_mock.dart';

/// tests for BusinessApi
void main() {
  //final instance = KindeApi().getBusinessApi();
  Dio dio = DioAdapterMock();
  BusinessApi instance = KindeApi(dio: dio).getBusinessApi();

  group(BusinessApi, () {
    // List business details
    //
    // Get your business details.
    //
    //Future<SuccessResponse> getBusiness(String code, String name, String email, { String phone, String industry, String timezone, String privacyUrl, String termsUrl }) async
    test('test getBusiness', () async {
      // TODO
      final responseData = await instance.getBusiness(
        code: 'test_code',
        name: 'test_name',
        email: 'test_email',
      );
      expect(responseData, isNotNull);
    });

    // Update business details
    //
    // Update business details.
    //
    //Future<SuccessResponse> updateBusiness(String businessName, String primaryEmail, { String primaryPhone, String industryKey, String timezoneId, String privacyUrl, String termsUrl, String isShowKindeBranding, bool isClickWrap, String partnerCode }) async
    test('test updateBusiness', () async {
      // TODO
      final responseData = await instance.updateBusiness(
        businessName: 'test_businessName',
        primaryEmail: 'test_primaryEmail',
      );
      expect(responseData, isNotNull);
    });
  });
}
