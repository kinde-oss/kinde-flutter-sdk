import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for Permissions
void main() {
  final instance = PermissionsBuilder();
  // TODO add properties to the builder and call build()

  group(Permissions, () {
    // The permission identifier to use in code.
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<Permissions>());
      expect(result.id, isA<String>());
      expect(result.id, isNotNull);
      expect(result.id, equals('id'));
    });

    // The permission's name.
    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = 'name';
      final result = instance.build();
      expect(result, isA<Permissions>());
      expect(result.name, isA<String>());
      expect(result.name, isNotNull);
      expect(result.name, equals('name'));
    });

    // The permission's description.
    // String description
    test('to test the property `description`', () async {
      // TODO
      final description = instance.description;
      expect(description, isNull);
      instance.description = 'description';
      final result = instance.build();
      expect(result, isA<Permissions>());
      expect(result.description, isA<String>());
      expect(result.description, isNotNull);
      expect(result.description, equals('description'));
    });
  });
}
