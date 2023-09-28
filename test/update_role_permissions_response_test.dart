import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for UpdateRolePermissionsResponse
void main() {
  final instance = UpdateRolePermissionsResponseBuilder();
  // TODO add properties to the builder and call build()

  group(UpdateRolePermissionsResponse, () {
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = 'code';
      final result = instance.build();
      expect(result, isA<UpdateRolePermissionsResponse>());
      expect(result.code, isNotNull);
      expect(result.code, isA<String>());
      expect(result.code, contains('code'));
    });

    // String message
    test('to test the property `message`', () async {
      // TODO
      final message = instance.message;
      expect(message, isNull);
      instance.message = 'message';
      final result = instance.build();
      expect(result, isA<UpdateRolePermissionsResponse>());
      expect(result.message, isNotNull);
      expect(result.message, isA<String>());
      expect(result.message, contains('message'));
    });

    // BuiltList<String> permissionsAdded
    test('to test the property `permissionsAdded`', () async {
      // TODO
      final permissionsAdded = instance.permissionsAdded;
      expect(permissionsAdded, isA<ListBuilder<String>>());
      expect(permissionsAdded.length, isZero);
      instance.permissionsAdded.add('permission1');
      instance.permissionsAdded.add('permission2');
      final result = instance.build();
      expect(result, isA<UpdateRolePermissionsResponse>());
      expect(result.permissionsAdded, isNotNull);
      expect(result.permissionsAdded, isA<BuiltList<String>>());
      expect(result.permissionsAdded?.length, equals(2));
      expect(result.permissionsAdded, contains('permission1'));
      expect(result.permissionsAdded, contains('permission2'));
    });

    // BuiltList<String> permissionsRemoved
    test('to test the property `permissionsRemoved`', () async {
      // TODO
      final permissionsRemoved = instance.permissionsRemoved;
      expect(permissionsRemoved, isA<ListBuilder<String>>());
      expect(permissionsRemoved.length, isZero);
      instance.permissionsRemoved.add('permission1');
      instance.permissionsRemoved.add('permission2');
      final result = instance.build();
      expect(result, isA<UpdateRolePermissionsResponse>());
      expect(result.permissionsRemoved, isNotNull);
      expect(result.permissionsRemoved, isA<BuiltList<String>>());
      expect(result.permissionsRemoved?.length, equals(2));
      expect(result.permissionsRemoved, contains('permission1'));
      expect(result.permissionsRemoved, contains('permission2'));
    });
  });
}
