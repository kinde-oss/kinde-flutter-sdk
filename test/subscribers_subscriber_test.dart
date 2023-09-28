import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for SubscribersSubscriber
void main() {
  final instance = SubscribersSubscriberBuilder();
  // TODO add properties to the builder and call build()

  group(SubscribersSubscriber, () {
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<SubscribersSubscriber>());
      expect(result.id, isNotNull);
      expect(result.id, isA<String>());
      expect(result.id, contains('id'));
    });

    // String email
    test('to test the property `email`', () async {
      // TODO
      final email = instance.email;
      expect(email, isNull);
      instance.email = 'email';
      final result = instance.build();
      expect(result, isA<SubscribersSubscriber>());
      expect(result.email, isNotNull);
      expect(result.email, isA<String>());
      expect(result.email, contains('email'));
    });

    // String fullName
    test('to test the property `fullName`', () async {
      // TODO
      final fullName = instance.fullName;
      expect(fullName, isNull);
      instance.fullName = 'fullName';
      final result = instance.build();
      expect(result, isA<SubscribersSubscriber>());
      expect(result.fullName, isNotNull);
      expect(result.fullName, isA<String>());
      expect(result.fullName, contains('fullName'));
    });

    // String firstName
    test('to test the property `firstName`', () async {
      // TODO
      final firstName = instance.firstName;
      expect(firstName, isNull);
      instance.firstName = 'firstName';
      final result = instance.build();
      expect(result, isA<SubscribersSubscriber>());
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
      expect(result, isA<SubscribersSubscriber>());
      expect(result.lastName, isNotNull);
      expect(result.lastName, isA<String>());
      expect(result.lastName, contains('lastName'));
    });
  });
}
