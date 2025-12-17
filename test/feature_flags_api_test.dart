import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

/// Enterprise-grade tests for FeatureFlagsApi
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late FeatureFlagsApi featureFlagsApi;

  setUp() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    featureFlagsApi = KindeApi(dio: dio).getFeatureFlagsApi();
  });

  tearDown() {
    dioAdapter.reset();
  });

  group('createFeatureFlag', () {
    const testPath = '/api/v1/feature_flags';

    test('creates feature flag with complete data', () async {
      // Arrange
      final expectedResponse = {
        'message': 'Feature flag created successfully',
        'code': 'OK',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(201, expectedResponse),
        data: Matchers.any,
      );

      final request = CreateFeatureFlagRequest((b) => b
        ..name = 'enable_feature_x'
        ..description = 'Enable new feature X'
        ..key = 'enable_feature_x'
        ..type = 'bool');

      // Act
      final response = await featureFlagsApi.createFeatureFlag(
        createFeatureFlagRequest: request,
      );

      // Assert
      expect(response.statusCode, equals(201));
      expect(response.data, isNotNull);
      expect(response.data!.message, contains('successfully'));
      expect(response.data!.code, equals('OK'));
    });

    test('throws DioException on 409 conflict', () async {
      // Arrange
      final errorResponse = {
        'error': 'conflict',
        'error_description': 'Feature flag already exists',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(409, errorResponse),
        data: Matchers.any,
      );

      final request = CreateFeatureFlagRequest();

      // Act & Assert
      expect(
        () => featureFlagsApi.createFeatureFlag(
          createFeatureFlagRequest: request,
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(409),
        )),
      );
    });

    test('throws DioException on 400 validation error', () async {
      // Arrange
      final errorResponse = {
        'error': 'validation_error',
        'error_description': 'Invalid feature flag data',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(400, errorResponse),
        data: Matchers.any,
      );

      final request = CreateFeatureFlagRequest();

      // Act & Assert
      expect(
        () => featureFlagsApi.createFeatureFlag(
          createFeatureFlagRequest: request,
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(400),
        )),
      );
    });
  });

  group('updateFeatureFlag', () {
    const featureFlagKey = 'enable_feature_x';
    final testPath = '/api/v1/feature_flags/$featureFlagKey';

    test('updates feature flag with new configuration', () async {
      // Arrange
      final expectedResponse = {
        'message': 'Feature flag updated',
        'code': 'OK',
      };

      dioAdapter.onPut(
        testPath,
        (server) => server.reply(200, expectedResponse),
        queryParameters: {
          'name': 'Updated Feature X',
          'description': 'Updated description',
          'type': 'bool',
          'allow_override_level': 'env',
          'default_value': 'true',
        },
      );

      // Act
      final response = await featureFlagsApi.updateFeatureFlag(
        featureFlagKey: featureFlagKey,
        name: 'Updated Feature X',
        description: 'Updated description',
        type: 'bool',
        allowOverrideLevel: 'env',
        defaultValue: 'true',
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
        'error_description': 'Feature flag not found',
      };

      dioAdapter.onPut(
        '/api/v1/feature_flags/nonexistent',
        (server) => server.reply(404, errorResponse),
        queryParameters: {
          'name': 'Test',
          'description': 'Test',
          'type': 'bool',
          'allow_override_level': 'env',
          'default_value': 'false',
        },
      );

      // Act & Assert
      expect(
        () => featureFlagsApi.updateFeatureFlag(
          featureFlagKey: 'nonexistent',
          name: 'Test',
          description: 'Test',
          type: 'bool',
          allowOverrideLevel: 'env',
          defaultValue: 'false',
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
        'error_description': 'Invalid token',
      };

      dioAdapter.onPut(
        testPath,
        (server) => server.reply(401, errorResponse),
        queryParameters: {
          'name': 'Test',
          'description': 'Test',
          'type': 'bool',
          'allow_override_level': 'env',
          'default_value': 'false',
        },
      );

      // Act & Assert
      expect(
        () => featureFlagsApi.updateFeatureFlag(
          featureFlagKey: featureFlagKey,
          name: 'Test',
          description: 'Test',
          type: 'bool',
          allowOverrideLevel: 'env',
          defaultValue: 'false',
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(401),
        )),
      );
    });
  });

  group('deleteFeatureFlag', () {
    const featureFlagKey = 'enable_feature_x';
    final testPath = '/api/v1/feature_flags/$featureFlagKey';

    test('deletes feature flag successfully', () async {
      // Arrange
      final expectedResponse = {
        'message': 'Feature flag deleted',
        'code': 'OK',
      };

      dioAdapter.onDelete(
        testPath,
        (server) => server.reply(200, expectedResponse),
      );

      // Act
      final response = await featureFlagsApi.deleteFeatureFlag(
        featureFlagKey: featureFlagKey,
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data!.code, equals('OK'));
    });

    test('throws DioException on 404 not found', () async {
      // Arrange
      final errorResponse = {
        'error': 'not_found',
        'error_description': 'Feature flag not found',
      };

      dioAdapter.onDelete(
        '/api/v1/feature_flags/nonexistent',
        (server) => server.reply(404, errorResponse),
      );

      // Act & Assert
      expect(
        () => featureFlagsApi.deleteFeatureFlag(featureFlagKey: 'nonexistent'),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(404),
        )),
      );
    });

    test('throws DioException on 409 conflict (in use)', () async {
      // Arrange
      final errorResponse = {
        'error': 'conflict',
        'error_description': 'Cannot delete feature flag in use',
      };

      dioAdapter.onDelete(
        testPath,
        (server) => server.reply(409, errorResponse),
      );

      // Act & Assert
      expect(
        () => featureFlagsApi.deleteFeatureFlag(featureFlagKey: featureFlagKey),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(409),
        )),
      );
    });
  });
}
