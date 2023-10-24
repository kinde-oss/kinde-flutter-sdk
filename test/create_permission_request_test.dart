import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for CreatePermissionRequest
void main() {
  final instance = CreatePermissionRequestBuilder();
  // TODO add properties to the builder and call build()

  group(CreatePermissionRequest, () {
    // The permission's name.
    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = 'name';
      final result = instance.build();
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
      expect(result.description, isA<String>());
      expect(result.description, isNotNull);
      expect(result.description, equals('description'));
    });

    // The permission identifier to use in code.
    // String key
    test('to test the property `key`', () async {
      // TODO
      final key = instance.key;
      expect(key, isNull);
      instance.key = 'key';
      final result = instance.build();
      expect(result, isA<CreatePermissionRequest>());
      expect(result.key, isA<String>());
      expect(result.key, isNotNull);
      expect(result.key, equals('key'));
    });
  });
}
