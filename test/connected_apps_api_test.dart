import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

/// Enterprise-grade tests for ConnectedAppsApi
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late ConnectedAppsApi connectedAppsApi;

  setUp() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    connectedAppsApi = KindeApi(dio: dio).getConnectedAppsApi();
  });

  tearDown() {
    dioAdapter.reset();
  });

  group('getConnectedAppAuthUrl', () {
    const testPath = '/api/v1/connected_apps/auth_url';

    test('retrieves connected app auth URL successfully', () async {
      // Arrange
      final expectedResponse = {
        'url': 'https://auth.provider.com/authorize?client_id=abc123&state=xyz',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
        queryParameters: {
          'key_code_ref': 'slack_app',
          'user_id': 'user_123',
        },
      );

      // Act
      final response = await connectedAppsApi.getConnectedAppAuthUrl(
        keyCodeRef: 'slack_app',
        userId: 'user_123',
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.url, contains('https://auth.provider.com'));
    });

    test('throws DioException on 404 app not found', () async {
      // Arrange
      final errorResponse = {
        'error': 'not_found',
        'error_description': 'Connected app not found',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(404, errorResponse),
        queryParameters: {
          'key_code_ref': 'nonexistent',
          'user_id': 'user_123',
        },
      );

      // Act & Assert
      expect(
        () => connectedAppsApi.getConnectedAppAuthUrl(
          keyCodeRef: 'nonexistent',
          userId: 'user_123',
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

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(401, errorResponse),
        queryParameters: {
          'key_code_ref': 'app',
          'user_id': 'user_123',
        },
      );

      // Act & Assert
      expect(
        () => connectedAppsApi.getConnectedAppAuthUrl(
          keyCodeRef: 'app',
          userId: 'user_123',
        ),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(401),
        )),
      );
    });
  });

  group('getConnectedAppToken', () {
    const testPath = '/api/v1/connected_apps/token';

    test('retrieves connected app access token', () async {
      // Arrange
      final expectedResponse = {
        'access_token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...',
        'token_type': 'Bearer',
        'expires_in': 3600,
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
        queryParameters: {'session_id': 'session_abc123'},
      );

      // Act
      final response = await connectedAppsApi.getConnectedAppToken(
        sessionId: 'session_abc123',
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.accessToken, isNotNull);
      expect(response.data!.tokenType, equals('Bearer'));
      expect(response.data!.expiresIn, equals(3600));
    });

    test('throws DioException on 404 session not found', () async {
      // Arrange
      final errorResponse = {
        'error': 'not_found',
        'error_description': 'Session not found or expired',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(404, errorResponse),
        queryParameters: {'session_id': 'invalid_session'},
      );

      // Act & Assert
      expect(
        () => connectedAppsApi.getConnectedAppToken(
          sessionId: 'invalid_session',
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

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(401, errorResponse),
        queryParameters: {'session_id': 'session_abc'},
      );

      // Act & Assert
      expect(
        () => connectedAppsApi.getConnectedAppToken(sessionId: 'session_abc'),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(401),
        )),
      );
    });

    test('throws DioException on 500 server error', () async {
      // Arrange
      final errorResponse = {
        'error': 'server_error',
        'error_description': 'Failed to retrieve token',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(500, errorResponse),
        queryParameters: {'session_id': 'session_abc'},
      );

      // Act & Assert
      expect(
        () => connectedAppsApi.getConnectedAppToken(sessionId: 'session_abc'),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(500),
        )),
      );
    });
  });

  group('revokeConnectedAppToken', () {
    const testPath = '/api/v1/connected_apps/revoke';

    test('revokes connected app token successfully', () async {
      // Arrange
      final expectedResponse = {
        'message': 'Token revoked successfully',
        'code': 'OK',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(200, expectedResponse),
        queryParameters: {'session_id': 'session_abc123'},
      );

      // Act
      final response = await connectedAppsApi.revokeConnectedAppToken(
        sessionId: 'session_abc123',
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.message, contains('successfully'));
      expect(response.data!.code, equals('OK'));
    });

    test('throws DioException on 404 session not found', () async {
      // Arrange
      final errorResponse = {
        'error': 'not_found',
        'error_description': 'Session not found',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(404, errorResponse),
        queryParameters: {'session_id': 'invalid_session'},
      );

      // Act & Assert
      expect(
        () => connectedAppsApi.revokeConnectedAppToken(
          sessionId: 'invalid_session',
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

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(401, errorResponse),
        queryParameters: {'session_id': 'session_abc'},
      );

      // Act & Assert
      expect(
        () => connectedAppsApi.revokeConnectedAppToken(sessionId: 'session_abc'),
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

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(403, errorResponse),
        queryParameters: {'session_id': 'session_abc'},
      );

      // Act & Assert
      expect(
        () => connectedAppsApi.revokeConnectedAppToken(sessionId: 'session_abc'),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(403),
        )),
      );
    });
  });
}
