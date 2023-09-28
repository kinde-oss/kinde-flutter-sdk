import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for UpdateOrganizationUsersRequest
void main() {
  final instance = UpdateOrganizationUsersRequestBuilder();
  // TODO add properties to the builder and call build()

  group(UpdateOrganizationUsersRequest, () {
    // Users to add, update or remove from the organization.
    // BuiltList<UpdateOrganizationUsersRequestUsersInner> users
    test('to test the property `users`', () async {
      // TODO
      final users = instance.users;
      expect(users.length, isZero);
      UpdateOrganizationUsersRequestUsersInner
          updateOrganizationUsersRequestUsersInner =
          UpdateOrganizationUsersRequestUsersInner();
      instance.users.add(updateOrganizationUsersRequestUsersInner);
      final result = instance.build();
      expect(result, isA<UpdateOrganizationUsersRequest>());
      expect(result.users, isNotNull);
      expect(result.users?.length, isNonZero);
    });
  });
}
