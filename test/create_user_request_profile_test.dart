import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for CreateUserRequestProfile
void main() {
  final instance = CreateUserRequestProfileBuilder();
  // TODO add properties to the builder and call build()

  group(CreateUserRequestProfile, () {
    // User's first name.
    // String givenName
    test('to test the property `givenName`', () async {
      // TODO
      final givenName = instance.givenName;
      expect(givenName, isNull);
      instance.givenName = 'givenName';
      final result = instance.build();
      expect(result, isA<CreateUserRequestProfile>());
      expect(result.givenName, isA<String>());
      expect(result.givenName, isNotNull);
      expect(result.givenName, equals('givenName'));
    });

    // User's last name.
    // String familyName
    test('to test the property `familyName`', () async {
      // TODO
      final familyName = instance.familyName;
      expect(familyName, isNull);
      instance.familyName = 'familyName';
      final result = instance.build();
      expect(result, isA<CreateUserRequestProfile>());
      expect(result.familyName, isA<String>());
      expect(result.familyName, isNotNull);
      expect(result.familyName, equals('familyName'));
    });
  });
}
