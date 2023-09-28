import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for GetOrganizationsUserRolesResponse
void main() {
  final instance = GetOrganizationsUserRolesResponseBuilder();
  // TODO add properties to the builder and call build()

  group(GetOrganizationsUserRolesResponse, () {
    // Response code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = 'code';
      final result = instance.build();
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
      expect(result, isA<GetOrganizationsUserRolesResponse>());
      expect(result.message, isA<String>());
      expect(result.message, isNotNull);
      expect(result.message, equals('message'));
    });

    // BuiltList<OrganizationUserRole> roles
    test('to test the property `roles`', () async {
      // TODO
      final roles = instance.roles;
      expect(roles, isA<ListBuilder<OrganizationUserRole>>());
      expect(roles.length, isZero);
      OrganizationUserRole role = OrganizationUserRole();
      instance.roles.add(role);
      final result = instance.build();
      expect(result, isA<GetOrganizationsUserRolesResponse>());
      expect(result.roles, isA<BuiltList<OrganizationUserRole>>());
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
      expect(result, isA<GetOrganizationsUserRolesResponse>());
      expect(result.nextToken, isA<String>());
      expect(result.nextToken, isNotNull);
      expect(result.nextToken, equals('nextToken'));
    });
  });
}
