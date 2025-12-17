import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

/// Enterprise-grade tests for EnvironmentsApi
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late EnvironmentsApi environmentsApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    environmentsApi = KindeApi(dio: dio).getEnvironmentsApi();
  });

  tearDown() {
    dioAdapter.reset();
  });

  group('getEnvironementFeatureFlags', () {
    const testPath = '/api/v1/environment/feature_flags';

    group('success scenarios', () {
      test('retrieves environment feature flags', () async {
        // Arrange
        final expectedResponse = {
          'feature_flags': {
            'enable_new_ui': {'type': 'bool', 'value': true},
            'max_users': {'type': 'int', 'value': 100},
            'api_endpoint': {'type': 'str', 'value': 'https://api.example.com'},
          },
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await environmentsApi.getEnvironementFeatureFlags();

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.featureFlags, isNotNull);
      });

      test('returns empty feature flags when none configured', () async {
        // Arrange
        final expectedResponse = {
          'feature_flags': <String, dynamic>{},
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await environmentsApi.getEnvironementFeatureFlags();

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.featureFlags, isNotNull);
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
          () => environmentsApi.getEnvironementFeatureFlags(),
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
          () => environmentsApi.getEnvironementFeatureFlags(),
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
          () => environmentsApi.getEnvironementFeatureFlags(),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(500),
          )),
        );
      });
    });
  });

  group('updateEnvironementFeatureFlagOverride', () {
    const featureFlagKey = 'enable_new_ui';
    final testPath = '/api/v1/environment/feature_flags/$featureFlagKey';

    group('success scenarios', () {
      test('updates feature flag override with new value', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Feature flag override updated successfully',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = UpdateEnvironementFeatureFlagOverrideRequest((b) => b
          ..value = 'true');

        // Act
        final response = await environmentsApi.updateEnvironementFeatureFlagOverride(
          featureFlagKey: featureFlagKey,
          updateEnvironementFeatureFlagOverrideRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('updates numeric feature flag', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Feature flag updated',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          '/api/v1/environment/feature_flags/max_users',
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = UpdateEnvironementFeatureFlagOverrideRequest((b) => b
          ..value = '150');

        // Act
        final response = await environmentsApi.updateEnvironementFeatureFlagOverride(
          featureFlagKey: 'max_users',
          updateEnvironementFeatureFlagOverrideRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });

      test('updates string feature flag', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Feature flag updated',
          'code': 'OK',
        };

        dioAdapter.onPatch(
          '/api/v1/environment/feature_flags/api_endpoint',
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = UpdateEnvironementFeatureFlagOverrideRequest((b) => b
          ..value = 'https://new-api.example.com');

        // Act
        final response = await environmentsApi.updateEnvironementFeatureFlagOverride(
          featureFlagKey: 'api_endpoint',
          updateEnvironementFeatureFlagOverrideRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 feature flag not found', () async {
        // Arrange
        const nonexistentKey = 'nonexistent_flag';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Feature flag not found',
        };

        dioAdapter.onPatch(
          '/api/v1/environment/feature_flags/$nonexistentKey',
          (server) => server.reply(404, errorResponse),
          data: Matchers.any,
        );

        final request = UpdateEnvironementFeatureFlagOverrideRequest();

        // Act & Assert
        expect(
          () => environmentsApi.updateEnvironementFeatureFlagOverride(
            featureFlagKey: nonexistentKey,
            updateEnvironementFeatureFlagOverrideRequest: request,
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
          'error_description': 'Invalid feature flag value',
        };

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
        );

        final request = UpdateEnvironementFeatureFlagOverrideRequest();

        // Act & Assert
        expect(
          () => environmentsApi.updateEnvironementFeatureFlagOverride(
            featureFlagKey: featureFlagKey,
            updateEnvironementFeatureFlagOverrideRequest: request,
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

        final request = UpdateEnvironementFeatureFlagOverrideRequest();

        // Act & Assert
        expect(
          () => environmentsApi.updateEnvironementFeatureFlagOverride(
            featureFlagKey: featureFlagKey,
            updateEnvironementFeatureFlagOverrideRequest: request,
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

        dioAdapter.onPatch(
          testPath,
          (server) => server.reply(403, errorResponse),
          data: Matchers.any,
        );

        final request = UpdateEnvironementFeatureFlagOverrideRequest();

        // Act & Assert
        expect(
          () => environmentsApi.updateEnvironementFeatureFlagOverride(
            featureFlagKey: featureFlagKey,
            updateEnvironementFeatureFlagOverrideRequest: request,
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

  group('deleteEnvironementFeatureFlagOverride', () {
    const featureFlagKey = 'enable_new_ui';
    final testPath = '/api/v1/environment/feature_flags/$featureFlagKey';

    group('success scenarios', () {
      test('deletes feature flag override', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Feature flag override deleted successfully',
          'code': 'OK',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await environmentsApi.deleteEnvironementFeatureFlagOverride(
          featureFlagKey: featureFlagKey,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('deletes numeric feature flag override', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Override deleted',
          'code': 'OK',
        };

        dioAdapter.onDelete(
          '/api/v1/environment/feature_flags/max_users',
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await environmentsApi.deleteEnvironementFeatureFlagOverride(
          featureFlagKey: 'max_users',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 feature flag not found', () async {
        // Arrange
        const nonexistentKey = 'nonexistent_flag';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Feature flag not found',
        };

        dioAdapter.onDelete(
          '/api/v1/environment/feature_flags/$nonexistentKey',
          (server) => server.reply(404, errorResponse),
        );

        // Act & Assert
        expect(
          () => environmentsApi.deleteEnvironementFeatureFlagOverride(
            featureFlagKey: nonexistentKey,
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
          () => environmentsApi.deleteEnvironementFeatureFlagOverride(
            featureFlagKey: featureFlagKey,
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
          () => environmentsApi.deleteEnvironementFeatureFlagOverride(
            featureFlagKey: featureFlagKey,
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

  group('deleteEnvironementFeatureFlagOverrides', () {
    const testPath = '/api/v1/environment/feature_flags';

    group('success scenarios', () {
      test('deletes all feature flag overrides', () async {
        // Arrange
        final expectedResponse = {
          'message': 'All feature flag overrides deleted successfully',
          'code': 'OK',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await environmentsApi.deleteEnvironementFeatureFlagOverrides();

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('succeeds when no overrides exist', () async {
        // Arrange
        final expectedResponse = {
          'message': 'No overrides to delete',
          'code': 'OK',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await environmentsApi.deleteEnvironementFeatureFlagOverrides();

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
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
          () => environmentsApi.deleteEnvironementFeatureFlagOverrides(),
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
          () => environmentsApi.deleteEnvironementFeatureFlagOverrides(),
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
          'error_description': 'Failed to delete overrides',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(500, errorResponse),
        );

        // Act & Assert
        expect(
          () => environmentsApi.deleteEnvironementFeatureFlagOverrides(),
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
