import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/serializers.dart';
import 'package:kinde_flutter_sdk/src/api/subscribers_api.dart';
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late SubscribersApi subscribersApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    subscribersApi = SubscribersApi(dio, standardSerializers);
  });

  tearDown(() {
    dioAdapter.reset();
  });

  group('createSubscriber', () {
    const testPath = '/api/v1/subscribers';

    group('success scenarios', () {
      test('creates subscriber with complete information', () async {
        // Arrange
        final expectedResponse = {
          'subscriber': {
            'subscriber_id': 'sub_123abc',
            'first_name': 'John',
            'last_name': 'Doe',
            'email': 'john.doe@example.com',
            'is_subscribed': true,
          },
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          queryParameters: {
            'first_name': 'John',
            'last_name': 'Doe',
            'email': 'john.doe@example.com',
          },
        );

        // Act
        final response = await subscribersApi.createSubscriber(
          firstName: 'John',
          lastName: 'Doe',
          email: 'john.doe@example.com',
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data, isNotNull);
        expect(response.data!.subscriber, isNotNull);
        expect(response.data!.subscriber!.subscriberId, equals('sub_123abc'));
      });

      test('creates subscriber with first name only', () async {
        // Arrange
        final expectedResponse = {
          'subscriber': {
            'subscriber_id': 'sub_456def',
            'first_name': 'Jane',
            'is_subscribed': true,
          },
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          queryParameters: {'first_name': 'Jane'},
        );

        // Act
        final response = await subscribersApi.createSubscriber(
          firstName: 'Jane',
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data!.subscriber!.subscriberId, equals('sub_456def'));
      });

      test('creates subscriber with first name and email', () async {
        // Arrange
        final expectedResponse = {
          'subscriber': {
            'subscriber_id': 'sub_789ghi',
            'first_name': 'Bob',
            'email': 'bob@example.com',
            'is_subscribed': true,
          },
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          queryParameters: {
            'first_name': 'Bob',
            'email': 'bob@example.com',
          },
        );

        // Act
        final response = await subscribersApi.createSubscriber(
          firstName: 'Bob',
          email: 'bob@example.com',
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data!.subscriber!.subscriberId, isNotNull);
      });
    });

    group('error scenarios', () {
      test('throws DioException on 400 validation error', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'First name is required',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(400, errorResponse),
          queryParameters: {'first_name': ''},
        );

        // Act & Assert
        expect(
          () => subscribersApi.createSubscriber(firstName: ''),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(400),
          )),
        );
      });

      test('throws DioException on 409 subscriber already exists', () async {
        // Arrange
        final errorResponse = {
          'error': 'conflict',
          'error_description': 'Subscriber with this email already exists',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(409, errorResponse),
          queryParameters: {
            'first_name': 'John',
            'email': 'existing@example.com',
          },
        );

        // Act & Assert
        expect(
          () => subscribersApi.createSubscriber(
            firstName: 'John',
            email: 'existing@example.com',
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
          queryParameters: {'first_name': 'Test'},
        );

        // Act & Assert
        expect(
          () => subscribersApi.createSubscriber(firstName: 'Test'),
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

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(500, errorResponse),
          queryParameters: {'first_name': 'Test'},
        );

        // Act & Assert
        expect(
          () => subscribersApi.createSubscriber(firstName: 'Test'),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(500),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends parameters as query strings', () async {
        // Arrange
        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, {
            'subscriber': {'subscriber_id': 'sub_test', 'first_name': 'Test'}
          }),
          queryParameters: {
            'first_name': 'Test',
            'last_name': 'User',
            'email': 'test@test.com',
          },
        );

        // Act
        final response = await subscribersApi.createSubscriber(
          firstName: 'Test',
          lastName: 'User',
          email: 'test@test.com',
        );

        // Assert
        expect(response.statusCode, equals(201));
      });
    });
  });

  group('getSubscriber', () {
    const subscriberId = 'sub_123abc';
    final testPath = '/api/v1/subscribers/$subscriberId';

    group('success scenarios', () {
      test('retrieves subscriber by ID', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'subscribers': [
            {
              'id': subscriberId,
              'first_name': 'John',
              'last_name': 'Doe',
              'email': 'john.doe@example.com',
            },
          ],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await subscribersApi.getSubscriber(
          subscriberId: subscriberId,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.subscribers, isNotNull);
        expect(response.data!.subscribers!.first.id, equals(subscriberId));
        expect(response.data!.subscribers!.first.firstName, equals('John'));
      });

      test('retrieves subscriber with minimal data', () async {
        // Arrange
        final expectedResponse = {
          'code': 'OK',
          'message': 'Success',
          'subscribers': [
            {
              'id': subscriberId,
              'first_name': 'Jane',
            },
          ],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await subscribersApi.getSubscriber(
          subscriberId: subscriberId,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.subscribers!.first.firstName, equals('Jane'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 subscriber not found', () async {
        // Arrange
        const nonexistentId = 'sub_nonexistent';
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Subscriber not found',
        };

        dioAdapter.onGet(
          '/api/v1/subscribers/$nonexistentId',
          (server) => server.reply(404, errorResponse),
        );

        // Act & Assert
        expect(
          () => subscribersApi.getSubscriber(subscriberId: nonexistentId),
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
          () => subscribersApi.getSubscriber(subscriberId: subscriberId),
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
          () => subscribersApi.getSubscriber(subscriberId: subscriberId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(403),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends subscriber ID in URL path', () async {
        // Arrange
        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, {
            'subscriber': {
              'subscriber_id': subscriberId,
              'first_name': 'Test'
            }
          }),
        );

        // Act
        final response = await subscribersApi.getSubscriber(subscriberId: subscriberId);

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });

  group('getSubscribers', () {
    const testPath = '/api/v1/subscribers';

    group('success scenarios', () {
      test('retrieves all subscribers with default parameters', () async {
        // Arrange
        final expectedResponse = {
          'subscribers': [
            {
              'subscriber_id': 'sub_1',
              'first_name': 'John',
              'email': 'john@example.com',
              'is_subscribed': true,
            },
            {
              'subscriber_id': 'sub_2',
              'first_name': 'Jane',
              'email': 'jane@example.com',
              'is_subscribed': true,
            },
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await subscribersApi.getSubscribers();

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.subscribers, isNotNull);
        expect(response.data!.subscribers!.length, equals(2));
      });

      test('retrieves subscribers with pagination', () async {
        // Arrange
        final expectedResponse = {
          'subscribers': [
            {'subscriber_id': 'sub_1', 'first_name': 'John'},
          ],
          'next_token': 'token_page2',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'page_size': '10'},
        );

        // Act
        final response = await subscribersApi.getSubscribers(pageSize: 10);

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.nextToken, equals('token_page2'));
      });

      test('retrieves subscribers with sorting', () async {
        // Arrange
        final expectedResponse = {
          'subscribers': [
            {'subscriber_id': 'sub_1', 'first_name': 'Alice'},
            {'subscriber_id': 'sub_2', 'first_name': 'Bob'},
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'sort': 'name_asc'},
        );

        // Act
        final response = await subscribersApi.getSubscribers(sort: 'name_asc');

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.subscribers!.length, equals(2));
      });

      test('retrieves subscribers with next token for pagination', () async {
        // Arrange
        final expectedResponse = {
          'subscribers': [
            {'subscriber_id': 'sub_3', 'first_name': 'Charlie'},
          ],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'next_token': 'token_page2'},
        );

        // Act
        final response = await subscribersApi.getSubscribers(
          nextToken: 'token_page2',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.subscribers!.first.firstName, equals('Charlie'));
      });

      test('retrieves empty list when no subscribers', () async {
        // Arrange
        final expectedResponse = {
          'subscribers': [],
          'next_token': null,
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await subscribersApi.getSubscribers();

        // Assert
        expect(response.data!.subscribers, isEmpty);
      });
    });

    group('error scenarios', () {
      test('throws DioException on 400 invalid pagination parameters', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'Invalid page size',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(400, errorResponse),
          queryParameters: {'page_size': '-1'},
        );

        // Act & Assert
        expect(
          () => subscribersApi.getSubscribers(pageSize: -1),
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

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(401, errorResponse),
        );

        // Act & Assert
        expect(
          () => subscribersApi.getSubscribers(),
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
          () => subscribersApi.getSubscribers(),
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
          'error_description': 'Database unavailable',
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(500, errorResponse),
        );

        // Act & Assert
        expect(
          () => subscribersApi.getSubscribers(),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(500),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends pagination parameters as query strings', () async {
        // Arrange
        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, {'subscribers': [], 'next_token': null}),
          queryParameters: {'page_size': '25', 'sort': 'email_desc'},
        );

        // Act
        final response = await subscribersApi.getSubscribers(
          pageSize: 25,
          sort: 'email_desc',
        );

        // Assert
        expect(response.statusCode, equals(200));
      });
    });
  });
}
