import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for CreateFeatureFlagRequest
void main() {
  final instance = CreateFeatureFlagRequestBuilder();
  // TODO add properties to the builder and call build()
  instance.allowOverrideLevel =
      CreateFeatureFlagRequestAllowOverrideLevelEnum.env;
  instance.description = 'description';
  instance.name = 'name';
  instance.key = 'key';
  instance.type = CreateFeatureFlagRequestTypeEnum.str;
  instance.defaultValue = 'defaultvalue';

  group(CreateFeatureFlagRequest, () {
    // The name of the flag.
    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNotNull);
      instance.name = 'name';
      final result = instance.build();
      expect(result, isA<CreateFeatureFlagRequest>());
      expect(result.name, isNotNull);
      expect(result.name, 'name');
    });

    // Description of the flag purpose.
    // String description
    test('to test the property `description`', () async {
      // TODO
      final description = instance.description;
      expect(description, isNotNull);
      instance.description = 'description';
      final result = instance.build();
      expect(result, isA<CreateFeatureFlagRequest>());
      expect(result.description, isNotNull);
      expect(result.description, equals('description'));
    });

    // The flag identifier to use in code.
    // String key
    test('to test the property `key`', () async {
      // TODO
      final key = instance.key;
      expect(key, isNotNull);
      instance.key = 'key';
      final result = instance.build();
      expect(result, isA<CreateFeatureFlagRequest>());
      expect(result.key, isNotNull);
      expect(result.key, equals('key'));
    });

    // The variable type.
    // String type
    test('to test the property `type`', () async {
      // TODO
      final type = instance.type;
      expect(type, isNotNull);
      instance.type = CreateFeatureFlagRequestTypeEnum.str;
      final resultStr = instance.build();
      expect(resultStr, isA<CreateFeatureFlagRequest>());
      expect(resultStr.type, isNotNull);
      expect(resultStr.type, equals(CreateFeatureFlagRequestTypeEnum.str));

      instance.type = CreateFeatureFlagRequestTypeEnum.bool_;
      final resultBool = instance.build();
      expect(resultBool, isA<CreateFeatureFlagRequest>());
      expect(resultBool.type, isNotNull);
      expect(resultBool.type, equals(CreateFeatureFlagRequestTypeEnum.bool_));

      instance.type = CreateFeatureFlagRequestTypeEnum.int_;
      final resultInt = instance.build();
      expect(resultInt, isA<CreateFeatureFlagRequest>());
      expect(resultInt.type, isNotNull);
      expect(resultInt.type, equals(CreateFeatureFlagRequestTypeEnum.int_));
    });

    // Allow the flag to be overridden at a different level.
    // String allowOverrideLevel
    test('to test the property `allowOverrideLevel`', () async {
      // TODO
      final allowOverrideLevel = instance.allowOverrideLevel;
      expect(allowOverrideLevel, isNotNull);
      instance.allowOverrideLevel =
          CreateFeatureFlagRequestAllowOverrideLevelEnum.env;
      final resultEnv = instance.build();
      expect(resultEnv, isA<CreateFeatureFlagRequest>());
      expect(resultEnv.allowOverrideLevel, isNotNull);
      expect(resultEnv.allowOverrideLevel,
          equals(CreateFeatureFlagRequestAllowOverrideLevelEnum.env));

      instance.allowOverrideLevel =
          CreateFeatureFlagRequestAllowOverrideLevelEnum.org;
      final resultOrg = instance.build();
      expect(resultOrg, isA<CreateFeatureFlagRequest>());
      expect(resultOrg.allowOverrideLevel, isNotNull);
      expect(resultOrg.allowOverrideLevel,
          equals(CreateFeatureFlagRequestAllowOverrideLevelEnum.org));
    });

    // Default value for the flag used by environments and organizations.
    // String defaultValue
    test('to test the property `defaultValue`', () async {
      // TODO
      final defaultValue = instance.defaultValue;
      expect(defaultValue, isNotNull);
      instance.defaultValue = 'defaultValue';
      final result = instance.build();
      expect(result, isA<CreateFeatureFlagRequest>());
      expect(result.defaultValue, isNotNull);
      expect(result.defaultValue, equals('defaultValue'));
    });
  });
}
