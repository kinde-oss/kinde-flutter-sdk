import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

/// Enterprise-grade tests for PermissionsApi
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late PermissionsApi permissionsApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    permissionsApi = KindeApi(dio: dio).getPermissionsApi();
  });

  tearDown(() {
    dioAdapter.reset();
  });

  group('createPermission', () {
    const testPath = '/api/v1/permissions';

    group('success scenarios', () {
      test('creates permission with name and description', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Permission created successfully',
          'code': 'OK',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest((b) => b
          ..name = 'read:users'
          ..description = 'Can read user data');

        // Act
        final response = await permissionsApi.createPermission(
          createPermissionRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('creates permission with minimal data (name only)', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Permission created',
          'code': 'OK',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest((b) => b..name = 'write:users');

        // Act
        final response = await permissionsApi.createPermission(
          createPermissionRequest: request,
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
          'error_description': 'Permission name is required',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest();

        // Act & Assert
        expect(
          () => permissionsApi.createPermission(createPermissionRequest: request),
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

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(401, errorResponse),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest();

        // Act & Assert
        expect(
          () => permissionsApi.createPermission(createPermissionRequest: request),
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
          'error_description': 'Insufficient permissions to create permissions',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(403, errorResponse),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest();

        // Act & Assert
        expect(
          () => permissionsApi.createPermission(createPermissionRequest: request),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(403),
          )),
        );
      });

      test('throws DioException on 409 duplicate permission', () async {
        // Arrange
        final errorResponse = {
          'error': 'conflict',
          'error_description': 'Permission with this name already exists',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(409, errorResponse),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest((b) => b..name = 'existing:permission');

        // Act & Assert
        expect(
          () => permissionsApi.createPermission(createPermissionRequest: request),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(409),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends correct content-type header', () async {
        // Arrange
        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, {'message': 'Success', 'code': 'OK'}),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest((b) => b..name = 'test:permission');

        // Act
        final response = await permissionsApi.createPermission(createPermissionRequest: request);

        // Assert
        expect(response.statusCode, equals(201));
      });

      test('serializes request body correctly', () async {
        // Arrange
        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, {'message': 'Success', 'code': 'OK'}),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest((b) => b
          ..name = 'delete:users'
          ..description = 'Can delete user records');

        // Act
        final response = await permissionsApi.createPermission(createPermissionRequest: request);

        // Assert
        expect(response.statusCode, equals(201));
      });
    });
  });

  group('getPermissions', () {
    const testPath = '/api/v1/permissions';

    group('success scenarios', () {
      test('lists all permissions with default parameters', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'permissions': [
            {
              'id': 'perm_1',
              'key': 'read:users',
              'name': 'Read Users',
              'description': 'Can read user data',
            },
            {
              'id': 'perm_2',
              'key': 'write:users',
              'name': 'Write Users',
              'description': 'Can modify user data',
            },
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await permissionsApi.getPermissions();

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.permissions, isNotNull);
        expect(response.data!.permissions!.length, equals(2));
        expect(response.data!.permissions![0].id, equals('read:users'));
        expect(response.data!.permissions![1].id, equals('write:users'));
        expect(response.data!.nextToken, isNull);
      });

      test('lists permissions with pagination', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'permissions': [
            {
              'id': 'perm_1',
              'key': 'read:users',
              'name': 'Read Users',
            },
          ],
          'next_token': 'token_page_2',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'page_size': '10'},
        );

        // Act
        final response = await permissionsApi.getPermissions(pageSize: 10);

        // Assert
        expect(response.data!.permissions!.length, equals(1));
        expect(response.data!.nextToken, equals('token_page_2'));
      });

      test('lists permissions with next_token', () async {
        // Arrange
        const nextToken = 'token_page_2';
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'permissions': [
            {
              'id': 'perm_11',
              'key': 'admin:all',
              'name': 'Admin All',
            },
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'next_token': nextToken},
        );

        // Act
        final response = await permissionsApi.getPermissions(nextToken: nextToken);

        // Assert
        expect(response.data!.permissions!.length, equals(1));
        expect(response.data!.permissions![0].id, equals('admin:all'));
        expect(response.data!.nextToken, isNull);
      });

      test('sorts permissions by name ascending', () async {
        // Arrange
        const sortParam = 'name_asc';
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'permissions': [
            {'id': 'perm_1', 'key': 'admin:all', 'name': 'Admin All'},
            {'id': 'perm_2', 'key': 'read:users', 'name': 'Read Users'},
            {'id': 'perm_3', 'key': 'write:users', 'name': 'Write Users'},
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'sort': sortParam},
        );

        // Act
        final response = await permissionsApi.getPermissions(sort: sortParam);

        // Assert
        expect(response.data!.permissions!.length, equals(3));
        expect(response.data!.permissions![0].name, equals('Admin All'));
        expect(response.data!.permissions![2].name, equals('Write Users'));
      });

      test('returns empty list when no permissions exist', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'permissions': [],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await permissionsApi.getPermissions();

        // Assert
        expect(response.data!.permissions, isEmpty);
      });
    });

    group('error scenarios', () {
      test('throws DioException on 400 invalid parameters', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'Invalid sort parameter',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(400, errorResponse),
          queryParameters: {'sort': 'invalid_sort'},
        );

        // Act & Assert
        expect(
          () => permissionsApi.getPermissions(sort: 'invalid_sort'),
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

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(401, errorResponse),
        );

        // Act & Assert
        expect(
          () => permissionsApi.getPermissions(),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends all query parameters correctly', () async {
        // Arrange
        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, {
            'code': 'OK',
            'permissions': [],
            'next_token': null,
          }),
          queryParameters: {
            'sort': 'name_asc',
            'page_size': '25',
          },
        );

        // Act
        final response = await permissionsApi.getPermissions(
          sort: 'name_asc',
          pageSize: 25,
        );

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });

  group('updatePermissions', () {
    const permissionId = 123;
    final testPath = '/api/v1/permissions/$permissionId';

    group('success scenarios', () {
      test('updates permission name and description', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Permission updated successfully',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest((b) => b
          ..name = 'read:all:users'
          ..description = 'Can read all user data including sensitive fields');

        // Act
        final response = await permissionsApi.updatePermissions(
          permissionId: permissionId,
          createPermissionRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('updates permission name only', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Permission updated',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest((b) => b..name = 'updated:permission');

        // Act
        final response = await permissionsApi.updatePermissions(
          permissionId: permissionId,
          createPermissionRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 permission not found', () async {
        // Arrange
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Permission not found',
        };

        dioAdapter.onPatch(
          '/api/v1/permissions/nonexistent_perm',
          (server) => server.reply(404, errorResponse),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest((b) => b..name = 'test');

        // Act & Assert
        expect(
          () => permissionsApi.updatePermissions(
            permissionId: 999,
            createPermissionRequest: request,
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
          'error_description': 'Invalid permission name format',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest();

        // Act & Assert
        expect(
          () => permissionsApi.updatePermissions(
            permissionId: permissionId,
            createPermissionRequest: request,
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

        final request = CreatePermissionRequest();

        // Act & Assert
        expect(
          () => permissionsApi.updatePermissions(
            permissionId: permissionId,
            createPermissionRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });

      test('throws DioException on 409 duplicate name', () async {
        // Arrange
        final errorResponse = {
          'error': 'conflict',
          'error_description': 'Permission with this name already exists',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(409, errorResponse),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest((b) => b..name = 'existing:permission');

        // Act & Assert
        expect(
          () => permissionsApi.updatePermissions(
            permissionId: permissionId,
            createPermissionRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(409),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends permission ID in URL path', () async {
        // Arrange
        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, {'message': 'Updated', 'code': 'OK'}),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest((b) => b..name = 'test');

        // Act
        final response = await permissionsApi.updatePermissions(
          permissionId: permissionId,
          createPermissionRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
      });

      test('serializes request body correctly', () async {
        // Arrange
        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, {'message': 'Updated', 'code': 'OK'}),
          data: Matchers.any,
        );

        final request = CreatePermissionRequest((b) => b
          ..name = 'manage:users'
          ..description = 'Full user management access');

        // Act
        final response = await permissionsApi.updatePermissions(
          permissionId: permissionId,
          createPermissionRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });

  group('deletePermission', () {
    const permissionId = 'perm_to_delete';
    final testPath = '/api/v1/permissions/$permissionId';

    group('success scenarios', () {
      test('deletes permission successfully', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Permission successfully deleted',
          'code': 'OK',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await permissionsApi.deletePermission(
          permissionId: permissionId,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully deleted'));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 permission not found', () async {
        // Arrange
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Permission not found',
        };

        dioAdapter.onDelete(
          '/api/v1/permissions/nonexistent_perm',
          (server) => server.reply(404, errorResponse),
        );

        // Act & Assert
        expect(
          () => permissionsApi.deletePermission(
            permissionId: 'nonexistent_perm',
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
          () => permissionsApi.deletePermission(permissionId: permissionId),
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
          'error_description': 'Insufficient permissions to delete this permission',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(403, errorResponse),
        );

        // Act & Assert
        expect(
          () => permissionsApi.deletePermission(permissionId: permissionId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(403),
          )),
        );
      });

      test('throws DioException on 409 conflict (permission in use)', () async {
        // Arrange
        final errorResponse = {
          'error': 'conflict',
          'error_description': 'Cannot delete permission that is assigned to users or roles',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(409, errorResponse),
        );

        // Act & Assert
        expect(
          () => permissionsApi.deletePermission(permissionId: permissionId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(409),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends permission ID in URL path', () async {
        // Arrange
        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, {'message': 'Deleted', 'code': 'OK'}),
        );

        // Act
        final response = await permissionsApi.deletePermission(permissionId: permissionId);

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });
}
