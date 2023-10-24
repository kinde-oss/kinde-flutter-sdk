import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for UpdateOrganizationRequest
void main() {
  final instance = UpdateOrganizationRequestBuilder();
  // TODO add properties to the builder and call build()

  group(UpdateOrganizationRequest, () {
    // The organization's name.
    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = 'name';
      final result = instance.build();
      expect(result, isA<UpdateOrganizationRequest>());
      expect(result.name, isNotNull);
      expect(result.name, equals('name'));
    });

    // The organization's ID.
    // String externalId
    test('to test the property `externalId`', () async {
      // TODO
      final externalId = instance.externalId;
      expect(externalId, isNull);
      instance.externalId = 'externalId';
      final result = instance.build();
      expect(result, isA<UpdateOrganizationRequest>());
      expect(result.externalId, isNotNull);
      expect(result.externalId, equals('externalId'));
    });

    // The organization's brand settings - background color.
    // String backgroundColor
    test('to test the property `backgroundColor`', () async {
      // TODO
      final backgroundColor = instance.backgroundColor;
      expect(backgroundColor, isNull);
      instance.backgroundColor = 'backgroundColor';
      final result = instance.build();
      expect(result, isA<UpdateOrganizationRequest>());
      expect(result.externalId, isNotNull);
      expect(result.externalId, equals('externalId'));
    });

    // The organization's brand settings - button color.
    // String buttonColor
    test('to test the property `buttonColor`', () async {
      // TODO
      final buttonColor = instance.buttonColor;
      expect(buttonColor, isNull);
      instance.buttonColor = 'buttonColor';
      final result = instance.build();
      expect(result, isA<UpdateOrganizationRequest>());
      expect(result.buttonColor, isNotNull);
      expect(result.buttonColor, equals('buttonColor'));
    });

    // The organization's brand settings - button text color.
    // String buttonTextColor
    test('to test the property `buttonTextColor`', () async {
      // TODO
      final buttonTextColor = instance.buttonTextColor;
      expect(buttonTextColor, isNull);
      instance.buttonTextColor = 'buttonTextColor';
      final result = instance.build();
      expect(result, isA<UpdateOrganizationRequest>());
      expect(result.buttonTextColor, isNotNull);
      expect(result.buttonTextColor, equals('buttonTextColor'));
    });

    // The organization's brand settings - link color.
    // String linkColor
    test('to test the property `linkColor`', () async {
      // TODO
      final linkColor = instance.linkColor;
      expect(linkColor, isNull);
      instance.linkColor = 'linkColor';
      final result = instance.build();
      expect(result, isA<UpdateOrganizationRequest>());
      expect(result.linkColor, isNotNull);
      expect(result.linkColor, equals('linkColor'));
    });
  });
}
