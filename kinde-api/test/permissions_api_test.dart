import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for PermissionsApi
void main() {
  final instance = KindeApi().getPermissionsApi();

  group(PermissionsApi, () {
    // Create Permission
    //
    // Create a new permission.
    //
    //Future<SuccessResponse> createPermission({ CreatePermissionRequest createPermissionRequest }) async
    test('test createPermission', () async {
      // TODO
    });

    // List Permissions
    //
    // The returned list can be sorted by permission name or permission ID in ascending or descending order. The number of records to return at a time can also be controlled using the `page_size` query string parameter. 
    //
    //Future<SuccessResponse> getPermissions({ String sort, int pageSize, String nextToken }) async
    test('test getPermissions', () async {
      // TODO
    });

    // Update Permission
    //
    // Update permission
    //
    //Future<SuccessResponse> updatePermissions(int permissionId, { CreatePermissionRequest createPermissionRequest }) async
    test('test updatePermissions', () async {
      // TODO
    });

  });
}
