import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for UpdateRolePermissionsRequest
void main() {
  final instance = UpdateRolePermissionsRequestBuilder();
  // TODO add properties to the builder and call build()

  group(UpdateRolePermissionsRequest, () {
    // Permissions to add or remove from the role.
    // BuiltList<UpdateRolePermissionsRequestPermissionsInner> permissions
    test('to test the property `permissions`', () async {
      // TODO
      final permissions = instance.permissions;
      expect(permissions,
          isA<ListBuilder<UpdateRolePermissionsRequestPermissionsInner>>());
      expect(permissions.length, isZero);
      instance.permissions.add(UpdateRolePermissionsRequestPermissionsInner());
      final result = instance.build();
      expect(result, isA<UpdateRolePermissionsRequest>());
      expect(result.permissions, isNotNull);
      expect(result.permissions,
          isA<BuiltList<UpdateRolePermissionsRequestPermissionsInner>?>());
      expect(result.permissions?.length, equals(1));
    });
  });
}
