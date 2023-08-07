import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for OAuthApi
void main() {
  final instance = KindeApi().getOAuthApi();

  group(OAuthApi, () {
    // Get User Profile
    //
    // Contains the id, names and email of the currently logged in user. 
    //
    //Future<UserProfile> getUser() async
    test('test getUser', () async {
      // TODO
    });

    // Returns the details of the currently logged in user
    //
    // Contains the id, names, profile picture URL and email of the currently logged in user. 
    //
    //Future<UserProfileV2> getUserProfileV2() async
    test('test getUserProfileV2', () async {
      // TODO
    });

  });
}
