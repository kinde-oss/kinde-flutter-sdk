import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for UserProfile
void main() {
  final instance = UserProfileBuilder();
  // TODO add properties to the builder and call build()

  group(UserProfile, () {
    // Unique id of the user in Kinde.
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<UserProfile>());
      expect(result.id, isNotNull);
      expect(result.id, isA<String>());
      expect(result.id, contains('id'));
    });

    // Default email address of the user in Kinde.
    // String preferredEmail
    test('to test the property `preferredEmail`', () async {
      // TODO
      final preferredEmail = instance.preferredEmail;
      expect(preferredEmail, isNull);
      instance.preferredEmail = 'preferredEmail';
      final result = instance.build();
      expect(result, isA<UserProfile>());
      expect(result.preferredEmail, isNotNull);
      expect(result.preferredEmail, isA<String>());
      expect(result.preferredEmail, contains('preferredEmail'));
    });

    // Value of the user's id in a third-party system when the user is imported into Kinde.
    // String providedId
    test('to test the property `providedId`', () async {
      // TODO
      final providedId = instance.providedId;
      expect(providedId, isNull);
      instance.providedId = 'providedId';
      final result = instance.build();
      expect(result, isA<UserProfile>());
      expect(result.providedId, isNotNull);
      expect(result.providedId, isA<String>());
      expect(result.providedId, contains('providedId'));
    });

    // User's last name.
    // String lastName
    test('to test the property `lastName`', () async {
      // TODO
      final lastName = instance.lastName;
      expect(lastName, isNull);
      instance.lastName = 'lastName';
      final result = instance.build();
      expect(result, isA<UserProfile>());
      expect(result.lastName, isNotNull);
      expect(result.lastName, isA<String>());
      expect(result.lastName, contains('lastName'));
    });

    // User's first name.
    // String firstName
    test('to test the property `firstName`', () async {
      // TODO
      final firstName = instance.firstName;
      expect(firstName, isNull);
      instance.firstName = 'firstName';
      final result = instance.build();
      expect(result, isA<UserProfile>());
      expect(result.firstName, isNotNull);
      expect(result.firstName, isA<String>());
      expect(result.firstName, contains('firstName'));
    });

    // URL that point's to the user's picture or avatar
    // String picture
    test('to test the property `picture`', () async {
      // TODO
      final picture = instance.picture;
      expect(picture, isNull);
      instance.picture = 'picture';
      final result = instance.build();
      expect(result, isA<UserProfile>());
      expect(result.picture, isNotNull);
      expect(result.picture, isA<String>());
      expect(result.picture, contains('picture'));
    });
  });
}
