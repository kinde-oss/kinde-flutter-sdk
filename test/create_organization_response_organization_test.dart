import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for CreateOrganizationResponseOrganization
void main() {
  final instance = CreateOrganizationResponseOrganizationBuilder();
  // TODO add properties to the builder and call build()

  group(CreateOrganizationResponseOrganization, () {
    // The organization's code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = "code";
      final result = instance.build();
      expect(result, isA<CreateOrganizationResponseOrganization>());
      expect(result.code, isA<String>());
      expect(result.code, isNotNull);
      expect(result.code, equals('code'));
    });
  });
}
