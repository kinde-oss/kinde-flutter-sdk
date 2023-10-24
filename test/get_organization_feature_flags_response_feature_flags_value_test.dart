import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for GetOrganizationFeatureFlagsResponseFeatureFlagsValue
void main() {
  final instance =
      GetOrganizationFeatureFlagsResponseFeatureFlagsValueBuilder();
  // TODO add properties to the builder and call build()

  group(GetOrganizationFeatureFlagsResponseFeatureFlagsValue, () {
    // String type
    test('to test the property `type`', () async {
      // TODO
      final type = instance.type;
      expect(type,
          isA<GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum?>());
      instance.type =
          GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum.str;
      final result = instance.build();
      expect(
          result, isA<GetOrganizationFeatureFlagsResponseFeatureFlagsValue>());
      expect(result.type, isNotNull);
      expect(result.type,
          isA<GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum>());
      expect(
          result.type,
          equals(GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum
              .str));
    });

    // String value
    test('to test the property `value`', () async {
      // TODO
      final value = instance.value;
      expect(value, isNull);
      instance.value = 'value';
      final result = instance.build();
      expect(
          result, isA<GetOrganizationFeatureFlagsResponseFeatureFlagsValue>());
      expect(result.value, isA<String>());
      expect(result.value, isNotNull);
      expect(result.value, equals('value'));
    });
  });
}
