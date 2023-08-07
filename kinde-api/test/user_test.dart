import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';

// tests for User
void main() {
  final instance = UserBuilder();
  // TODO add properties to the builder and call build()

  group(User, () {
    // Unique id of the user in Kinde.
    // String id
    test('to test the property `id`', () async {
      // TODO
    });

    // External id for user.
    // String providedId
    test('to test the property `providedId`', () async {
      // TODO
    });

    // Default email address of the user in Kinde.
    // String email
    test('to test the property `email`', () async {
      // TODO
    });

    // User's last name.
    // String lastName
    test('to test the property `lastName`', () async {
      // TODO
    });

    // User's first name.
    // String firstName
    test('to test the property `firstName`', () async {
      // TODO
    });

    // User's full name.
    // String fullName
    test('to test the property `fullName`', () async {
      // TODO
    });

    // Whether the user is currently suspended or not.
    // bool isSuspended
    test('to test the property `isSuspended`', () async {
      // TODO
    });

    // User's profile picture URL.
    // String picture
    test('to test the property `picture`', () async {
      // TODO
    });

    // Whether the user has been asked to reset their password.
    // bool isPasswordResetRequested
    test('to test the property `isPasswordResetRequested`', () async {
      // TODO
    });

    // Total number of user sign ins.
    // int totalSignIns
    test('to test the property `totalSignIns`', () async {
      // TODO
    });

    // Number of consecutive failed user sign ins.
    // int failedSignIns
    test('to test the property `failedSignIns`', () async {
      // TODO
    });

    // Last sign in date in ISO 8601 format.
    // String lastSignedIn
    test('to test the property `lastSignedIn`', () async {
      // TODO
    });

    // Date of user creation in ISO 8601 format.
    // String createdOn
    test('to test the property `createdOn`', () async {
      // TODO
    });

  });
}
