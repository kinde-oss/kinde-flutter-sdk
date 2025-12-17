import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

/// Enterprise-grade tests for ApplicationsApi
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ApplicationsApi applicationsApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    applicationsApi = KindeApi(dio: dio).getApplicationsApi();
  });

  tearDown() {
    dioAdapter.reset();
  });

  group('createApplication', () {
    const testPath = '/api/v1/applications';

    group('success scenarios', () {
      test('creates application with complete data', () async {
        // Arrange
        final expectedResponse = {
          'id': 'app_123abc',
          'name': 'My App',
          'type': 'spa',
          'client_id': 'client_456',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = CreateApplicationRequest((b) => b
          ..name = 'My App'
          ..type = CreateApplicationRequestTypeEnum.spa);

        // Act
        final response = await applicationsApi.createApplication(
          createApplicationRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data, isNotNull);
        expect(response.data!.id, equals('app_123abc'));
        expect(response.data!.name, equals('My App'));
        expect(response.data!.type, equals('spa'));
        expect(response.data!.clientId, equals('client_456'));
      });

      test('creates application with minimal data', () async {
        // Arrange
        final expectedResponse = {
          'id': 'app_minimal',
          'name': 'Minimal App',
          'type': 'reg',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = CreateApplicationRequest((b) => b
          ..name = 'Minimal App'
          ..type = CreateApplicationRequestTypeEnum.reg);

        // Act
        final response = await applicationsApi.createApplication(
          createApplicationRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data!.id, equals('app_minimal'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 400 validation error', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'Application name is required',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
        );

        final request = CreateApplicationRequest();

        // Act & Assert
        expect(
          () => applicationsApi.createApplication(
            createApplicationRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(400),
          )),
        );
      });

      test('throws DioException on 409 application already exists', () async {
        // Arrange
        final errorResponse = {
          'error': 'conflict',
          'error_description': 'Application with this name already exists',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(409, errorResponse),
          data: Matchers.any,
        );

        final request = CreateApplicationRequest((b) => b..name = 'Existing App');

        // Act & Assert
        expect(
          () => applicationsApi.createApplication(
            createApplicationRequest: request,
          ),
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

        final request = CreateApplicationRequest();

        // Act & Assert
        expect(
          () => applicationsApi.createApplication(
            createApplicationRequest: request,
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

  group('getApplication', () {
    const applicationId = 'app_123';
    final testPath = '/api/v1/applications/$applicationId';

    group('success scenarios', () {
      test('retrieves application by ID', () async {
        // Arrange
        final expectedResponse = {
          'id': applicationId,
          'name': 'My App',
          'type': 'spa',
          'client_id': 'client_123',
          'is_active': true,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await applicationsApi.getApplication(
          applicationId: applicationId,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.id, equals(applicationId));
        expect(response.data!.name, equals('My App'));
        expect(response.data!.type, equals('spa'));
      });

      test('retrieves application with minimal data', () async {
        // Arrange
        final expectedResponse = {
          'id': applicationId,
          'name': 'Simple App',
          'type': 'reg',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await applicationsApi.getApplication(
          applicationId: applicationId,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.name, equals('Simple App'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 application not found', () async {
        // Arrange
        const nonexistentId = 'app_nonexistent';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Application not found',
        };

        dioAdapter.onGet(
          '/api/v1/applications/$nonexistentId',
          (server) => server.reply(404, errorResponse),
        );

        // Act & Assert
        expect(
          () => applicationsApi.getApplication(applicationId: nonexistentId),
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
          () => applicationsApi.getApplication(applicationId: applicationId),
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
          () => applicationsApi.getApplication(applicationId: applicationId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(403),
          )),
        );
      });
    });
  });

  group('getApplications', () {
    const testPath = '/api/v1/applications';

    group('success scenarios', () {
      test('retrieves all applications with default parameters', () async {
        // Arrange
        final expectedResponse = {
          'applications': [
            {'id': 'app_1', 'name': 'App One', 'type': 'spa'},
            {'id': 'app_2', 'name': 'App Two', 'type': 'reg'},
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await applicationsApi.getApplications();

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.applications, isNotNull);
        expect(response.data!.applications!.length, equals(2));
      });

      test('retrieves applications with pagination', () async {
        // Arrange
        final expectedResponse = {
          'applications': [
            {'id': 'app_1', 'name': 'App One'},
          ],
          'next_token': 'token_page2',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'page_size': '10'},
        );

        // Act
        final response = await applicationsApi.getApplications(pageSize: 10);

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.nextToken, equals('token_page2'));
      });

      test('retrieves applications with sorting', () async {
        // Arrange
        final expectedResponse = {
          'applications': [
            {'id': 'app_1', 'name': 'Alpha App'},
            {'id': 'app_2', 'name': 'Beta App'},
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'sort': 'name_asc'},
        );

        // Act
        final response = await applicationsApi.getApplications(
          sort: 'name_asc',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.applications!.length, equals(2));
      });

      test('retrieves applications with next token', () async {
        // Arrange
        final expectedResponse = {
          'applications': [
            {'id': 'app_3', 'name': 'Charlie App'},
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'next_token': 'token_page2'},
        );

        // Act
        final response = await applicationsApi.getApplications(
          nextToken: 'token_page2',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.applications!.first.name, equals('Charlie App'));
      });

      test('returns empty list when no applications', () async {
        // Arrange
        final expectedResponse = {
          'applications': [],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await applicationsApi.getApplications();

        // Assert
        expect(response.data!.applications, isEmpty);
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
          () => applicationsApi.getApplications(),
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
          () => applicationsApi.getApplications(),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(403),
          )),
        );
      });

      test('throws DioException on 500 server error', () async {
        // Arrange
        final errorResponse = {
          'error': 'server_error',
          'error_description': 'Internal server error',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(500, errorResponse),
        );

        // Act & Assert
        expect(
          () => applicationsApi.getApplications(),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(500),
          )),
        );
      });
    });
  });

  group('updateApplication', () {
    const applicationId = 'app_123';
    final testPath = '/api/v1/applications/$applicationId';

    group('success scenarios', () {
      test('updates application with new data', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Application updated successfully',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = UpdateApplicationRequest((b) => b..name = 'Updated App');

        // Act
        final response = await applicationsApi.updateApplication(
          applicationId: applicationId,
          updateApplicationRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('updates application name only', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Application updated',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = UpdateApplicationRequest((b) => b..name = 'New Name');

        // Act
        final response = await applicationsApi.updateApplication(
          applicationId: applicationId,
          updateApplicationRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 application not found', () async {
        // Arrange
        const nonexistentId = 'app_nonexistent';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Application not found',
        };

        dioAdapter.onPatch(
          '/api/v1/applications/$nonexistentId',
          (server) => server.reply(404, errorResponse),
          data: Matchers.any,
        );

        final request = UpdateApplicationRequest();

        // Act & Assert
        expect(
          () => applicationsApi.updateApplication(
            applicationId: nonexistentId,
            updateApplicationRequest: request,
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
          'error_description': 'Invalid application data',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
        );

        final request = UpdateApplicationRequest();

        // Act & Assert
        expect(
          () => applicationsApi.updateApplication(
            applicationId: applicationId,
            updateApplicationRequest: request,
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

        final request = UpdateApplicationRequest();

        // Act & Assert
        expect(
          () => applicationsApi.updateApplication(
            applicationId: applicationId,
            updateApplicationRequest: request,
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

  group('deleteApplication', () {
    const applicationId = 'app_123';
    final testPath = '/api/v1/applications/$applicationId';

    group('success scenarios', () {
      test('deletes application successfully', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Application deleted successfully',
          'code': 'OK',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await applicationsApi.deleteApplication(
          applicationId: applicationId,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 application not found', () async {
        // Arrange
        const nonexistentId = 'app_nonexistent';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Application not found',
        };

        dioAdapter.onDelete(
          '/api/v1/applications/$nonexistentId',
          (server) => server.reply(404, errorResponse),
        );

        // Act & Assert
        expect(
          () => applicationsApi.deleteApplication(applicationId: nonexistentId),
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
          () => applicationsApi.deleteApplication(applicationId: applicationId),
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
          () => applicationsApi.deleteApplication(applicationId: applicationId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(403),
          )),
        );
      });

      test('throws DioException on 409 conflict (application in use)', () async {
        // Arrange
        final errorResponse = {
          'error': 'conflict',
          'error_description': 'Cannot delete application that is in use',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(409, errorResponse),
        );

        // Act & Assert
        expect(
          () => applicationsApi.deleteApplication(applicationId: applicationId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(409),
          )),
        );
      });
    });
  });
}

