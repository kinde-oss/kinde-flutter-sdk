import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for UpdateOrganizationUsersResponse
void main() {
  final instance = UpdateOrganizationUsersResponseBuilder();
  // TODO add properties to the builder and call build()

  group(UpdateOrganizationUsersResponse, () {
    // String message
    test('to test the property `message`', () async {
      // TODO
      final message = instance.message;
      expect(message, isNull);
      instance.message = 'message';
      final result = instance.build();
      expect(result, isA<UpdateOrganizationUsersResponse>());
      expect(result.message, isNotNull);
      expect(result.message, isA<String>());
      expect(result.message, contains('message'));
    });

    // BuiltList<String> usersAdded
    test('to test the property `usersAdded`', () async {
      // TODO
      final usersAdded = instance.usersAdded;
      expect(usersAdded.length, isZero);
      instance.usersAdded.add('user1');
      instance.usersAdded.add('user2');
      final result = instance.build();
      expect(result, isA<UpdateOrganizationUsersResponse>());
      expect(result.usersAdded, isNotNull);
      expect(result.usersAdded, isA<BuiltList<String>>());
      expect(result.usersAdded, contains('user1'));
      expect(result.usersAdded, contains('user2'));
    });

    // BuiltList<String> usersUpdated
    test('to test the property `usersUpdated`', () async {
      // TODO
      final usersUpdated = instance.usersUpdated;
      expect(usersUpdated.length, isZero);
      instance.usersUpdated.add('user1');
      instance.usersUpdated.add('user2');
      final result = instance.build();
      expect(result, isA<UpdateOrganizationUsersResponse>());
      expect(result.usersUpdated, isNotNull);
      expect(result.usersUpdated, isA<BuiltList<String>>());
      expect(result.usersUpdated, contains('user1'));
      expect(result.usersUpdated, contains('user2'));
    });

    // BuiltList<String> usersRemoved
    test('to test the property `usersRemoved`', () async {
      // TODO
      final usersRemoved = instance.usersRemoved;
      expect(usersRemoved.length, isZero);
      instance.usersRemoved.add('user1');
      instance.usersRemoved.add('user2');
      final result = instance.build();
      expect(result, isA<UpdateOrganizationUsersResponse>());
      expect(result.usersRemoved, isNotNull);
      expect(result.usersRemoved, isA<BuiltList<String>>());
      expect(result.usersRemoved, contains('user1'));
      expect(result.usersRemoved, contains('user2'));
    });
  });
}
