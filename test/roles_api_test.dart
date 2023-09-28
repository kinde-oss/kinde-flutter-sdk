import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:dio/dio.dart';
import '../test/test_helpers/dio_mock.dart';

/// tests for RolesApi
void main() {
  //final instance = KindeApi().getRolesApi();
  Dio dio = DioAdapterMock();
  final instance = KindeApi(dio: dio).getRolesApi();

  group(RolesApi, () {
    // Create Role
    //
    // Create role.
    //
    //Future<SuccessResponse> createRole({ CreateRoleRequest createRoleRequest }) async
    test('test createRole', () async {
      // TODO
      final responseData = await instance.createRole();
      expect(responseData, isNotNull);
    });

    // List Roles
    //
    // The returned list can be sorted by role name or role ID in ascending or descending order. The number of records to return at a time can also be controlled using the `page_size` query string parameter.
    //
    //Future<GetRolesResponse> getRoles({ String sort, int pageSize, String nextToken }) async
    test('test getRoles', () async {
      // TODO
      final responseData = await instance.getRoles();
      expect(responseData, isNotNull);
    });

    // Update Role Permissions
    //
    // Update role permissions.
    //
    //Future<UpdateRolePermissionsResponse> updateRolePermissions(String roleId, UpdateRolePermissionsRequest updateRolePermissionsRequest) async
    test('test updateRolePermissions', () async {
      // TODO
      final responseData = await instance.updateRolePermissions(
        roleId: 'test_roleId',
        updateRolePermissionsRequest:
            UpdateRolePermissionsRequest((builder) {}),
      );
      expect(responseData, isNotNull);
    });

    // Update Role
    //
    // Update a role
    //
    //Future<SuccessResponse> updateRoles(String roleId, { UpdateRolesRequest updateRolesRequest }) async
    test('test updateRoles', () async {
      // TODO
      final responseData = await instance.updateRoles(
        roleId: 'test_roleId',
      );
      expect(responseData, isNotNull);
    });
  });
}
