import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for UpdateRolesRequest
void main() {
  final instance = UpdateRolesRequestBuilder();
  // TODO add properties to the builder and call build()

  group(UpdateRolesRequest, () {
    // The role's name.
    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = 'name';
      instance.key = 'key';
      final result = instance.build();
      expect(result, isA<UpdateRolesRequest>());
      expect(result.key, isNotNull);
      expect(result.name, isNotNull);
      expect(result.name, isA<String>());
      expect(result.name, contains('name'));
    });

    // The role's description.
    // String description
    test('to test the property `description`', () async {
      // TODO
      final description = instance.description;
      expect(description, isNull);
      instance.description = 'description';
      instance.name = 'name';
      instance.key = 'key';
      final result = instance.build();
      expect(result, isA<UpdateRolesRequest>());
      expect(result.name, isNotNull);
      expect(result.key, isNotNull);
      expect(result.description, isNotNull);
      expect(result.description, isA<String>());
      expect(result.description, contains('description'));
    });

    // The role identifier to use in code.
    // String key
    test('to test the property `key`', () async {
      // TODO
      instance.key = 'key';
      instance.name = 'name';
      final result = instance.build();
      expect(result, isA<UpdateRolesRequest>());
      expect(result.name, isNotNull);
      expect(result.key, isNotNull);
      expect(result.key, isA<String>());
      expect(result.key, contains('key'));
    });

    // Set role as default for new users.
    // bool isDefaultRole
    test('to test the property `isDefaultRole`', () async {
      // TODO
      final isDefaultRole = instance.isDefaultRole;
      expect(isDefaultRole, isNull);
      instance.isDefaultRole = true;
      instance.name = 'name';
      instance.key = 'key';
      final result = instance.build();
      expect(result, isA<UpdateRolesRequest>());
      expect(result.name, isNotNull);
      expect(result.isDefaultRole, isNotNull);
      expect(result.isDefaultRole, isA<bool>());
      expect(result.isDefaultRole, isTrue);
    });
  });
}
