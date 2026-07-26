import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/src/token/token_api.dart';

void main() {
  group('TokenApi', () {
    late Dio dio;
    late DioAdapter dioAdapter;
    late TokenApi tokenApi;

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: 'https://auth.example.com'));
      dioAdapter = DioAdapter(dio: dio);
      tokenApi = TokenApi(dio);
    });

    tearDown(() {
      dioAdapter.close();
    });

    group('retrieveToken', () {
      test('should make POST request to /oauth2/token', () async {
        const version = 'Flutter/1.0.0';
        final params = {
          'grant_type': 'refresh_token',
          'refresh_token': 'mock_refresh_token',
          'client_id': 'test_client_id',
        };

        dioAdapter.onPost(
          '/oauth2/token',
          (server) => server.reply(200, {
            'access_token': 'new_access_token',
            'refresh_token': 'new_refresh_token',
            'expires_in': 3600,
            'token_type': 'Bearer',
          }),
          data: params,
          headers: {
            'content-type': 'application/x-www-form-urlencoded',
            'Kinde-SDK': version,
          },
        );

        final result = await tokenApi.retrieveToken(version, params);

        expect(result['access_token'], equals('new_access_token'));
        expect(result['refresh_token'], equals('new_refresh_token'));
        expect(result['expires_in'], equals(3600));
        expect(result['token_type'], equals('Bearer'));
      });

      test('should include Kinde-SDK header with version', () async {
        const version = 'Flutter/2.5.0';
        final params = {
          'grant_type': 'refresh_token',
          'refresh_token': 'token',
          'client_id': 'client',
        };

        RequestOptions? capturedOptions;

        dioAdapter.onPost(
          '/oauth2/token',
          (server) {
            return server.reply(200, {
              'access_token': 'token',
            });
          },
          data: Matchers.any,
        );

        // Use a custom interceptor to capture the request
        dio.interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) {
            capturedOptions = options;
            handler.next(options);
          },
        ));

        await tokenApi.retrieveToken(version, params);

        expect(capturedOptions?.headers['Kinde-SDK'], equals(version));
      });

      test('should use form-urlencoded content type', () async {
        const version = 'Flutter/1.0.0';
        final params = {
          'grant_type': 'authorization_code',
          'code': 'auth_code',
          'redirect_uri': 'https://app.example.com/callback',
          'client_id': 'test_client',
        };

        RequestOptions? capturedOptions;

        dioAdapter.onPost(
          '/oauth2/token',
          (server) => server.reply(200, {
            'access_token': 'token',
          }),
          data: Matchers.any,
        );

        dio.interceptors.add(InterceptorsWrapper(
          onRequest: (options, handler) {
            capturedOptions = options;
            handler.next(options);
          },
        ));

        await tokenApi.retrieveToken(version, params);

        expect(capturedOptions?.contentType,
            equals(Headers.formUrlEncodedContentType));
      });

      test('should handle successful token response with id_token', () async {
        const version = 'Flutter/1.0.0';
        final params = {
          'grant_type': 'refresh_token',
          'refresh_token': 'refresh',
          'client_id': 'client',
        };

        dioAdapter.onPost(
          '/oauth2/token',
          (server) => server.reply(200, {
            'access_token': 'access_token_value',
            'id_token': 'id_token_value',
            'refresh_token': 'new_refresh_token',
            'expires_in': 7200,
            'token_type': 'Bearer',
            'scope': 'openid profile email',
          }),
          data: Matchers.any,
        );

        final result = await tokenApi.retrieveToken(version, params);

        expect(result['access_token'], equals('access_token_value'));
        expect(result['id_token'], equals('id_token_value'));
        expect(result['refresh_token'], equals('new_refresh_token'));
        expect(result['expires_in'], equals(7200));
        expect(result['scope'], equals('openid profile email'));
      });

      test('should throw DioException on 400 error (invalid grant)', () async {
        const version = 'Flutter/1.0.0';
        final params = {
          'grant_type': 'refresh_token',
          'refresh_token': 'invalid_token',
          'client_id': 'client',
        };

        dioAdapter.onPost(
          '/oauth2/token',
          (server) => server.reply(400, {
            'error': 'invalid_grant',
            'error_description': 'The refresh token is invalid or expired',
          }),
          data: Matchers.any,
        );

        expect(
          () => tokenApi.retrieveToken(version, params),
          throwsA(isA<DioException>()),
        );
      });

      test('should throw DioException on 401 error (invalid client)', () async {
        const version = 'Flutter/1.0.0';
        final params = {
          'grant_type': 'refresh_token',
          'refresh_token': 'token',
          'client_id': 'wrong_client',
        };

        dioAdapter.onPost(
          '/oauth2/token',
          (server) => server.reply(401, {
            'error': 'invalid_client',
            'error_description': 'Client authentication failed',
          }),
          data: Matchers.any,
        );

        expect(
          () => tokenApi.retrieveToken(version, params),
          throwsA(isA<DioException>()),
        );
      });

      test('should throw DioException on 500 server error', () async {
        const version = 'Flutter/1.0.0';
        final params = {
          'grant_type': 'refresh_token',
          'refresh_token': 'token',
          'client_id': 'client',
        };

        dioAdapter.onPost(
          '/oauth2/token',
          (server) => server.reply(500, {
            'error': 'server_error',
            'error_description': 'Internal server error',
          }),
          data: Matchers.any,
        );

        expect(
          () => tokenApi.retrieveToken(version, params),
          throwsA(isA<DioException>()),
        );
      });

      test('should handle authorization_code grant type', () async {
        const version = 'Flutter/1.0.0';
        final params = {
          'grant_type': 'authorization_code',
          'code': 'authorization_code_value',
          'redirect_uri': 'https://app.example.com/callback',
          'client_id': 'test_client',
          'code_verifier': 'pkce_verifier',
        };

        dioAdapter.onPost(
          '/oauth2/token',
          (server) => server.reply(200, {
            'access_token': 'new_access_token',
            'id_token': 'new_id_token',
            'refresh_token': 'new_refresh_token',
            'expires_in': 3600,
            'token_type': 'Bearer',
          }),
          data: Matchers.any,
        );

        final result = await tokenApi.retrieveToken(version, params);

        expect(result['access_token'], isNotNull);
        expect(result['id_token'], isNotNull);
      });

      test('should pass through empty params', () async {
        const version = 'Flutter/1.0.0';
        final params = <String, String>{};

        dioAdapter.onPost(
          '/oauth2/token',
          (server) => server.reply(400, {
            'error': 'invalid_request',
            'error_description': 'Missing required parameters',
          }),
          data: Matchers.any,
        );

        expect(
          () => tokenApi.retrieveToken(version, params),
          throwsA(isA<DioException>()),
        );
      });
    });

    group('constructor', () {
      test('should accept Dio instance', () {
        final dio = Dio();
        final api = TokenApi(dio);

        expect(api.dio, equals(dio));
      });

      test('should use provided Dio base URL', () async {
        final customDio = Dio(BaseOptions(
          baseUrl: 'https://custom.auth.domain.com',
        ));
        final customAdapter = DioAdapter(dio: customDio);
        final api = TokenApi(customDio);

        customAdapter.onPost(
          '/oauth2/token',
          (server) => server.reply(200, {'access_token': 'token'}),
          data: Matchers.any,
        );

        final result = await api.retrieveToken('Flutter/1.0.0', {
          'grant_type': 'refresh_token',
          'refresh_token': 'token',
        });

        expect(result['access_token'], equals('token'));

        customAdapter.close();
      });
    });

    group('error responses', () {
      test('should preserve error response body on failure', () async {
        const version = 'Flutter/1.0.0';
        final params = {
          'grant_type': 'refresh_token',
          'refresh_token': 'expired_token',
          'client_id': 'client',
        };

        dioAdapter.onPost(
          '/oauth2/token',
          (server) => server.reply(400, {
            'error': 'invalid_grant',
            'error_description': 'Token has been revoked',
            'error_uri': 'https://docs.kinde.com/errors/invalid_grant',
          }),
          data: Matchers.any,
        );

        try {
          await tokenApi.retrieveToken(version, params);
          fail('Expected DioException');
        } on DioException catch (e) {
          expect(e.response?.statusCode, equals(400));
          expect(e.response?.data['error'], equals('invalid_grant'));
          expect(e.response?.data['error_description'],
              equals('Token has been revoked'));
        }
      });

      test('should handle network timeout', () async {
        const version = 'Flutter/1.0.0';
        final params = {
          'grant_type': 'refresh_token',
          'refresh_token': 'token',
          'client_id': 'client',
        };

        dioAdapter.onPost(
          '/oauth2/token',
          (server) => server.throws(
            -1,
            DioException(
              requestOptions: RequestOptions(path: '/oauth2/token'),
              type: DioExceptionType.connectionTimeout,
              message: 'Connection timeout',
            ),
          ),
          data: Matchers.any,
        );

        expect(
          () => tokenApi.retrieveToken(version, params),
          throwsA(isA<DioException>().having(
            (e) => e.type,
            'type',
            DioExceptionType.connectionTimeout,
          )),
        );
      });
    });
  });
}

