import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import '../test/test_helpers/dio_mock.dart';
import 'package:dio/dio.dart';

/// tests for OAuthApi
void main() {
  //final instance = KindeApi().getOAuthApi();
  Dio dio = DioAdapterMock();
  final instance = KindeApi(dio: dio).getOAuthApi();
  group(OAuthApi, () {
    // Get User Profile
    //
    // Contains the id, names and email of the currently logged in user.
    //
    //Future<UserProfile> getUser() async
    test('test getUser', () async {
      // TODO
      final responseData = await instance.getUser();
      expect(responseData, isNotNull);
    });

    // Returns the details of the currently logged in user
    //
    // Contains the id, names, profile picture URL and email of the currently logged in user.
    //
    //Future<UserProfileV2> getUserProfileV2() async
    test('test getUserProfileV2', () async {
      // TODO
      final responseData = await instance.getUserProfileV2();
      expect(responseData, isNotNull);
    });
  });
}
