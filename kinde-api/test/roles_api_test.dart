import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for RolesApi
void main() {
  final instance = KindeApi().getRolesApi();

  group(RolesApi, () {
    // Create Role
    //
    // Create role.
    //
    //Future<SuccessResponse> createRole({ CreateRoleRequest createRoleRequest }) async
    test('test createRole', () async {
      // TODO
    });

    // List Roles
    //
    // The returned list can be sorted by role name or role ID in ascending or descending order. The number of records to return at a time can also be controlled using the `page_size` query string parameter. 
    //
    //Future<GetRolesResponse> getRoles({ String sort, int pageSize, String nextToken }) async
    test('test getRoles', () async {
      // TODO
    });

    // Update Role Permissions
    //
    // Update role permissions. 
    //
    //Future<UpdateRolePermissionsResponse> updateRolePermissions(String roleId, UpdateRolePermissionsRequest updateRolePermissionsRequest) async
    test('test updateRolePermissions', () async {
      // TODO
    });

    // Update Role
    //
    // Update a role
    //
    //Future<SuccessResponse> updateRoles(String roleId, { UpdateRolesRequest updateRolesRequest }) async
    test('test updateRoles', () async {
      // TODO
    });

  });
}
