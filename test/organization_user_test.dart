import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for OrganizationUser
void main() {
  final instance = OrganizationUserBuilder();
  // TODO add properties to the builder and call build()

  group(OrganizationUser, () {
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<OrganizationUser>());
      expect(result.id, isNotNull);
      expect(result.id, equals('id'));
    });

    // String email
    test('to test the property `email`', () async {
      // TODO
      final email = instance.email;
      expect(email, isNull);
      instance.email = 'email';
      final result = instance.build();
      expect(result, isA<OrganizationUser>());
      expect(result.email, isNotNull);
      expect(result.email, equals('email'));
    });

    // String fullName
    test('to test the property `fullName`', () async {
      // TODO
      final fullName = instance.fullName;
      expect(fullName, isNull);
      instance.fullName = 'fullName';
      final result = instance.build();
      expect(result, isA<OrganizationUser>());
      expect(result.fullName, isNotNull);
      expect(result.fullName, equals('fullName'));
    });

    // String lastName
    test('to test the property `lastName`', () async {
      // TODO
      final lastName = instance.lastName;
      expect(lastName, isNull);
      instance.lastName = 'lastName';
      final result = instance.build();
      expect(result, isA<OrganizationUser>());
      expect(result.lastName, isNotNull);
      expect(result.lastName, equals('lastName'));
    });

    // String firstName
    test('to test the property `firstName`', () async {
      // TODO
      final firstName = instance.firstName;
      expect(firstName, isNull);
      instance.firstName = 'firstName';
      final result = instance.build();
      expect(result, isA<OrganizationUser>());
      expect(result.firstName, isNotNull);
      expect(result.firstName, equals('firstName'));
    });

    // BuiltList<String> roles
    test('to test the property `roles`', () async {
      // TODO
      final roles = instance.roles;
      expect(roles.length, isZero);
      instance.roles.add('Guest');
      instance.roles.add('System-Admin');
      final result = instance.build();
      expect(result, isA<OrganizationUser>());
      expect(result.roles, isA<BuiltList<String>>());
      expect(result.roles, isNotNull);
      expect(result.roles?.length, equals(2));
      expect(result.roles, contains('Guest'));
      expect(result.roles, contains('System-Admin'));
    });
  });
}
