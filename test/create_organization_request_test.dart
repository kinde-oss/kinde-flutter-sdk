import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for CreateOrganizationRequest
void main() {
  final instance = CreateOrganizationRequestBuilder();
  // TODO add properties to the builder and call build()

  group(CreateOrganizationRequest, () {
    // The organization's name.
    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = 'name';
      final result = instance.build();
      expect(result, isA<CreateOrganizationRequest>());
      expect(result.name, isNotNull);
      expect(result.name, equals('name'));
    });

    // The organization's feature flag settings.
    // BuiltMap<String, String> featureFlags
    test('to test the property `featureFlags`', () async {
      // TODO
      var featureFlagsBuilder =
          MapBuilder<String, CreateOrganizationRequestFeatureFlagsEnum>();
      featureFlagsBuilder['flag1'] =
          CreateOrganizationRequestFeatureFlagsEnum.str;
      featureFlagsBuilder['flag2'] =
          CreateOrganizationRequestFeatureFlagsEnum.str;
      instance.featureFlags = featureFlagsBuilder;
      final result = instance.build();
      expect(result.featureFlags,
          isA<BuiltMap<String, CreateOrganizationRequestFeatureFlagsEnum?>>());
      expect(result.featureFlags, isNotEmpty);
      final expectedFlags = result.featureFlags;
      expect(expectedFlags?.length, isNonZero);
    });

    // The organization's ID.
    // String externalId
    test('to test the property `externalId`', () async {
      // TODO
      final externalId = instance.externalId;
      expect(externalId, isNull);
      instance.externalId = "externalId";
      final result = instance.build();
      expect(result, isA<CreateOrganizationRequest>());
      expect(result.externalId, isNotNull);
      expect(result.externalId, equals('externalId'));
    });

    // The organization's brand settings - background color.
    // String backgroundColor
    test('to test the property `backgroundColor`', () async {
      // TODO
      final backgroundColor = instance.backgroundColor;
      expect(backgroundColor, isNull);
      instance.backgroundColor = "backgroundColor";
      final result = instance.build();
      expect(result, isA<CreateOrganizationRequest>());
      expect(result.backgroundColor, isA<String>());
      expect(result.backgroundColor, isNotNull);
      expect(result.backgroundColor, equals('backgroundColor'));
    });

    // The organization's brand settings - button color.
    // String buttonColor
    test('to test the property `buttonColor`', () async {
      // TODO
      final buttonColor = instance.buttonColor;
      expect(buttonColor, isNull);
      instance.buttonColor = "buttonColor";
      final result = instance.build();
      expect(result.buttonColor, isA<String>());
      expect(result.buttonColor, isNotNull);
      expect(result.buttonColor, equals('buttonColor'));
    });

    // The organization's brand settings - button text color.
    // String buttonTextColor
    test('to test the property `buttonTextColor`', () async {
      // TODO
      final buttonTextColor = instance.buttonTextColor;
      expect(buttonTextColor, isNull);
      instance.buttonTextColor = "buttonTextColor";
      final result = instance.build();
      expect(result, isA<CreateOrganizationRequest>());
      expect(result.buttonTextColor, isA<String>());
      expect(result.buttonTextColor, isNotNull);
      expect(result.buttonTextColor, equals('buttonTextColor'));
    });

    // The organization's brand settings - link color.
    // String linkColor
    test('to test the property `linkColor`', () async {
      // TODO
      final linkColor = instance.linkColor;
      expect(linkColor, isNull);
      instance.linkColor = "linkColor";
      final result = instance.build();
      expect(result, isA<CreateOrganizationRequest>());
      expect(result.linkColor, isA<String>());
      expect(result.linkColor, isNotNull);
      expect(result.linkColor, equals('linkColor'));
    });
  });
}
