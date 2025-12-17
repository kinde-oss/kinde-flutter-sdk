import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

/// Enterprise-grade tests for IndustriesApi
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late IndustriesApi industriesApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    industriesApi = KindeApi(dio: dio).getIndustriesApi();
  });

  tearDown(() {
    dioAdapter.reset();
  });

  group('getIndustries', () {
    const testPath = '/api/v1/industries';

    group('success scenarios', () {
      test('lists all industries', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'industries': [
            {
              'key': 'technology',
              'name': 'Technology',
            },
            {
              'key': 'healthcare',
              'name': 'Healthcare',
            },
            {
              'key': 'finance',
              'name': 'Finance',
            },
          ],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await industriesApi.getIndustries();

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.code, equals('OK'));
        expect(response.data!.message, equals('Success'));
      });

      test('filters industries by key', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'industries': [
            {
              'key': 'technology',
              'name': 'Technology',
            },
          ],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'industry_key': 'technology'},
        );

        // Act
        final response = await industriesApi.getIndustries(
          industryKey: 'technology',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });

      test('filters industries by name', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'industries': [
            {
              'key': 'healthcare',
              'name': 'Healthcare',
            },
          ],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'name': 'Healthcare'},
        );

        // Act
        final response = await industriesApi.getIndustries(name: 'Healthcare');

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });

      test('filters with both key and name', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'industries': [
            {
              'key': 'finance',
              'name': 'Finance',
            },
          ],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {
            'industry_key': 'finance',
            'name': 'Finance',
          },
        );

        // Act
        final response = await industriesApi.getIndustries(
          industryKey: 'finance',
          name: 'Finance',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });

      test('returns empty when no matches found', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'industries': [],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'industry_key': 'nonexistent'},
        );

        // Act
        final response = await industriesApi.getIndustries(
          industryKey: 'nonexistent',
        );

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

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(401, errorResponse),
        );

        // Act & Assert
        expect(
          () => industriesApi.getIndustries(),
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
          () => industriesApi.getIndustries(),
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
          () => industriesApi.getIndustries(),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(500),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends query parameters correctly', () async {
        // Arrange
        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, {
            'code': 'OK',
            'message': 'Success',
            'industries': [],
          }),
          queryParameters: {
            'industry_key': 'tech',
            'name': 'Technology',
          },
        );

        // Act
        final response = await industriesApi.getIndustries(
          industryKey: 'tech',
          name: 'Technology',
        );

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });
}
