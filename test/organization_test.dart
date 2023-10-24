import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for Organization
void main() {
  final instance = OrganizationBuilder();
  // TODO add properties to the builder and call build()

  group(Organization, () {
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = 'code';
      final result = instance.build();
      expect(result.code, isA<String>());
      expect(result.code, isNotNull);
      expect(result.code, equals('code'));
    });

    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = 'name';
      final result = instance.build();
      expect(result, isA<Organization>());
      expect(result.name, isA<String>());
      expect(result.name, isNotNull);
      expect(result.name, equals('name'));
    });

    // bool isDefault
    test('to test the property `isDefault`', () async {
      // TODO
      final isDefault = instance.isDefault;
      expect(isDefault, isNull);
      instance.isDefault = true;
      final result = instance.build();
      expect(result, isA<Organization>());
      expect(result.isDefault, isA<bool>());
      expect(result.isDefault, isTrue);
    });
  });
}
