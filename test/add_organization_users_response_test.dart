import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for AddOrganizationUsersResponse
void main() {
  final instance = AddOrganizationUsersResponseBuilder();
  // TODO add properties to the builder and call build()

  group(AddOrganizationUsersResponse, () {
    // Response code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      instance.code = 'code';
      final result = instance.build();
      expect(result, isA<AddOrganizationUsersResponse>());
      expect(result.code, isNotNull);
      expect(result.code, equals('code'));
    });

    // Response message.
    // String message
    test('to test the property `message`', () async {
      // TODO
      instance.message = 'message';
      final result = instance.build();
      expect(result, isA<AddOrganizationUsersResponse>());
      expect(result.message, isNotNull);
      expect(result.message, equals('message'));
    });

    // BuiltList<String> usersAdded
    test('to test the property `usersAdded`', () async {
      // TODO
      instance.usersAdded.add('Sam');
      instance.usersAdded.add('Harry');
      final result = instance.build();
      expect(result, isA<AddOrganizationUsersResponse>());
      expect(result.usersAdded, isNotEmpty);
      expect(result.usersAdded, contains('Sam'));
      expect(result.usersAdded, contains('Harry'));
    });
  });
}
