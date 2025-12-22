import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late RolesApi rolesApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    rolesApi = KindeApi(dio: dio).getRolesApi();
  });

  tearDown(() {
    dioAdapter.reset();
  });

  group('createRole', () {
    const testPath = '/api/v1/role';

    group('success scenarios', () {
      test('creates role with name and description', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Role created successfully',
          'code': 'OK',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = CreateRoleRequest((b) => b
          ..name = 'Admin'
          ..description = 'Administrator role');

        // Act
        final response = await rolesApi.createRole(
          createRoleRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('creates role with name only', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Role created',
          'code': 'OK',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = CreateRoleRequest((b) => b..name = 'Viewer');

        // Act
        final response = await rolesApi.createRole(
          createRoleRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data!.code, equals('OK'));
      });

      test('creates role with key', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Role created',
          'code': 'OK',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = CreateRoleRequest((b) => b
          ..name = 'Editor'
          ..key = 'editor_role'
          ..description = 'Can edit content');

        // Act
        final response = await rolesApi.createRole(
          createRoleRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 400 validation error', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'Role name is required',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
        );

        final request = CreateRoleRequest();

        // Act & Assert
        expect(
          () => rolesApi.createRole(createRoleRequest: request),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(400),
          )),
        );
      });

      test('throws DioException on 409 role already exists', () async {
        // Arrange
        final errorResponse = {
          'error': 'conflict',
          'error_description': 'Role with this name already exists',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(409, errorResponse),
          data: Matchers.any,
        );

        final request = CreateRoleRequest((b) => b..name = 'Admin');

        // Act & Assert
        expect(
          () => rolesApi.createRole(createRoleRequest: request),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(409),
          )),
        );
      });

      test('throws DioException on 401 unauthorized', () async {
        // Arrange
        final errorResponse = {
          'error': 'unauthorized',
          'error_description': 'Invalid or expired token',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(401, errorResponse),
          data: Matchers.any,
        );

        final request = CreateRoleRequest();

        // Act & Assert
        expect(
          () => rolesApi.createRole(createRoleRequest: request),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });
    });
  });

  group('getRoles', () {
    const testPath = '/api/v1/roles';

    group('success scenarios', () {
      test('retrieves all roles with default parameters', () async {
        // Arrange
        final expectedResponse = {
          'roles': [
            {'id': 'role_1', 'key': 'admin', 'name': 'Admin'},
            {'id': 'role_2', 'key': 'user', 'name': 'User'},
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await rolesApi.getRoles();

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.roles, isNotNull);
        expect(response.data!.roles!.length, equals(2));
      });

      test('retrieves roles with pagination', () async {
        // Arrange
        final expectedResponse = {
          'roles': [
            {'id': 'role_1', 'key': 'admin', 'name': 'Admin'},
          ],
          'next_token': 'token_page2',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'page_size': '10'},
        );

        // Act
        final response = await rolesApi.getRoles(pageSize: 10);

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.nextToken, equals('token_page2'));
      });

      test('retrieves roles with sorting', () async {
        // Arrange
        final expectedResponse = {
          'roles': [
            {'id': 'role_1', 'key': 'admin', 'name': 'Admin'},
            {'id': 'role_2', 'key': 'user', 'name': 'User'},
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'sort': 'name_asc'},
        );

        // Act
        final response = await rolesApi.getRoles(sort: 'name_asc');

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.roles!.length, equals(2));
      });

      test('retrieves roles with next token for pagination', () async {
        // Arrange
        final expectedResponse = {
          'roles': [
            {'id': 'role_3', 'key': 'editor', 'name': 'Editor'},
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'next_token': 'token_page2'},
        );

        // Act
        final response = await rolesApi.getRoles(nextToken: 'token_page2');

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.roles!.first.name, equals('Editor'));
      });

      test('returns empty list when no roles', () async {
        // Arrange
        final expectedResponse = {
          'roles': [],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await rolesApi.getRoles();

        // Assert
        expect(response.data!.roles, isEmpty);
      });
    });

    group('error scenarios', () {
      test('throws DioException on 401 unauthorized', () async {
        // Arrange
        final errorResponse = {
          'error': 'unauthorized',
          'error_description': 'Invalid or expired token',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(401, errorResponse),
        );

        // Act & Assert
        expect(
          () => rolesApi.getRoles(),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });

      test('throws DioException on 403 forbidden', () async {
        // Arrange
        final errorResponse = {
          'error': 'forbidden',
          'error_description': 'Insufficient permissions',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(403, errorResponse),
        );

        // Act & Assert
        expect(
          () => rolesApi.getRoles(),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(403),
          )),
        );
      });
    });
  });

  group('getRolePermission', () {
    const roleId = 'role_123';
    final testPath = '/api/v1/roles/$roleId/permissions';

    group('success scenarios', () {
      test('retrieves permissions for role', () async {
        // Arrange
        final expectedResponse = [
          {'id': 'perm_1', 'name': 'read:users'},
          {'id': 'perm_2', 'name': 'write:users'},
        ];

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await rolesApi.getRolePermission(roleId: roleId);

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.length, equals(2));
      });

      test('returns empty list when role has no permissions', () async {
        // Arrange
        final expectedResponse = <dynamic>[];

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await rolesApi.getRolePermission(roleId: roleId);

        // Assert
        expect(response.data, isEmpty);
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 role not found', () async {
        // Arrange
        const nonexistentId = 'role_nonexistent';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Role not found',
        };

        dioAdapter.onGet(
          '/api/v1/roles/$nonexistentId/permissions',
          (server) => server.reply(404, errorResponse),
        );

        // Act & Assert
        expect(
          () => rolesApi.getRolePermission(roleId: nonexistentId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(404),
          )),
        );
      });

      test('throws DioException on 401 unauthorized', () async {
        // Arrange
        final errorResponse = {
          'error': 'unauthorized',
          'error_description': 'Invalid or expired token',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(401, errorResponse),
        );

        // Act & Assert
        expect(
          () => rolesApi.getRolePermission(roleId: roleId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });
    });
  });

  group('updateRoles', () {
    const roleId = 'role_123';
    final testPath = '/api/v1/roles/$roleId';

    group('success scenarios', () {
      test('updates role with new name and description', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Role updated successfully',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = UpdateRolesRequest((b) => b
          ..name = 'Super Admin'
          ..key = 'super_admin'
          ..description = 'Super administrator role');

        // Act
        final response = await rolesApi.updateRoles(
          roleId: roleId,
          updateRolesRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('updates role name only', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Role updated',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = UpdateRolesRequest((b) => b
          ..name = 'Updated Name'
          ..key = 'admin');

        // Act
        final response = await rolesApi.updateRoles(
          roleId: roleId,
          updateRolesRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 role not found', () async {
        // Arrange
        const nonexistentId = 'role_nonexistent';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Role not found',
        };

        dioAdapter.onPatch(
          '/api/v1/roles/$nonexistentId',
          (server) => server.reply(404, errorResponse),
          data: Matchers.any,
        );

        final request = UpdateRolesRequest((b) => b
          ..name = 'Test Role'
          ..key = 'test');

        // Act & Assert
        expect(
          () => rolesApi.updateRoles(
            roleId: nonexistentId,
            updateRolesRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(404),
          )),
        );
      });

      test('throws DioException on 400 validation error', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'Role name cannot be empty',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
        );

        final request = UpdateRolesRequest((b) => b
          ..name = 'Test Role'
          ..key = 'test');

        // Act & Assert
        expect(
          () => rolesApi.updateRoles(
            roleId: roleId,
            updateRolesRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(400),
          )),
        );
      });

      test('throws DioException on 401 unauthorized', () async {
        // Arrange
        final errorResponse = {
          'error': 'unauthorized',
          'error_description': 'Invalid or expired token',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(401, errorResponse),
          data: Matchers.any,
        );

        final request = UpdateRolesRequest((b) => b
          ..name = 'Test Role'
          ..key = 'test');

        // Act & Assert
        expect(
          () => rolesApi.updateRoles(
            roleId: roleId,
            updateRolesRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });
    });
  });

  group('updateRolePermissions', () {
    const roleId = 'role_123';
    final testPath = '/api/v1/roles/$roleId/permissions';

    group('success scenarios', () {
      test('updates permissions for role', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Permissions updated',
          'permissions_added': ['perm_1', 'perm_2'],
          'permissions_removed': <String>[],
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = UpdateRolePermissionsRequest((b) => b
          ..permissions.addAll([
            UpdateRolePermissionsRequestPermissionsInner((p) => p..id = 'perm_1'),
            UpdateRolePermissionsRequestPermissionsInner((p) => p..id = 'perm_2'),
          ]));

        // Act
        final response = await rolesApi.updateRolePermissions(
          roleId: roleId,
          updateRolePermissionsRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.permissionsAdded, isNotNull);
        expect(response.data!.permissionsAdded!.length, equals(2));
      });

      test('removes permissions from role', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Permissions updated',
          'permissions_added': <String>[],
          'permissions_removed': ['perm_1'],
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = UpdateRolePermissionsRequest((b) => b
          ..permissions.add(
            UpdateRolePermissionsRequestPermissionsInner((p) => p
              ..id = 'perm_1'
              ..operation = 'delete'),
          ));

        // Act
        final response = await rolesApi.updateRolePermissions(
          roleId: roleId,
          updateRolePermissionsRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.permissionsRemoved, isNotNull);
        expect(response.data!.permissionsRemoved!.length, equals(1));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 role not found', () async {
        // Arrange
        const nonexistentId = 'role_nonexistent';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Role not found',
        };

        dioAdapter.onPatch(
          '/api/v1/roles/$nonexistentId/permissions',
          (server) => server.reply(404, errorResponse),
          data: Matchers.any,
        );

        final request = UpdateRolePermissionsRequest();

        // Act & Assert
        expect(
          () => rolesApi.updateRolePermissions(
            roleId: nonexistentId,
            updateRolePermissionsRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(404),
          )),
        );
      });

      test('throws DioException on 400 invalid permission IDs', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'One or more permission IDs are invalid',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
        );

        final request = UpdateRolePermissionsRequest();

        // Act & Assert
        expect(
          () => rolesApi.updateRolePermissions(
            roleId: roleId,
            updateRolePermissionsRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(400),
          )),
        );
      });

      test('throws DioException on 401 unauthorized', () async {
        // Arrange
        final errorResponse = {
          'error': 'unauthorized',
          'error_description': 'Invalid or expired token',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(401, errorResponse),
          data: Matchers.any,
        );

        final request = UpdateRolePermissionsRequest();

        // Act & Assert
        expect(
          () => rolesApi.updateRolePermissions(
            roleId: roleId,
            updateRolePermissionsRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });
    });
  });

  group('removeRolePermission', () {
    const roleId = 'role_123';
    const permissionId = 'perm_456';
    final testPath = '/api/v1/roles/$roleId/permission/$permissionId';

    group('success scenarios', () {
      test('removes permission from role', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Permission removed successfully',
          'code': 'OK',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await rolesApi.removeRolePermission(
          roleId: roleId,
          permissionId: permissionId,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 role not found', () async {
        // Arrange
        const nonexistentRoleId = 'role_nonexistent';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Role not found',
        };

        dioAdapter.onDelete(
          '/api/v1/roles/$nonexistentRoleId/permission/$permissionId',
          (server) => server.reply(404, errorResponse),
        );

        // Act & Assert
        expect(
          () => rolesApi.removeRolePermission(
            roleId: nonexistentRoleId,
            permissionId: permissionId,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(404),
          )),
        );
      });

      test('throws DioException on 404 permission not found', () async {
        // Arrange
        const nonexistentPermId = 'perm_nonexistent';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Permission not found',
        };

        dioAdapter.onDelete(
          '/api/v1/roles/$roleId/permission/$nonexistentPermId',
          (server) => server.reply(404, errorResponse),
        );

        // Act & Assert
        expect(
          () => rolesApi.removeRolePermission(
            roleId: roleId,
            permissionId: nonexistentPermId,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(404),
          )),
        );
      });

      test('throws DioException on 401 unauthorized', () async {
        // Arrange
        final errorResponse = {
          'error': 'unauthorized',
          'error_description': 'Invalid or expired token',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(401, errorResponse),
        );

        // Act & Assert
        expect(
          () => rolesApi.removeRolePermission(
            roleId: roleId,
            permissionId: permissionId,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });

      test('throws DioException on 403 forbidden', () async {
        // Arrange
        final errorResponse = {
          'error': 'forbidden',
          'error_description': 'Insufficient permissions',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(403, errorResponse),
        );

        // Act & Assert
        expect(
          () => rolesApi.removeRolePermission(
            roleId: roleId,
            permissionId: permissionId,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(403),
          )),
        );
      });
    });
  });
}
