import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for GetOrganizationUsersResponse
void main() {
  final instance = GetOrganizationUsersResponseBuilder();
  // TODO add properties to the builder and call build()

  group(GetOrganizationUsersResponse, () {
    // Response code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = "code";
      final result = instance.build();
      expect(result.code, isA<String>());
      expect(result.code, isNotNull);
    });

    // Response message.
    // String message
    test('to test the property `message`', () async {
      // TODO
      final message = instance.message;
      expect(message, isNull);
      instance.message = 'message';
      final result = instance.build();
      expect(result, isA<GetOrganizationUsersResponse>());
      expect(result.message, isA<String>());
      expect(result.message, isNotNull);
      expect(result.message, equals('message'));
    });

    // BuiltList<OrganizationUser> organizationUsers
    test('to test the property `organizationUsers`', () async {
      // TODO
      final organizationUsers = instance.organizationUsers;
      expect(organizationUsers, isA<ListBuilder<OrganizationUser>>());
      OrganizationUser organizationUser = OrganizationUser();
      instance.organizationUsers.add(organizationUser);
      final result = instance.build();
      expect(result.organizationUsers, isA<BuiltList<OrganizationUser>?>());
      expect(result.organizationUsers, isNotNull);
      expect(result.organizationUsers?.length, isNonZero);
    });

    // Pagination token.
    // String nextToken
    test('to test the property `nextToken`', () async {
      // TODO
      final nextToken = instance.nextToken;
      expect(nextToken, isNull);
      instance.nextToken = 'nextToken';
      final result = instance.build();
      expect(result, isA<GetOrganizationUsersResponse>());
      expect(result.nextToken, isA<String>());
      expect(result.nextToken, isNotNull);
      expect(result.nextToken, equals('nextToken'));
    });
  });
}
