import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

/// Enterprise-grade tests for OrganizationsApi
/// This API has 19 methods covering organization management, users, roles, and feature flags
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late OrganizationsApi organizationsApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    organizationsApi = KindeApi(dio: dio).getOrganizationsApi();
  });

  tearDown(() {
    dioAdapter.reset();
  });

  // CRUD Operations
  group('createOrganization', () {
    const testPath = '/api/v1/organization';

    test('creates organization with complete data', () async {
      // Arrange
      final expectedResponse = {
        'organization': {
          'code': 'acme',
          'name': 'Acme Corp',
        },
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(201, expectedResponse),
        data: Matchers.any,
      );

      final request = CreateOrganizationRequest((b) => b
        ..name = 'Acme Corp'
        ..externalOrganizationId = 'ext_123');

      // Act
      final response = await organizationsApi.createOrganization(
        createOrganizationRequest: request,
      );

      // Assert
      expect(response.statusCode, equals(201));
      expect(response.data, isNotNull);
      expect(response.data!.organization, isNotNull);
      expect(response.data!.organization!.name, equals('Acme Corp'));
    });

    test('throws DioException on 409 conflict', () async {
      // Arrange
      final errorResponse = {
        'error': 'conflict',
        'error_description': 'Organization already exists',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(409, errorResponse),
        data: Matchers.any,
      );

      final request = CreateOrganizationRequest();

      // Act & Assert
      expect(
        () => organizationsApi.createOrganization(
          createOrganizationRequest: request,
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(409),
        )),
      );
    });
  });

  group('getOrganizations', () {
    const testPath = '/api/v1/organizations';

    test('retrieves all organizations with pagination', () async {
      // Arrange
      final expectedResponse = {
        'organizations': [
          {'code': 'org1', 'name': 'Org One'},
          {'code': 'org2', 'name': 'Org Two'},
        ],
        'next_token': 'token123',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
        queryParameters: {'page_size': '10'},
      );

      // Act
      final response = await organizationsApi.getOrganizations(pageSize: 10);

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.organizations, isNotNull);
      expect(response.data!.organizations!.length, equals(2));
      expect(response.data!.nextToken, equals('token123'));
    });

    test('throws DioException on 401 unauthorized', () async {
      // Arrange
      final errorResponse = {
        'error': 'unauthorized',
        'error_description': 'Invalid token',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(401, errorResponse),
      );

      // Act & Assert
      expect(
        () => organizationsApi.getOrganizations(),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(401),
        )),
      );
    });
  });

  group('getOrganization', () {
    const testPath = '/api/v1/organization';

    test('retrieves organization by code', () async {
      // Arrange
      final expectedResponse = {
        'code': 'acme',
        'name': 'Acme Corp',
        'is_allow_registrations': true,
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
        queryParameters: {'code': 'acme'},
      );

      // Act
      final response = await organizationsApi.getOrganization(code: 'acme');

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.code, equals('acme'));
      expect(response.data!.name, equals('Acme Corp'));
    });

    test('throws DioException on 404 not found', () async {
      // Arrange
      final errorResponse = {
        'error': 'not_found',
        'error_description': 'Organization not found',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(404, errorResponse),
        queryParameters: {'code': 'nonexistent'},
      );

      // Act & Assert
      expect(
        () => organizationsApi.getOrganization(code: 'nonexistent'),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(404),
        )),
      );
    });
  });

  group('updateOrganization', () {
    const orgCode = 'acme';
    final testPath = '/api/v1/organization/$orgCode';

    test('updates organization with new data', () async {
      // Arrange
      final expectedResponse = {
        'message': 'Organization updated',
        'code': 'OK',
      };

      dioAdapter.onPatch(
        testPath,
        (server) => server.reply(200, expectedResponse),
        data: Matchers.any,
      );

      final request = UpdateOrganizationRequest((b) => b..name = 'Updated Name');

      // Act
      final response = await organizationsApi.updateOrganization(
        orgCode: orgCode,
        updateOrganizationRequest: request,
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.code, equals('OK'));
    });

    test('throws DioException on 404 not found', () async {
      // Arrange
      final errorResponse = {
        'error': 'not_found',
        'error_description': 'Organization not found',
      };

      dioAdapter.onPatch(
        '/api/v1/organization/nonexistent',
        (server) => server.reply(404, errorResponse),
        data: Matchers.any,
      );

      final request = UpdateOrganizationRequest();

      // Act & Assert
      expect(
        () => organizationsApi.updateOrganization(
          orgCode: 'nonexistent',
          updateOrganizationRequest: request,
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(404),
        )),
      );
    });
  });

  group('deleteOrganization', () {
    const orgCode = 'acme';
    final testPath = '/api/v1/organization/$orgCode';

    test('deletes organization successfully', () async {
      // Arrange
      final expectedResponse = {
        'message': 'Organization deleted',
        'code': 'OK',
      };

      dioAdapter.onDelete(
        testPath,
        (server) => server.reply(200, expectedResponse),
      );

      // Act
      final response = await organizationsApi.deleteOrganization(orgCode: orgCode);

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data!.code, equals('OK'));
    });

    test('throws DioException on 409 conflict (has users)', () async {
      // Arrange
      final errorResponse = {
        'error': 'conflict',
        'error_description': 'Cannot delete organization with active users',
      };

      dioAdapter.onDelete(
        testPath,
        (server) => server.reply(409, errorResponse),
      );

      // Act & Assert
      expect(
        () => organizationsApi.deleteOrganization(orgCode: orgCode),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(409),
        )),
      );
    });
  });

  // User Management
  group('addOrganizationUsers', () {
    const orgCode = 'acme';
    final testPath = '/api/v1/organizations/$orgCode/users';

    test('adds users to organization', () async {
      // Arrange
      final expectedResponse = {
        'users_added': ['user_1', 'user_2'],
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(200, expectedResponse),
        data: Matchers.any,
      );

      final request = AddOrganizationUsersRequest((b) => b
        ..users.addAll(['user_1', 'user_2']));

      // Act
      final response = await organizationsApi.addOrganizationUsers(
        orgCode: orgCode,
        addOrganizationUsersRequest: request,
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.usersAdded, isNotNull);
      expect(response.data!.usersAdded!.length, equals(2));
    });

    test('throws DioException on 404 organization not found', () async {
      // Arrange
      final errorResponse = {
        'error': 'not_found',
        'error_description': 'Organization not found',
      };

      dioAdapter.onPost(
        '/api/v1/organizations/nonexistent/users',
        (server) => server.reply(404, errorResponse),
        data: Matchers.any,
      );

      final request = AddOrganizationUsersRequest();

      // Act & Assert
      expect(
        () => organizationsApi.addOrganizationUsers(
          orgCode: 'nonexistent',
          addOrganizationUsersRequest: request,
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(404),
        )),
      );
    });
  });

  group('getOrganizationUsers', () {
    const orgCode = 'acme';
    final testPath = '/api/v1/organizations/$orgCode/users';

    test('retrieves organization users with pagination', () async {
      // Arrange
      final expectedResponse = {
        'organization_users': [
          {'id': 'user_1', 'email': 'user1@acme.com'},
          {'id': 'user_2', 'email': 'user2@acme.com'},
        ],
        'next_token': null,
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
        queryParameters: {'page_size': '10'},
      );

      // Act
      final response = await organizationsApi.getOrganizationUsers(
        orgCode: orgCode,
        pageSize: 10,
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.organizationUsers, isNotNull);
      expect(response.data!.organizationUsers!.length, equals(2));
    });

    test('throws DioException on 401 unauthorized', () async {
      // Arrange
      final errorResponse = {
        'error': 'unauthorized',
        'error_description': 'Invalid token',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(401, errorResponse),
      );

      // Act & Assert
      expect(
        () => organizationsApi.getOrganizationUsers(orgCode: orgCode),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(401),
        )),
      );
    });
  });

  group('removeOrganizationUser', () {
    const orgCode = 'acme';
    const userId = 'user_123';
    final testPath = '/api/v1/organizations/$orgCode/users/$userId';

    test('removes user from organization', () async {
      // Arrange
      final expectedResponse = {
        'message': 'User removed',
        'code': 'OK',
      };

      dioAdapter.onDelete(
        testPath,
        (server) => server.reply(200, expectedResponse),
      );

      // Act
      final response = await organizationsApi.removeOrganizationUser(
        orgCode: orgCode,
        userId: userId,
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data!.code, equals('OK'));
    });

    test('throws DioException on 404 user not found', () async {
      // Arrange
      final errorResponse = {
        'error': 'not_found',
        'error_description': 'User not found in organization',
      };

      dioAdapter.onDelete(
        '/api/v1/organizations/acme/users/nonexistent',
        (server) => server.reply(404, errorResponse),
      );

      // Act & Assert
      expect(
        () => organizationsApi.removeOrganizationUser(
          orgCode: orgCode,
          userId: 'nonexistent',
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(404),
        )),
      );
    });
  });

  group('updateOrganizationUsers', () {
    const orgCode = 'acme';
    final testPath = '/api/v1/organizations/$orgCode/users';

    test('updates organization users', () async {
      // Arrange
      final expectedResponse = {
        'users_updated': ['user_1', 'user_2'],
      };

      dioAdapter.onPatch(
        testPath,
        (server) => server.reply(200, expectedResponse),
        data: Matchers.any,
      );

      final request = UpdateOrganizationUsersRequest((b) => b
        ..users.addAll(['user_1', 'user_2']));

      // Act
      final response = await organizationsApi.updateOrganizationUsers(
        orgCode: orgCode,
        updateOrganizationUsersRequest: request,
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.usersUpdated, isNotNull);
    });

    test('throws DioException on 400 validation error', () async {
      // Arrange
      final errorResponse = {
        'error': 'validation_error',
        'error_description': 'Invalid user data',
      };

      dioAdapter.onPatch(
        testPath,
        (server) => server.reply(400, errorResponse),
        data: Matchers.any,
      );

      final request = UpdateOrganizationUsersRequest();

      // Act & Assert
      expect(
        () => organizationsApi.updateOrganizationUsers(
          orgCode: orgCode,
          updateOrganizationUsersRequest: request,
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(400),
        )),
      );
    });
  });

  // Role Management
  group('createOrganizationUserRole', () {
    const orgCode = 'acme';
    const userId = 'user_123';
    final testPath = '/api/v1/organizations/$orgCode/users/$userId/roles';

    test('adds role to organization user', () async {
      // Arrange
      final expectedResponse = {
        'message': 'Role added',
        'code': 'OK',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(201, expectedResponse),
        data: Matchers.any,
      );

      final request = CreateOrganizationUserRoleRequest((b) => b..roleId = 'role_admin');

      // Act
      final response = await organizationsApi.createOrganizationUserRole(
        orgCode: orgCode,
        userId: userId,
        createOrganizationUserRoleRequest: request,
      );

      // Assert
      expect(response.statusCode, equals(201));
      expect(response.data!.code, equals('OK'));
    });

    test('throws DioException on 409 role already assigned', () async {
      // Arrange
      final errorResponse = {
        'error': 'conflict',
        'error_description': 'Role already assigned to user',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(409, errorResponse),
        data: Matchers.any,
      );

      final request = CreateOrganizationUserRoleRequest();

      // Act & Assert
      expect(
        () => organizationsApi.createOrganizationUserRole(
          orgCode: orgCode,
          userId: userId,
          createOrganizationUserRoleRequest: request,
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(409),
        )),
      );
    });
  });

  group('getOrganizationUserRoles', () {
    const orgCode = 'acme';
    const userId = 'user_123';
    final testPath = '/api/v1/organizations/$orgCode/users/$userId/roles';

    test('retrieves user roles in organization', () async {
      // Arrange
      final expectedResponse = {
        'roles': [
          {'id': 'role_1', 'key': 'admin', 'name': 'Admin'},
          {'id': 'role_2', 'key': 'member', 'name': 'Member'},
        ],
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
      );

      // Act
      final response = await organizationsApi.getOrganizationUserRoles(
        orgCode: orgCode,
        userId: userId,
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.roles, isNotNull);
      expect(response.data!.roles!.length, equals(2));
    });

    test('throws DioException on 404 user not found', () async {
      // Arrange
      final errorResponse = {
        'error': 'not_found',
        'error_description': 'User not found',
      };

      dioAdapter.onGet(
        '/api/v1/organizations/acme/users/nonexistent/roles',
        (server) => server.reply(404, errorResponse),
      );

      // Act & Assert
      expect(
        () => organizationsApi.getOrganizationUserRoles(
          orgCode: orgCode,
          userId: 'nonexistent',
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(404),
        )),
      );
    });
  });

  group('removeOrganizationUserRole', () {
    const orgCode = 'acme';
    const userId = 'user_123';
    const roleId = 'role_456';
    final testPath = '/api/v1/organizations/$orgCode/users/$userId/roles/$roleId';

    test('removes role from organization user', () async {
      // Arrange
      final expectedResponse = {
        'message': 'Role removed',
        'code': 'OK',
      };

      dioAdapter.onDelete(
        testPath,
        (server) => server.reply(200, expectedResponse),
      );

      // Act
      final response = await organizationsApi.removeOrganizationUserRole(
        orgCode: orgCode,
        userId: userId,
        roleId: roleId,
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data!.code, equals('OK'));
    });

    test('throws DioException on 404 role not found', () async {
      // Arrange
      final errorResponse = {
        'error': 'not_found',
        'error_description': 'Role not assigned to user',
      };

      dioAdapter.onDelete(
        '/api/v1/organizations/acme/users/user_123/roles/nonexistent',
        (server) => server.reply(404, errorResponse),
      );

      // Act & Assert
      expect(
        () => organizationsApi.removeOrganizationUserRole(
          orgCode: orgCode,
          userId: userId,
          roleId: 'nonexistent',
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(404),
        )),
      );
    });
  });

  // Feature Flags
  group('getOrganizationFeatureFlags', () {
    const orgCode = 'acme';
    final testPath = '/api/v1/organizations/$orgCode/feature_flags';

    test('retrieves organization feature flags', () async {
      // Arrange
      final expectedResponse = {
        'feature_flags': {
          'enable_feature_x': {'type': 'bool', 'value': true},
          'max_projects': {'type': 'int', 'value': 5},
        },
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
      );

      // Act
      final response = await organizationsApi.getOrganizationFeatureFlags(
        orgCode: orgCode,
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.featureFlags, isNotNull);
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
        () => organizationsApi.getOrganizationFeatureFlags(orgCode: orgCode),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(403),
        )),
      );
    });
  });

  group('updateOrganizationFeatureFlagOverride', () {
    const orgCode = 'acme';
    const featureFlagKey = 'enable_feature_x';
    final testPath = '/api/v1/organizations/$orgCode/feature_flags/$featureFlagKey';

    test('updates feature flag override', () async {
      // Arrange
      final expectedResponse = {
        'message': 'Feature flag updated',
        'code': 'OK',
      };

      dioAdapter.onPatch(
        testPath,
        (server) => server.reply(200, expectedResponse),
        data: Matchers.any,
      );

      final request = UpdateOrganizationFeatureFlagOverrideRequest((b) => b
        ..value = 'true');

      // Act
      final response = await organizationsApi.updateOrganizationFeatureFlagOverride(
        orgCode: orgCode,
        featureFlagKey: featureFlagKey,
        updateOrganizationFeatureFlagOverrideRequest: request,
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data!.code, equals('OK'));
    });

    test('throws DioException on 404 flag not found', () async {
      // Arrange
      final errorResponse = {
        'error': 'not_found',
        'error_description': 'Feature flag not found',
      };

      dioAdapter.onPatch(
        '/api/v1/organizations/acme/feature_flags/nonexistent',
        (server) => server.reply(404, errorResponse),
        data: Matchers.any,
      );

      final request = UpdateOrganizationFeatureFlagOverrideRequest();

      // Act & Assert
      expect(
        () => organizationsApi.updateOrganizationFeatureFlagOverride(
          orgCode: orgCode,
          featureFlagKey: 'nonexistent',
          updateOrganizationFeatureFlagOverrideRequest: request,
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(404),
        )),
      );
    });
  });
}
