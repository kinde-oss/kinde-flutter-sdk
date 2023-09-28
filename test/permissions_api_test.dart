import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:dio/dio.dart';
import '../test/test_helpers/dio_mock.dart';

/// tests for PermissionsApi
void main() {
  //final instance = KindeApi().getPermissionsApi();
  Dio dio = DioAdapterMock();
  final instance = KindeApi(dio: dio).getPermissionsApi();

  group(PermissionsApi, () {
    // Create Permission
    //
    // Create a new permission.
    //
    //Future<SuccessResponse> createPermission({ CreatePermissionRequest createPermissionRequest }) async
    test('test createPermission', () async {
      // TODO
      final responseData = await instance.createPermission(
        createPermissionRequest: CreatePermissionRequest((builder) {
          builder.name = 'test_name';
          builder.description = 'test_description';
        }),
      );
      expect(responseData, isNotNull);
    });

    // List Permissions
    //
    // The returned list can be sorted by permission name or permission ID in ascending or descending order. The number of records to return at a time can also be controlled using the `page_size` query string parameter.
    //
    //Future<SuccessResponse> getPermissions({ String sort, int pageSize, String nextToken }) async
    test('test getPermissions', () async {
      // TODO
      final responseData = await instance.getPermissions();
      expect(responseData, isNotNull);
    });

    // Update Permission
    //
    // Update permission
    //
    //Future<SuccessResponse> updatePermissions(int permissionId, { CreatePermissionRequest createPermissionRequest }) async
    test('test updatePermissions', () async {
      // TODO
      final responseData = await instance.updatePermissions(
        permissionId: 1,
        createPermissionRequest: CreatePermissionRequest((builder) {
          builder.name = 'test_name';
          builder.description = 'test_description';
        }),
      );
      expect(responseData, isNotNull);
    });
  });
}
