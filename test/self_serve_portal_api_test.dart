import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

/// Enterprise-grade tests for SelfServePortalApi
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late SelfServePortalApi selfServePortalApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    selfServePortalApi = KindeApi(dio: dio).getSelfServePortalApi();
  });

  tearDown(() {
    dioAdapter.reset();
  });

  group('generatePortalUrl', () {
    const testPath = '/account_api/v1/portal_link';

    test('generates portal URL with subnav and return URL', () async {
      // Arrange
      final expectedResponse = {
        'url': 'https://portal.kinde.com/access?token=abc123&subnav=settings&return_url=https://myapp.com',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
        queryParameters: {
          'subnav': 'settings',
          'return_url': 'https://myapp.com',
        },
      );

      // Act
      final response = await selfServePortalApi.generatePortalUrl(
        subnav: 'settings',
        returnUrl: 'https://myapp.com',
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data, isNotNull);
      expect(response.data!.url, contains('portal.kinde.com'));
      expect(response.data!.url, contains('subnav=settings'));
    });

    test('generates portal URL without optional parameters', () async {
      // Arrange
      final expectedResponse = {
        'url': 'https://portal.kinde.com/access?token=xyz789',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
      );

      // Act
      final response = await selfServePortalApi.generatePortalUrl();

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data!.url, contains('portal.kinde.com'));
    });

    test('generates portal URL with subnav only', () async {
      // Arrange
      final expectedResponse = {
        'url': 'https://portal.kinde.com/access?token=token123&subnav=billing',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
        queryParameters: {'subnav': 'billing'},
      );

      // Act
      final response = await selfServePortalApi.generatePortalUrl(
        subnav: 'billing',
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data!.url, contains('subnav=billing'));
    });

    test('generates portal URL with return URL only', () async {
      // Arrange
      final expectedResponse = {
        'url': 'https://portal.kinde.com/access?token=token456&return_url=https://app.example.com/dashboard',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(200, expectedResponse),
        queryParameters: {'return_url': 'https://app.example.com/dashboard'},
      );

      // Act
      final response = await selfServePortalApi.generatePortalUrl(
        returnUrl: 'https://app.example.com/dashboard',
      );

      // Assert
      expect(response.statusCode, equals(200));
      expect(response.data!.url, contains('return_url'));
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
        () => selfServePortalApi.generatePortalUrl(),
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
        () => selfServePortalApi.generatePortalUrl(),
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
        'error_description': 'Failed to generate portal link',
      };

      dioAdapter.onGet(
        testPath,
        (server) => server.reply(500, errorResponse),
      );

      // Act & Assert
      expect(
        () => selfServePortalApi.generatePortalUrl(),
        throwsA(isA<DioException>().having(
          (e) => e.response?.statusCode,
          'status code',
          equals(500),
        )),
      );
    });
  });
}
