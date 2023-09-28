import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for CreateRoleRequest
void main() {
  final instance = CreateRoleRequestBuilder();
  // TODO add properties to the builder and call build()

  group(CreateRoleRequest, () {
    // The role's name.
    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = "NAME";
      final result = instance.build();
      expect(result.name, isA<String>());
      expect(result.name, isNotNull);
    });

    // The role's description.
    // String description
    test('to test the property `description`', () async {
      // TODO
      final description = instance.description;
      expect(description, isNull);
      instance.description = 'description';
      final result = instance.build();
      expect(result, isA<CreateRoleRequest>());
      expect(result.description, isA<String>());
      expect(result.description, isNotNull);
      expect(result.description, equals('description'));
    });

    // The role identifier to use in code.
    // String key
    test('to test the property `key`', () async {
      // TODO
      final key = instance.key;
      expect(key, isNull);
      instance.key = 'key';
      final result = instance.build();
      expect(result, isA<CreateRoleRequest>());
      expect(result.key, isA<String>());
      expect(result.key, isNotNull);
      expect(result.key, equals('key'));
    });

    // Set role as default for new users.
    // bool isDefaultRole
    test('to test the property `isDefaultRole`', () async {
      // TODO
      final isDefaultRole = instance.isDefaultRole;
      expect(isDefaultRole, isNull);
      instance.isDefaultRole = true;
      final result = instance.build();
      expect(result, isA<CreateRoleRequest>());
      expect(result.isDefaultRole, isA<bool>());
      expect(result.isDefaultRole, isTrue);
    });
  });
}
