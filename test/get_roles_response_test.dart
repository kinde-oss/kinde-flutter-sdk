import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for GetRolesResponse
void main() {
  final instance = GetRolesResponseBuilder();
  // TODO add properties to the builder and call build()

  group(GetRolesResponse, () {
    // Response code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = 'code';
      final result = instance.build();
      expect(result, isA<GetRolesResponse>());
      expect(result.code, isA<String>());
      expect(result.code, isNotNull);
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
      expect(result, isA<GetRolesResponse>());
      expect(result.message, isA<String>());
      expect(result.message, isNotNull);
      expect(result.message, equals('message'));
    });

    // BuiltList<Roles> roles
    test('to test the property `roles`', () async {
      // TODO
      final roles = instance.roles;
      expect(roles, isA<ListBuilder<Roles>>());
      expect(roles.length, isZero);
      Roles role = Roles();
      instance.roles.add(role);
      final result = instance.build();
      expect(result, isA<GetRolesResponse>());
      expect(result.roles, isA<BuiltList<Roles>>());
      expect(result.roles, isNotNull);
    });

    // Pagination token.
    // String nextToken
    test('to test the property `nextToken`', () async {
      // TODO
      final nextToken = instance.nextToken;
      expect(nextToken, isNull);
      instance.nextToken = 'nextToken';
      final result = instance.build();
      expect(result, isA<GetRolesResponse>());
      expect(result.nextToken, isA<String>());
      expect(result.nextToken, isNotNull);
      expect(result.nextToken, equals('nextToken'));
    });
  });
}
