import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for BusinessApi
void main() {
  final instance = KindeApi().getBusinessApi();

  group(BusinessApi, () {
    // List business details
    //
    // Get your business details.
    //
    //Future<SuccessResponse> getBusiness(String code, String name, String email, { String phone, String industry, String timezone, String privacyUrl, String termsUrl }) async
    test('test getBusiness', () async {
      // TODO
    });

    // Update business details
    //
    // Update business details.
    //
    //Future<SuccessResponse> updateBusiness(String businessName, String primaryEmail, { String primaryPhone, String industryKey, String timezoneId, String privacyUrl, String termsUrl, String isShowKindeBranding, bool isClickWrap, String partnerCode }) async
    test('test updateBusiness', () async {
      // TODO
    });

  });
}
