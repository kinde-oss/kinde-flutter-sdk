import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/serializers.dart';
import 'package:kinde_flutter_sdk/src/api/applications_api.dart';
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
    applicationsApi = ApplicationsApi(dio, standardSerializers);
  });

  tearDown(() {
    dioAdapter.reset();
  });

  group('createApplication', () {
    const testPath = '/api/v1/applications';

    group('success scenarios', () {
      test('creates application successfully', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Application created successfully',
          'application': {
            'id': 'app_123abc',
            'client_id': 'client_456',
          },
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
        expect(response.data!.application, isNotNull);

        final responseData = response.data;
        final actualApplication = responseData?.application;
        final expectedApplication = CreateApplicationResponseApplication(
          (b) => b
            ..id = 'app_123abc'
            ..clientId = 'client_456',
        );
        expect(actualApplication, expectedApplication);
      });
    });

    group('error scenarios', () {
      test('throws DioException on server error', () async {
        // Arrange
        final errorResponse = {
          'error': 'server_error',
          'error_description': 'Internal server error',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(500, errorResponse),
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
            equals(500),
          )),
        );
      });
    });
  });

  group('getApplication', () {
    const applicationId = 'app_123';
    final testPath = '/api/v1/applications/$applicationId';

    group('success scenarios', () {
      test('retrieves application successfully', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Application retrieved',
          'application': {
            'id': applicationId,
            'name': 'My App',
            'type': 'spa',
            'client_id': 'client_123',
            'is_active': true,
          },
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
        expect(response.data!.application, isNotNull);
        expect(response.data!.application!.id, equals(applicationId));
        expect(response.data!.application!.name, equals('My App'));
        expect(response.data!.application!.type, equals('spa'));

        final responseData = response.data;
        final actualApplication = responseData?.application;
        final expectedApplication = GetApplicationResponseApplication(
          (b) => b
            ..id = applicationId
            ..name = 'My App'
            ..type = 'spa'
            ..clientId = 'client_123',
        );
        expect(actualApplication, expectedApplication);
      });
    });

    group('error scenarios', () {
      test('throws DioException on server error', () async {
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
          () => applicationsApi.getApplication(applicationId: applicationId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(500),
          )),
        );
      });
    });
  });

  group('getApplications', () {
    const testPath = '/api/v1/applications';

    group('success scenarios', () {
      test('retrieves all applications successfully', () async {
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

        final responseData = response.data;
        final actualApplications = responseData?.applications;
        final expectedApplications = [
          Applications(
            (b) => b
              ..id = 'app_1'
              ..name = 'App One'
              ..type = 'spa',
          ),
          Applications(
            (b) => b
              ..id = 'app_2'
              ..name = 'App Two'
              ..type = 'reg',
          ),
        ].toBuiltList();
        expect(actualApplications, expectedApplications);
      });

    });

    group('error scenarios', () {
      test('throws DioException on server error', () async {
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
      test('updates application successfully', () async {
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

        // Act & Assert
        expect(
          applicationsApi.updateApplication(
            applicationId: applicationId,
            updateApplicationRequest: request,
          ),
          completes,
        );
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
      });
    });

    group('error scenarios', () {
      test('throws DioException on server error', () async {
        // Arrange
        final errorResponse = {
          'error': 'server_error',
          'error_description': 'Internal server error',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(500, errorResponse),
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
            equals(500),
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

        final responseData = response.data;
        final expectedSuccessResponse = SuccessResponse(
          (b) => b
            ..message = 'Application deleted successfully'
            ..code = 'OK',
        );
        expect(responseData, expectedSuccessResponse);
      });
    });

    group('error scenarios', () {
      test('throws DioException on server error', () async {
        // Arrange
        final errorResponse = {
          'error': 'server_error',
          'error_description': 'Internal server error',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(500, errorResponse),
        );

        // Act & Assert
        expect(
          () => applicationsApi.deleteApplication(applicationId: applicationId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(500),
          )),
        );
      });
    });
  });
}

