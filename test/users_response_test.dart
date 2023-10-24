import 'package:kinde_flutter_sdk/src/model/users_response_users_inner.dart';
import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for UsersResponse
void main() {
  final instance = UsersResponseBuilder();
  // TODO add properties to the builder and call build()

  group(UsersResponse, () {
    // Response code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = 'code';
      final result = instance.build();
      expect(result, isA<UsersResponse>());
      expect(result.code, isNotNull);
      expect(result.code, isA<String>());
      expect(result.code, equals('code'));
    });

    // Response message.
    // String message
    test('to test the property `message`', () async {
      // TODO
      final message = instance.message;
      expect(message, isNull);
      instance.message = 'message';
      final result = instance.build();
      expect(result, isA<UsersResponse>());
      expect(result.message, isNotNull);
      expect(result.message, isA<String>());
      expect(result.message, equals('message'));
    });

    // BuiltList<User> users
    test('to test the property `users`', () async {
      // TODO
      final users = instance.users;
      expect(users.length, isZero);
      UsersResponseUsersInner user1 = UsersResponseUsersInner();
      UsersResponseUsersInner user2 = UsersResponseUsersInner();
      instance.users.add(user1);
      instance.users.add(user2);
      final result = instance.build();
      expect(result, isA<UsersResponse>());
      expect(result.users, isNotNull);
      expect(result.users, isA<BuiltList<UsersResponseUsersInner>?>());
      expect(result.users, contains(user1));
      expect(result.users, contains(user2));
    });

    // Pagination token.
    // String nextToken
    test('to test the property `nextToken`', () async {
      // TODO
      final nextToken = instance.nextToken;
      expect(nextToken, isNull);
      instance.nextToken = 'nextToken';
      final result = instance.build();
      expect(result, isA<UsersResponse>());
      expect(result.nextToken, isNotNull);
      expect(result.nextToken, isA<String>());
      expect(result.nextToken, contains('nextToken'));
    });
  });
}
