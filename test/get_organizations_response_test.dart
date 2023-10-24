import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for GetOrganizationsResponse
void main() {
  final instance = GetOrganizationsResponseBuilder();
  // TODO add properties to the builder and call build()

  group(GetOrganizationsResponse, () {
    // Response code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = 'code';
      final result = instance.build();
      expect(result, isA<GetOrganizationsResponse>());
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
      expect(result.message, isA<String>());
      expect(result.message, isNotNull);
      expect(result.message, equals('message'));
    });

    // BuiltList<Role> roles
    test('to test the property `organizations`', () async {
      // TODO
      final organizations = instance.organizations;
      expect(organizations, isA<ListBuilder<Organization>>());
      expect(organizations.length, isZero);
      Organization organization = Organization();
      instance.organizations.add(organization);
      final result = instance.build();
      expect(result, isA<GetOrganizationsResponse>());
      expect(result.organizations, isA<BuiltList<Organization>>());
      expect(result.organizations, isNotNull);
      expect(result.organizations?.length, isNonZero);
    });

    // Pagination token.
    // String nextToken
    test('to test the property `nextToken`', () async {
      // TODO
      final nextToken = instance.nextToken;
      expect(nextToken, isNull);
      instance.nextToken = 'nextToken';
      final result = instance.build();
      expect(result, isA<GetOrganizationsResponse>());
      expect(result.nextToken, isA<String>());
      expect(result.nextToken, isNotNull);
      expect(result.nextToken, equals('nextToken'));
    });
  });
}
