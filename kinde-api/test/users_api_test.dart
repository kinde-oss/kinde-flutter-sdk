import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for UsersApi
void main() {
  final instance = KindeApi().getUsersApi();

  group(UsersApi, () {
    // Create User
    //
    // Creates a user record and optionally zero or more identities for the user. An example identity could be the email address of the user. 
    //
    //Future<CreateUserResponse> createUser({ CreateUserRequest createUserRequest }) async
    test('test createUser', () async {
      // TODO
    });

    // Delete User
    //
    // Delete a user record. 
    //
    //Future<SuccessResponse> deleteUser(String id, { String isDeleteProfile }) async
    test('test deleteUser', () async {
      // TODO
    });

    // Get User
    //
    // Retrieve a user record. 
    //
    //Future<User> getUserData(String id) async
    test('test getUserData', () async {
      // TODO
    });

    // List Users
    //
    // The returned list can be sorted by full name or email address in ascending or descending order. The number of records to return at a time can also be controlled using the `page_size` query string parameter. 
    //
    //Future<UsersResponse> getUsers({ String sort, int pageSize, String userId, String nextToken, String email }) async
    test('test getUsers', () async {
      // TODO
    });

    // Update User
    //
    // Update a user record. 
    //
    //Future<User> updateUser(UpdateUserRequest updateUserRequest, { String id }) async
    test('test updateUser', () async {
      // TODO
    });

  });
}
