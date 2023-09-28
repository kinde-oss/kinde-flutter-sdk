import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for User
void main() {
  final instance = UserBuilder();
  // TODO add properties to the builder and call build()

  group(User, () {
    // Unique id of the user in Kinde.
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<User>());
      expect(result.id, isNotNull);
      expect(result.id, isA<String>());
      expect(result.id, equals('id'));
    });

    // External id for user.
    // String providedId
    test('to test the property `providedId`', () async {
      // TODO
      final providedId = instance.providedId;
      expect(providedId, isNull);
      instance.providedId = 'providedId';
      final result = instance.build();
      expect(result, isA<User>());
      expect(result.providedId, isNotNull);
      expect(result.providedId, isA<String>());
      expect(result.providedId, equals('providedId'));
    });

    // Default email address of the user in Kinde.
    // String email
    test('to test the property `preferredEmail`', () async {
      // TODO
      final preferredEmail = instance.preferredEmail;
      expect(preferredEmail, isNull);
      instance.preferredEmail = 'preferredEmail';
      final result = instance.build();
      expect(result, isA<User>());
      expect(result.preferredEmail, isNotNull);
      expect(result.preferredEmail, isA<String>());
      expect(result.preferredEmail, equals('preferredEmail'));
    });

    // User's last name.
    // String lastName
    test('to test the property `lastName`', () async {
      // TODO
      final lastName = instance.lastName;
      expect(lastName, isNull);
      instance.lastName = 'lastName';
      final result = instance.build();
      expect(result, isA<User>());
      expect(result.lastName, isNotNull);
      expect(result.lastName, isA<String>());
      expect(result.lastName, equals('lastName'));
    });

    // User's first name.
    // String firstName
    test('to test the property `firstName`', () async {
      // TODO
      final firstName = instance.firstName;
      expect(firstName, isNull);
      instance.firstName = 'firstName';
      final result = instance.build();
      expect(result, isA<User>());
      expect(result.firstName, isNotNull);
      expect(result.firstName, isA<String>());
      expect(result.firstName, equals('firstName'));
    });

    // Whether the user is currently suspended or not.
    // bool isSuspended
    test('to test the property `isSuspended`', () async {
      // TODO
      final isSuspended = instance.isSuspended;
      expect(isSuspended, isNull);
      instance.isSuspended = true;
      final result = instance.build();
      expect(result, isA<User>());
      expect(result.isSuspended, isNotNull);
      expect(result.isSuspended, isA<bool>());
      expect(result.isSuspended, isTrue);
    });

    // User's profile picture URL.
    // String picture
    test('to test the property `picture`', () async {
      // TODO
      final picture = instance.picture;
      expect(picture, isNull);
      instance.picture = 'picture';
      final result = instance.build();
      expect(result, isA<User>());
      expect(result.picture, isNotNull);
      expect(result.picture, isA<String>());
      expect(result.picture, equals('picture'));
    });

    // Total number of user sign ins.
    // int totalSignIns
    test('to test the property `totalSignIns`', () async {
      // TODO
      final totalSignIns = instance.totalSignIns;
      expect(totalSignIns, isNull);
      instance.totalSignIns = 1;
      final result = instance.build();
      expect(result, isA<User>());
      expect(result.totalSignIns, isNotNull);
      expect(result.totalSignIns, isA<int>());
      expect(result.totalSignIns, equals(1));
    });

    // Number of consecutive failed user sign ins.
    // int failedSignIns
    test('to test the property `failedSignIns`', () async {
      // TODO
      final failedSignIns = instance.failedSignIns;
      expect(failedSignIns, isNull);
      instance.failedSignIns = 1;
      final result = instance.build();
      expect(result, isA<User>());
      expect(result.failedSignIns, isNotNull);
      expect(result.failedSignIns, isA<int>());
      expect(result.failedSignIns, equals(1));
    });

    // Last sign in date in ISO 8601 format.
    // String lastSignedIn
    test('to test the property `lastSignedIn`', () async {
      // TODO
      final lastSignedIn = instance.lastSignedIn;
      expect(lastSignedIn, isNull);
      instance.lastSignedIn = 'Yesterday';
      final result = instance.build();
      expect(result, isA<User>());
      expect(result.lastSignedIn, isNotNull);
      expect(result.lastSignedIn, isA<String>());
      expect(result.lastSignedIn, equals('Yesterday'));
    });

    // Date of user creation in ISO 8601 format.
    // String createdOn
    test('to test the property `createdOn`', () async {
      // TODO
      final createdOn = instance.createdOn;
      expect(createdOn, isNull);
      instance.createdOn = 'Today';
      final result = instance.build();
      expect(result, isA<User>());
      expect(result.createdOn, isNotNull);
      expect(result.createdOn, isA<String>());
      expect(result.createdOn, equals('Today'));
    });
  });
}
