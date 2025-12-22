import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late OAuthApi oAuthApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    oAuthApi = KindeApi(dio: dio).getOAuthApi();
  });

  tearDown(() {
    dioAdapter.reset();
  });

  group('getUser', () {
    const testPath = '/oauth2/user_profile';

    test('retrieves user profile successfully', () async {
      // Arrange
      final expectedResponse = {
        'id': 'user_123',
        'first_name': 'John',
        'last_name': 'Doe',
        'preferred_email': 'john.doe@example.com',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
      );

      // Act
      final response = await oAuthApi.getUser();

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.id, equals('user_123'));
      expect(response.data!.firstName, equals('John'));
      expect(response.data!.lastName, equals('Doe'));
      expect(response.data!.preferredEmail, equals('john.doe@example.com'));
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
        () => oAuthApi.getUser(),
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
        'error_description': 'Internal server error',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(500, errorResponse),
      );

      // Act & Assert
      expect(
        () => oAuthApi.getUser(),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(500),
        )),
      );
    });
  });

  group('getUserProfileV2', () {
    const testPath = '/oauth2/v2/user_profile';

    test('retrieves enhanced user profile successfully', () async {
      // Arrange
      final expectedResponse = {
        'id': 'user_123',
        'given_name': 'John',
        'family_name': 'Doe',
        'email': 'john.doe@example.com',
        'picture': 'https://example.com/avatar.jpg',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
      );

      // Act
      final response = await oAuthApi.getUserProfileV2();

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.id, equals('user_123'));
      expect(response.data!.givenName, equals('John'));
      expect(response.data!.familyName, equals('Doe'));
      expect(response.data!.email, equals('john.doe@example.com'));
      expect(response.data!.picture, equals('https://example.com/avatar.jpg'));
    });

    test('retrieves profile with minimal data', () async {
      // Arrange
      final expectedResponse = {
        'id': 'user_minimal',
        'email': 'minimal@example.com',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
      );

      // Act
      final response = await oAuthApi.getUserProfileV2();

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data!.id, equals('user_minimal'));
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
        () => oAuthApi.getUserProfileV2(),
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
        () => oAuthApi.getUserProfileV2(),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(403),
        )),
      );
    });
  });

  group('tokenIntrospection', () {
    const testPath = '/oauth2/introspect';

    test('introspects valid access token', () async {
      // Arrange
      final expectedResponse = {
        'active': true,
        'client_id': 'client_123',
        'exp': '1672531200',
        'iat': '1672527600',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(200, expectedResponse),
        data: Matchers.any,
      );

      // Act
      final response = await oAuthApi.tokenIntrospection(
        token: 'token_abc123',
        tokenType: 'access_token',
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.active, isTrue);
      expect(response.data!.clientId, equals('client_123'));
    });

    test('introspects inactive token', () async {
      // Arrange
      final expectedResponse = {
        'active': false,
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(200, expectedResponse),
        data: Matchers.any,
      );

      // Act
      final response = await oAuthApi.tokenIntrospection(
        token: 'expired_token',
        tokenType: 'access_token',
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data!.active, isFalse);
    });

    test('throws DioException on 400 invalid request', () async {
      // Arrange
      final errorResponse = {
        'error': 'invalid_request',
        'error_description': 'Token parameter is required',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(400, errorResponse),
        data: Matchers.any,
      );

      // Act & Assert
      expect(
        () => oAuthApi.tokenIntrospection(token: '', tokenType: 'access_token'),
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
        'error_description': 'Invalid credentials',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(401, errorResponse),
        data: Matchers.any,
      );

      // Act & Assert
      expect(
        () => oAuthApi.tokenIntrospection(token: 'test', tokenType: 'access_token'),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(401),
        )),
      );
    });
  });

  group('tokenRevocation', () {
    const testPath = '/oauth2/revoke';

    test('revokes token successfully', () async {
      // Arrange
      dioAdapter.onPost(
        testPath,
        (server) => server.reply(200, null),
        data: Matchers.any,
      );

      // Act
      final response = await oAuthApi.tokenRevocation(
        token: 'token_to_revoke',
        clientId: 'client_123',
        clientSecret: 'secret_456',
      );

      // Assert
      expect(response.statusCode, equals(200));
    });

    test('revokes token with minimal parameters', () async {
      // Arrange
      dioAdapter.onPost(
        testPath,
        (server) => server.reply(200, null),
        data: Matchers.any,
      );

      // Act
      final response = await oAuthApi.tokenRevocation(token: 'token_abc');

      // Assert
      expect(response.statusCode, equals(200));
    });

    test('throws DioException on 400 invalid token', () async {
      // Arrange
      final errorResponse = {
        'error': 'invalid_request',
        'error_description': 'Invalid token format',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(400, errorResponse),
        data: Matchers.any,
      );

      // Act & Assert
      expect(
        () => oAuthApi.tokenRevocation(token: 'invalid'),
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
        'error_description': 'Invalid client credentials',
      };

      dioAdapter.onPost(
        testPath,
        (server) => server.reply(401, errorResponse),
        data: Matchers.any,
      );

      // Act & Assert
      expect(
        () => oAuthApi.tokenRevocation(token: 'token', clientId: 'bad_client'),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(401),
        )),
      );
    });
  });
}
