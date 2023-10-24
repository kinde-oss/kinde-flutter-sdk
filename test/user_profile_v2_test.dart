import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for UserProfileV2
void main() {
  final instance = UserProfileV2Builder();
  // TODO add properties to the builder and call build()

  group(UserProfileV2, () {
    // Unique id of the user in Kinde (deprecated).
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<UserProfileV2>());
      expect(result.id, isNotNull);
      expect(result.id, isA<String>());
      expect(result.id, contains('id'));
    });

    // Unique id of the user in Kinde.
    // String sub
    test('to test the property `sub`', () async {
      // TODO
      final sub = instance.sub;
      expect(sub, isNull);
      instance.sub = 'sub';
      final result = instance.build();
      expect(result, isA<UserProfileV2>());
      expect(result.sub, isNotNull);
      expect(result.sub, isA<String>());
      expect(result.sub, contains('sub'));
    });

    // Value of the user's id in a third-party system when the user is imported into Kinde.
    // String providedId
    test('to test the property `providedId`', () async {
      // TODO
      final providedId = instance.providedId;
      expect(providedId, isNull);
      instance.providedId = 'providedId';
      final result = instance.build();
      expect(result, isA<UserProfileV2>());
      expect(result.providedId, isNotNull);
      expect(result.providedId, isA<String>());
      expect(result.providedId, contains('providedId'));
    });

    // Users's first and last name separated by a space.
    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = 'name';
      final result = instance.build();
      expect(result, isA<UserProfileV2>());
      expect(result.name, isNotNull);
      expect(result.name, isA<String>());
      expect(result.name, contains('name'));
    });

    // User's first name.
    // String givenName
    test('to test the property `givenName`', () async {
      // TODO
      final givenName = instance.givenName;
      expect(givenName, isNull);
      instance.givenName = 'givenName';
      final result = instance.build();
      expect(result, isA<UserProfileV2>());
      expect(result.givenName, isNotNull);
      expect(result.givenName, isA<String>());
      expect(result.givenName, contains('givenName'));
    });

    // User's last name.
    // String familyName
    test('to test the property `familyName`', () async {
      // TODO
      final familyName = instance.familyName;
      expect(familyName, isNull);
      instance.familyName = 'familyName';
      final result = instance.build();
      expect(result, isA<UserProfileV2>());
      expect(result.familyName, isNotNull);
      expect(result.familyName, isA<String>());
      expect(result.familyName, contains('familyName'));
    });

    // Date the user was last updated at (In Unix time).
    // int updatedAt
    test('to test the property `updatedAt`', () async {
      // TODO
      final updatedAt = instance.updatedAt;
      expect(updatedAt, isNull);
      instance.updatedAt = 00;
      final result = instance.build();
      expect(result, isA<UserProfileV2>());
      expect(result.updatedAt, isNotNull);
      expect(result.updatedAt, isA<int>());
      expect(result.updatedAt, 00);
    });

    // User's email address if available.
    // String email
    test('to test the property `email`', () async {
      // TODO
      final email = instance.email;
      expect(email, isNull);
      instance.email = 'email';
      final result = instance.build();
      expect(result, isA<UserProfileV2>());
      expect(result.email, isNotNull);
      expect(result.email, isA<String>());
      expect(result.email, equals('email'));
    });

    // URL that point's to the user's picture or avatar
    // String picture
    test('to test the property `picture`', () async {
      // TODO
      final picture = instance.picture;
      expect(picture, isNull);
      instance.picture = 'picture';
      final result = instance.build();
      expect(result, isA<UserProfileV2>());
      expect(result.picture, isNotNull);
      expect(result.picture, isA<String>());
      expect(result.picture, equals('picture'));
    });
  });
}
