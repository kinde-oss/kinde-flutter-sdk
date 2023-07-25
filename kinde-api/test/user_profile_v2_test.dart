import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';

// tests for UserProfileV2
void main() {
  final instance = UserProfileV2Builder();
  // TODO add properties to the builder and call build()

  group(UserProfileV2, () {
    // Unique id of the user in Kinde (deprecated).
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // Unique id of the user in Kinde.
    // String sub
    test('to test the property `sub`', () async {
      // TODO
    });

    // Value of the user's id in a third-party system when the user is imported into Kinde.
    // String providedId
    test('to test the property `providedId`', () async {
      // TODO
    });

    // Users's first and last name separated by a space.
    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // User's first name.
    // String givenName
    test('to test the property `givenName`', () async {
      // TODO
    });

    // User's last name.
    // String familyName
    test('to test the property `familyName`', () async {
      // TODO
    });

    // Date the user was last updated at (In Unix time).
    // int updatedAt
    test('to test the property `updatedAt`', () async {
      // TODO
    });

    // User's email address if available.
    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // URL that point's to the user's picture or avatar
    // String picture
    test('to test the property `picture`', () async {
      // TODO
    });

  });
}
