import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for CreateOrganizationUserRoleRequest
void main() {
  final instance = CreateOrganizationUserRoleRequestBuilder();
  // TODO add properties to the builder and call build()

  group(CreateOrganizationUserRoleRequest, () {
    // The role id.
    // String roleId
    test('to test the property `roleId`', () async {
      // TODO
      final roleId = instance.roleId;
      expect(roleId, isNull);
      instance.roleId = "roleId";
      final result = instance.build();
      expect(result.roleId, isA<String>());
      expect(result.roleId, isNotNull);
      expect(result.roleId, equals('roleId'));
    });
  });
}
