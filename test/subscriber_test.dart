import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for Subscriber
void main() {
  final instance = SubscriberBuilder();
  // TODO add properties to the builder and call build()

  group(Subscriber, () {
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<Subscriber>());
      expect(result.id, isNotNull);
      expect(result.id, isA<String>());
      expect(result.id, contains('id'));
    });

    // String preferredEmail
    test('to test the property `preferredEmail`', () async {
      // TODO
      final preferredEmail = instance.preferredEmail;
      expect(preferredEmail, isNull);
      instance.preferredEmail = 'preferredEmail';
      final result = instance.build();
      expect(result, isA<Subscriber>());
      expect(result.preferredEmail, isNotNull);
      expect(result.preferredEmail, isA<String>());
      expect(result.preferredEmail, contains('preferredEmail'));
    });

    // String firstName
    test('to test the property `firstName`', () async {
      // TODO
      final firstName = instance.firstName;
      expect(firstName, isNull);
      instance.firstName = 'firstName';
      final result = instance.build();
      expect(result, isA<Subscriber>());
      expect(result.firstName, isNotNull);
      expect(result.firstName, isA<String>());
      expect(result.firstName, contains('firstName'));
    });

    // String lastName
    test('to test the property `lastName`', () async {
      // TODO
      final lastName = instance.lastName;
      expect(lastName, isNull);
      instance.lastName = 'lastName';
      final result = instance.build();
      expect(result, isA<Subscriber>());
      expect(result.lastName, isNotNull);
      expect(result.lastName, isA<String>());
      expect(result.lastName, contains('lastName'));
    });
  });
}
