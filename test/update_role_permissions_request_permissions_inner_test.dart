import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for UpdateRolePermissionsRequestPermissionsInner
void main() {
  final instance = UpdateRolePermissionsRequestPermissionsInnerBuilder();
  // TODO add properties to the builder and call build()

  group(UpdateRolePermissionsRequestPermissionsInner, () {
    // The permission id.
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<UpdateRolePermissionsRequestPermissionsInner>());
      expect(result.id, isNotNull);
      expect(result.id, isA<String>());
      expect(result.id, contains('id'));
    });

    // Optional operation, set to 'delete' to remove the permission from the role.
    // String operation
    test('to test the property `operation`', () async {
      // TODO
      final operation = instance.operation;
      expect(operation, isNull);
      instance.operation = 'operation';
      final result = instance.build();
      expect(result, isA<UpdateRolePermissionsRequestPermissionsInner>());
      expect(result.operation, isNotNull);
      expect(result.operation, isA<String>());
      expect(result.operation, contains('operation'));
    });
  });
}
