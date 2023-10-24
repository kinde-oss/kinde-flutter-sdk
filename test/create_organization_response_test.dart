import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for CreateOrganizationResponse
void main() {
  final instance = CreateOrganizationResponseBuilder();
  // TODO add properties to the builder and call build()

  group(CreateOrganizationResponse, () {
    // String message
    test('to test the property `message`', () async {
      // TODO
      final message = instance.message;
      expect(message, isNull);
      instance.message = "MESSAGE";
      final result = instance.build();
      expect(result.message, isA<String>());
      expect(result.message, isNotNull);
    });

    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = "CODE";
      final result = instance.build();
      expect(result.code, isA<String>());
      expect(result.code, isNotNull);
    });

    // CreateOrganizationResponseOrganization organization
    test('to test the property `organization`', () async {
      // TODO
      final organization = instance.organization;
      expect(
          organization, isA<CreateOrganizationResponseOrganizationBuilder>());
      var organizationValue = CreateOrganizationResponseOrganizationBuilder();
      organizationValue.code = 'code';
      instance.organization = organizationValue;
      final result = instance.build();
      expect(result, isA<CreateOrganizationResponse>());
      expect(result.organization, isNotNull);
      expect(result.organization?.code, equals('code'));
    });
  });
}
