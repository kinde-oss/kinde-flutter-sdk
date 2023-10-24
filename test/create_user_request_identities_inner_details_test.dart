import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for CreateUserRequestIdentitiesInnerDetails
void main() {
  final instance = CreateUserRequestIdentitiesInnerDetailsBuilder();
  // TODO add properties to the builder and call build()

  group(CreateUserRequestIdentitiesInnerDetails, () {
    // The email address of the user.
    // String email
    test('to test the property `email`', () async {
      // TODO
      final email = instance.email;
      expect(email, isNull);
      instance.email = 'email';
      final result = instance.build();
      expect(result, isA<CreateUserRequestIdentitiesInnerDetails>());
      expect(result.email, isA<String>());
      expect(result.email, isNotNull);
      expect(result.email, equals('email'));
    });
  });
}
