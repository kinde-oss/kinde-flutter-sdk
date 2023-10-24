import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for AddOrganizationUsersRequest
void main() {
  final instance = AddOrganizationUsersRequestBuilder();
  // TODO add properties to the builder and call build()

  group(AddOrganizationUsersRequest, () {
    // Users to be added to the organization.
    // BuiltList<AddOrganizationUsersRequestUsersInner> users
    test('to test the property `users`', () async {
      // TODO
      instance.users.add(AddOrganizationUsersRequestUsersInner((updates) {
        updates.permissions.add('Admin');
        updates.permissions.add('Guest');
        updates.roles.add('User');
        updates.roles.add('Student');
      }));
      final result = instance.build();
      BuiltList<AddOrganizationUsersRequestUsersInner>? userList = result.users;
      if (userList != null) {
        for (AddOrganizationUsersRequestUsersInner user in userList) {
          expect(user.permissions?.length, equals(2));
          expect(user.roles?.length, equals(2));
        }
      }
      expect(result.users, isNotNull);
    });
  });
}
