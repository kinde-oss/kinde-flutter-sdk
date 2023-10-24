import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for AddOrganizationUsersRequestUsersInner
void main() {
  final instance = AddOrganizationUsersRequestUsersInnerBuilder();
  // TODO add properties to the builder and call build()

  group(AddOrganizationUsersRequestUsersInner, () {
    // The users id.
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<AddOrganizationUsersRequestUsersInner>());
      expect(result.id, isNotNull);
      expect(result.id, equals('id'));
    });

    // Role keys to assign to the user.
    // BuiltList<String> roles
    test('to test the property `roles`', () async {
      // TODO
      final roles = instance.roles;
      expect(roles, isEmpty);
      roles.add('Guest');
      roles.add('System Administrator');
      final result = instance.build();
      expect(result, isA<AddOrganizationUsersRequestUsersInner>());
      expect(result.roles, isNotEmpty);
      expect(result.roles, contains('Guest'));
      expect(result.roles, contains('System Administrator'));
    });

    // Permission keys to assign to the user.
    // BuiltList<String> permissions
    test('to test the property `permissions`', () async {
      // TODO
      final permissions = instance.permissions;
      expect(permissions, isEmpty);
      permissions.add('Administrator');
      permissions.add('Storage');
      final result = instance.build();
      expect(result, isA<AddOrganizationUsersRequestUsersInner>());
      expect(result.permissions, isNotEmpty);
      expect(result.permissions, contains('Administrator'));
      expect(result.permissions, contains('Storage'));
    });
  });
}
