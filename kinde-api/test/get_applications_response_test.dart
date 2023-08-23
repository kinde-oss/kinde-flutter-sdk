import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for GetApplicationsResponse
void main() {
  final instance = GetApplicationsResponseBuilder();
  // TODO add properties to the builder and call build()

  group(GetApplicationsResponse, () {
    // Response code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = 'code';
      final result = instance.build();
      expect(result, isA<GetApplicationsResponse>());
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
      expect(result, isA<GetApplicationsResponse>());
      expect(result.message, isA<String>());
      expect(result.message, isNotNull);
      expect(result.message, equals('message'));
    });

    // BuiltList<Application> organizations
    test('to test the property `organizations`', () async {
      // TODO
      final message = instance.organizations;
      expect(message, isA<ListBuilder<Application>>());
      expect(message.length, isZero);
      ListBuilder<Application> _organizations = ListBuilder<Application>();
      var app = Application((builder) {
        builder.name = 'name';
        builder.appId = 'appId';
      });
      _organizations.add(app);
      instance.organizations = _organizations;
      final result = instance.build();
      expect(result, isA<GetApplicationsResponse>());
      expect(result.organizations, isA<BuiltList<Application>?>());
      expect(result.organizations?.length, isNonZero);
      expect(result.organizations, contains(app));
    });

    // Pagination token.
    // String nextToken
    test('to test the property `nextToken`', () async {
      // TODO
      final nextToken = instance.nextToken;
      expect(nextToken, isNull);
      instance.nextToken = 'nextToken';
      final result = instance.build();
      expect(result, isA<GetApplicationsResponse>());
      expect(result.nextToken, isA<String>());
      expect(result.nextToken, isNotNull);
      expect(result.nextToken, equals('nextToken'));
    });
  });
}
