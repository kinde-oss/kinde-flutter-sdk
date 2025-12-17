import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

/// Enterprise-grade tests for CallbacksApi
void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late CallbacksApi callbacksApi;

  setUp(() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://test.kinde.com',
      contentType: 'application/json',
    ));
    dioAdapter = DioAdapter(dio: dio);
    callbacksApi = KindeApi(dio: dio).getCallbacksApi();
  });

  tearDown(() {
    dioAdapter.reset();
  });

  group('getCallbackURLs', () {
    const appId = 'app_123';
    final testPath = '/api/v1/applications/$appId/auth_redirect_urls';

    group('success scenarios', () {
      test('retrieves callback URLs for application', () async {
        // Arrange
        final expectedResponse = {
          'redirect_urls': [
            'https://myapp.com/callback',
            'https://myapp.com/auth',
            'myapp://callback',
          ],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await callbacksApi.getCallbackURLs(appId: appId);

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.redirectUrls, isNotNull);
        expect(response.data!.redirectUrls!.length, equals(3));
      });

      test('returns empty list when no URLs configured', () async {
        // Arrange
        final expectedResponse = {
          'redirect_urls': [],
        };

        dioAdapter.onGet(
          testPath,
          (server) => server.reply(200, expectedResponse),
        );

        // Act
        final response = await callbacksApi.getCallbackURLs(appId: appId);

        // Assert
        expect(response.data!.redirectUrls, isEmpty);
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 application not found', () async {
        // Arrange
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Application not found',
        };

        dioAdapter.onGet(
          '/api/v1/applications/nonexistent_app/auth_redirect_urls',
          (server) => server.reply(404, errorResponse),
        );

        // Act & Assert
        expect(
          () => callbacksApi.getCallbackURLs(appId: 'nonexistent_app'),
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
          () => callbacksApi.getCallbackURLs(appId: appId),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends app ID in URL path', () async {
        // Arrange
        String? capturedPath;

        dioAdapter.onGet(
          testPath,
          (server) {
            capturedPath = server.request.path;
            return server.reply(200, {'redirect_urls': []});
          },
        );

        // Act
        await callbacksApi.getCallbackURLs(appId: appId);

        // Assert
        expect(capturedPath, contains(appId));
      });
    });
  });

  group('addRedirectCallbackURLs', () {
    const appId = 'app_123';
    final testPath = '/api/v1/applications/$appId/auth_redirect_urls';

    group('success scenarios', () {
      test('adds new callback URLs', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Callback URLs added successfully',
          'code': 'OK',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = ReplaceRedirectCallbackURLsRequest((b) => b
          ..urls.addAll([
            'https://newapp.com/callback',
            'newapp://auth',
          ]));

        // Act
        final response = await callbacksApi.addRedirectCallbackURLs(
          appId: appId,
          replaceRedirectCallbackURLsRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('adds single callback URL', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Callback URL added',
          'code': 'OK',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(201, expectedResponse),
          data: Matchers.any,
        );

        final request = ReplaceRedirectCallbackURLsRequest((b) => b
          ..urls.add('https://singleurl.com/callback'));

        // Act
        final response = await callbacksApi.addRedirectCallbackURLs(
          appId: appId,
          replaceRedirectCallbackURLsRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(201));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 400 invalid URL format', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'Invalid URL format',
        };

        dioAdapter.onPost(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
        );

        final request = ReplaceRedirectCallbackURLsRequest();

        // Act & Assert
        expect(
          () => callbacksApi.addRedirectCallbackURLs(
            appId: appId,
            replaceRedirectCallbackURLsRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(400),
          )),
        );
      });

      test('throws DioException on 404 application not found', () async {
        // Arrange
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Application not found',
        };

        dioAdapter.onPost(
          '/api/v1/applications/nonexistent_app/auth_redirect_urls',
          (server) => server.reply(404, errorResponse),
          data: Matchers.any,
        );

        final request = ReplaceRedirectCallbackURLsRequest();

        // Act & Assert
        expect(
          () => callbacksApi.addRedirectCallbackURLs(
            appId: 'nonexistent_app',
            replaceRedirectCallbackURLsRequest: request,
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
          data: Matchers.any,
        );

        final request = ReplaceRedirectCallbackURLsRequest();

        // Act & Assert
        expect(
          () => callbacksApi.addRedirectCallbackURLs(
            appId: appId,
            replaceRedirectCallbackURLsRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });
    });

    group('request validation', () {
      test('serializes URL list correctly', () async {
        // Arrange
        Map<String, dynamic>? capturedBody;

        dioAdapter.onPost(
          testPath,
          (server) {
            capturedBody = server.request.data as Map<String, dynamic>?;
            return server.reply(201, {'message': 'Success', 'code': 'OK'});
          },
          data: Matchers.any,
        );

        final request = ReplaceRedirectCallbackURLsRequest((b) => b
          ..urls.addAll([
            'https://app1.com/callback',
            'https://app2.com/callback',
          ]));

        // Act
        await callbacksApi.addRedirectCallbackURLs(
          appId: appId,
          replaceRedirectCallbackURLsRequest: request,
        );

        // Assert
        expect(capturedBody, isNotNull);
        expect(capturedBody!['urls'], isList);
        expect(capturedBody!['urls'].length, equals(2));
      });
    });
  });

  group('replaceRedirectCallbackURLs', () {
    const appId = 'app_123';
    final testPath = '/api/v1/applications/$appId/auth_redirect_urls';

    group('success scenarios', () {
      test('replaces all callback URLs', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Callback URLs replaced successfully',
          'code': 'OK',
        };

        dioAdapter.onPut(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = ReplaceRedirectCallbackURLsRequest((b) => b
          ..urls.addAll([
            'https://replaced1.com/callback',
            'https://replaced2.com/callback',
          ]));

        // Act
        final response = await callbacksApi.replaceRedirectCallbackURLs(
          appId: appId,
          replaceRedirectCallbackURLsRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('replaces with empty list (removes all)', () async {
        // Arrange
        final expectedResponse = {
          'message': 'All callback URLs removed',
          'code': 'OK',
        };

        dioAdapter.onPut(
          testPath,
          (server) => server.reply(200, expectedResponse),
          data: Matchers.any,
        );

        final request = ReplaceRedirectCallbackURLsRequest();

        // Act
        final response = await callbacksApi.replaceRedirectCallbackURLs(
          appId: appId,
          replaceRedirectCallbackURLsRequest: request,
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 400 invalid URLs', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'One or more URLs are invalid',
        };

        dioAdapter.onPut(
          testPath,
          (server) => server.reply(400, errorResponse),
          data: Matchers.any,
        );

        final request = ReplaceRedirectCallbackURLsRequest();

        // Act & Assert
        expect(
          () => callbacksApi.replaceRedirectCallbackURLs(
            appId: appId,
            replaceRedirectCallbackURLsRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(400),
          )),
        );
      });

      test('throws DioException on 404 application not found', () async {
        // Arrange
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'Application not found',
        };

        dioAdapter.onPut(
          '/api/v1/applications/nonexistent_app/auth_redirect_urls',
          (server) => server.reply(404, errorResponse),
          data: Matchers.any,
        );

        final request = ReplaceRedirectCallbackURLsRequest();

        // Act & Assert
        expect(
          () => callbacksApi.replaceRedirectCallbackURLs(
            appId: 'nonexistent_app',
            replaceRedirectCallbackURLsRequest: request,
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(404),
          )),
        );
      });
    });
  });

  group('deleteCallbackURLs', () {
    const appId = 'app_123';
    final testPath = '/api/v1/applications/$appId/auth_redirect_urls';

    group('success scenarios', () {
      test('deletes specific callback URLs', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Callback URLs deleted successfully',
          'code': 'OK',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {
            'urls': 'https://old1.com/callback,https://old2.com/callback',
          },
        );

        // Act
        final response = await callbacksApi.deleteCallbackURLs(
          appId: appId,
          urls: 'https://old1.com/callback,https://old2.com/callback',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data, isNotNull);
        expect(response.data!.message, contains('successfully'));
        expect(response.data!.code, equals('OK'));
      });

      test('deletes single callback URL', () async {
        // Arrange
        final expectedResponse = {
          'message': 'Callback URL deleted',
          'code': 'OK',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(200, expectedResponse),
          queryParameters: {'urls': 'https://single.com/callback'},
        );

        // Act
        final response = await callbacksApi.deleteCallbackURLs(
          appId: appId,
          urls: 'https://single.com/callback',
        );

        // Assert
        expect(response.statusCode, equals(200));
        expect(response.data!.code, equals('OK'));
      });
    });

    group('error scenarios', () {
      test('throws DioException on 404 URL not found', () async {
        // Arrange
        final errorResponse = {
          'error': 'not_found',
          'error_description': 'One or more URLs not found',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(404, errorResponse),
          queryParameters: {'urls': 'https://nonexistent.com/callback'},
        );

        // Act & Assert
        expect(
          () => callbacksApi.deleteCallbackURLs(
            appId: appId,
            urls: 'https://nonexistent.com/callback',
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(404),
          )),
        );
      });

      test('throws DioException on 400 invalid format', () async {
        // Arrange
        final errorResponse = {
          'error': 'validation_error',
          'error_description': 'Invalid URL format',
        };

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(400, errorResponse),
          queryParameters: {'urls': 'invalid-url'},
        );

        // Act & Assert
        expect(
          () => callbacksApi.deleteCallbackURLs(
            appId: appId,
            urls: 'invalid-url',
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

        dioAdapter.onDelete(
          testPath,
          (server) => server.reply(401, errorResponse),
          queryParameters: {'urls': 'https://test.com/callback'},
        );

        // Act & Assert
        expect(
          () => callbacksApi.deleteCallbackURLs(
            appId: appId,
            urls: 'https://test.com/callback',
          ),
          throwsA(isA<DioException>().having(
            (e) => e.response?.statusCode,
            'status code',
            equals(401),
          )),
        );
      });
    });

    group('request validation', () {
      test('sends URLs as query parameter', () async {
        // Arrange
        Map<String, dynamic>? capturedParams;

        dioAdapter.onDelete(
          testPath,
          (server) {
            capturedParams = server.request.queryParameters;
            return server.reply(200, {'message': 'Deleted', 'code': 'OK'});
          },
          queryParameters: {'urls': 'https://test.com/callback'},
        );

        // Act
        await callbacksApi.deleteCallbackURLs(
          appId: appId,
          urls: 'https://test.com/callback',
        );

        // Assert
        expect(capturedParams, isNotNull);
        expect(capturedParams!['urls'], equals('https://test.com/callback'));
      });
    });
  });
}
