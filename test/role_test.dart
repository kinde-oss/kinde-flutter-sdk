import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for Role
void main() {
  final instance = RoleBuilder();
  // TODO add properties to the builder and call build()

  group(Role, () {
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<Role>());
      expect(result.id, isNotNull);
      expect(result.id, isA<String>());
      expect(result.id, contains('id'));
    });

    // String key
    test('to test the property `key`', () async {
      // TODO
      final key = instance.key;
      expect(key, isNull);
      instance.key = 'key';
      final result = instance.build();
      expect(result, isA<Role>());
      expect(result.key, isNotNull);
      expect(result.key, isA<String>());
      expect(result.key, contains('key'));
    });

    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = 'name';
      final result = instance.build();
      expect(result, isA<Role>());
      expect(result.name, isNotNull);
      expect(result.name, isA<String>());
      expect(result.name, contains('name'));
    });

    // String description
    test('to test the property `description`', () async {
      // TODO
      final description = instance.description;
      expect(description, isNull);
      instance.description = 'description';
      final result = instance.build();
      expect(result, isA<Role>());
      expect(result.description, isNotNull);
      expect(result.description, isA<String>());
      expect(result.description, contains('description'));
    });
  });
}
