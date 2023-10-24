import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for UpdateOrganizationUsersRequestUsersInner
void main() {
  final instance = UpdateOrganizationUsersRequestUsersInnerBuilder();
  // TODO add properties to the builder and call build()

  group(UpdateOrganizationUsersRequestUsersInner, () {
    // The users id.
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<UpdateOrganizationUsersRequestUsersInner>());
      expect(result.id, isNotNull);
      expect(result.id, isA<String>());
      expect(result.id, contains('id'));
    });

    // Optional operation, set to 'delete' to remove the user from the organization.
    // String operation
    test('to test the property `operation`', () async {
      // TODO
      final operation = instance.operation;
      expect(operation, isNull);
      instance.operation = 'operation';
      final result = instance.build();
      expect(result, isA<UpdateOrganizationUsersRequestUsersInner>());
      expect(result.operation, isNotNull);
      expect(result.operation, isA<String>());
      expect(result.operation, contains('operation'));
    });

    // Role keys to assign to the user.
    // BuiltList<String> roles
    test('to test the property `roles`', () async {
      // TODO
      final roles = instance.roles;
      expect(roles.length, isZero);
      instance.roles.add('role1');
      instance.roles.add('role2');
      final result = instance.build();
      expect(result, isA<UpdateOrganizationUsersRequestUsersInner>());
      expect(result.roles, isNotNull);
      expect(result.roles, isA<BuiltList<String>>());
      expect(result.roles?.length, equals(2));
      expect(result.roles, contains('role1'));
      expect(result.roles, contains('role2'));
    });

    // Permission keys to assign to the user.
    // BuiltList<String> permissions
    test('to test the property `permissions`', () async {
      // TODO
      final permissions = instance.permissions;
      expect(permissions.length, isZero);
      instance.permissions.add('permission1');
      instance.permissions.add('permission2');
      final result = instance.build();
      expect(result, isA<UpdateOrganizationUsersRequestUsersInner>());
      expect(result.permissions, isNotNull);
      expect(result.permissions, isA<BuiltList<String>>());
      expect(result.permissions?.length, equals(2));
      expect(result.permissions, contains('permission1'));
      expect(result.permissions, contains('permission2'));
    });
  });
}
