import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for UpdateUserRequest
void main() {
  final instance = UpdateUserRequestBuilder();
  // TODO add properties to the builder and call build()

  group(UpdateUserRequest, () {
    // User's first name.
    // String givenName
    test('to test the property `givenName`', () async {
      // TODO
      final givenName = instance.givenName;
      expect(givenName, isNull);
      instance.givenName = 'givenName';
      final result = instance.build();
      expect(result, isA<UpdateUserRequest>());
      expect(result.givenName, isNotNull);
      expect(result.givenName, isA<String>());
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
      expect(result, isA<UpdateUserRequest>());
      expect(result.familyName, isNotNull);
      expect(result.familyName, isA<String>());
      expect(result.familyName, equals('familyName'));
    });

    // Whether the user is currently suspended or not.
    // bool isSuspended
    test('to test the property `isSuspended`', () async {
      // TODO
      final isSuspended = instance.isSuspended;
      expect(isSuspended, isNull);
      instance.isSuspended = true;
      final result = instance.build();
      expect(result, isA<UpdateUserRequest>());
      expect(result.isSuspended, isNotNull);
      expect(result.isSuspended, isA<bool>());
      expect(result.isSuspended, isTrue);
    });

    // Prompt the user to change their password on next sign in.
    // bool isPasswordResetRequested
    test('to test the property `isPasswordResetRequested`', () async {
      // TODO
      final isPasswordResetRequested = instance.isPasswordResetRequested;
      expect(isPasswordResetRequested, isNull);
      instance.isPasswordResetRequested = true;
      final result = instance.build();
      expect(result, isA<UpdateUserRequest>());
      expect(result.isPasswordResetRequested, isNotNull);
      expect(result.isPasswordResetRequested, isA<bool>());
      expect(result.isPasswordResetRequested, isTrue);
    });
  });
}
