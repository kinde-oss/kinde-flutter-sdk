import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/serializers.dart';
import 'package:kinde_flutter_sdk/src/api/timezones_api.dart';
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late TimezonesApi timezonesApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    timezonesApi = TimezonesApi(dio, standardSerializers);
  });

  tearDown(() {
    dioAdapter.reset();
  });

  group('getTimezones', () {
    const testPath = '/api/v1/timezones';

    group('success scenarios', () {
      test('lists all timezones', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'timezones': [
            {
              'key': 'America/New_York',
              'name': 'Eastern Time (US & Canada)',
            },
            {
              'key': 'Europe/London',
              'name': 'London',
            },
            {
              'key': 'Asia/Tokyo',
              'name': 'Tokyo',
            },
          ],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await timezonesApi.getTimezones();

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.code, equals('OK'));
        expect(response.data!.message, equals('Success'));
      });

      test('filters timezones by key', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'timezones': [
            {
              'key': 'America/New_York',
              'name': 'Eastern Time (US & Canada)',
            },
          ],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'timezone_key': 'America/New_York'},
        );

        // Act
        final response = await timezonesApi.getTimezones(
          timezoneKey: 'America/New_York',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });

      test('filters timezones by name', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'timezones': [
            {
              'key': 'Europe/London',
              'name': 'London',
            },
          ],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'name': 'London'},
        );

        // Act
        final response = await timezonesApi.getTimezones(name: 'London');

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });

      test('filters with both key and name', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'timezones': [
            {
              'key': 'Asia/Tokyo',
              'name': 'Tokyo',
            },
          ],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {
            'timezone_key': 'Asia/Tokyo',
            'name': 'Tokyo',
          },
        );

        // Act
        final response = await timezonesApi.getTimezones(
          timezoneKey: 'Asia/Tokyo',
          name: 'Tokyo',
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
          'timezones': [],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'timezone_key': 'NonExistent/Timezone'},
        );

        // Act
        final response = await timezonesApi.getTimezones(
          timezoneKey: 'NonExistent/Timezone',
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
          () => timezonesApi.getTimezones(),
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
          () => timezonesApi.getTimezones(),
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
          () => timezonesApi.getTimezones(),
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
            'timezones': [],
          }),
          queryParameters: {
            'timezone_key': 'Pacific/Auckland',
            'name': 'Auckland',
          },
        );

        // Act
        final response = await timezonesApi.getTimezones(
          timezoneKey: 'Pacific/Auckland',
          name: 'Auckland',
        );

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });
}
