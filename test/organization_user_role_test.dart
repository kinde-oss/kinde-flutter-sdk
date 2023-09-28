import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for OrganizationUserRole
void main() {
  final instance = OrganizationUserRoleBuilder();
  // TODO add properties to the builder and call build()

  group(OrganizationUserRole, () {
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<OrganizationUserRole>());
      expect(result, isA<OrganizationUserRole>());
      expect(result.id, isNotNull);
      expect(result.id, equals('id'));
    });

    // String key
    test('to test the property `key`', () async {
      // TODO
      final key = instance.key;
      expect(key, isNull);
      instance.key = 'key';
      final result = instance.build();
      expect(result, isA<OrganizationUserRole>());
      expect(result.key, isNotNull);
      expect(result.key, equals('key'));
    });

    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = 'name';
      final result = instance.build();
      expect(result, isA<OrganizationUserRole>());
      expect(result.name, isNotNull);
      expect(result.name, equals('name'));
    });
  });
}
