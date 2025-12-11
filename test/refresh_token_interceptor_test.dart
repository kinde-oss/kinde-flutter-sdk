import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/token/refresh_token_interceptor.dart';

void main() {
  group('RefreshTokenInterceptor', () {
    late Dio dio;
    late RefreshTokenInterceptor interceptor;
    late int refreshCallCount;
    late bool refreshShouldSucceed;
    late bool refreshShouldThrowKindeError;
    late bool refreshShouldThrowDioException;

    setUp(() {
      dio = Dio();
      refreshCallCount = 0;
      refreshShouldSucceed = true;
      refreshShouldThrowKindeError = false;
      refreshShouldThrowDioException = false;

      interceptor = RefreshTokenInterceptor(
        dio: dio,
        refreshToken: () async {
          refreshCallCount++;
          if (refreshShouldThrowKindeError) {
            throw KindeError(
              code: KindeErrorCode.sessionExpiredOrInvalid.code,
              message: 'Session expired',
            );
          }
          if (refreshShouldThrowDioException) {
            throw DioException(
              requestOptions: RequestOptions(path: '/test'),
              type: DioExceptionType.connectionError,
              message: 'Connection failed',
            );
          }
          if (!refreshShouldSucceed) {
            throw Exception('Refresh failed');
          }
        },
      );
    });

    group('onError - Non-403 responses', () {
      test('should not trigger refresh on 401 response', () async {
        final requestOptions = RequestOptions(path: '/api/test');
        final response = Response(
          requestOptions: requestOptions,
          statusCode: HttpStatus.unauthorized, // 401
        );
        final error = DioException(
          requestOptions: requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(0));
        expect(handler.nextCalled, isTrue);
      });

      test('should not trigger refresh on 404 response', () async {
        final requestOptions = RequestOptions(path: '/api/test');
        final response = Response(
          requestOptions: requestOptions,
          statusCode: HttpStatus.notFound, // 404
        );
        final error = DioException(
          requestOptions: requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(0));
        expect(handler.nextCalled, isTrue);
      });

      test('should not trigger refresh on 500 response', () async {
        final requestOptions = RequestOptions(path: '/api/test');
        final response = Response(
          requestOptions: requestOptions,
          statusCode: HttpStatus.internalServerError, // 500
        );
        final error = DioException(
          requestOptions: requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(0));
        expect(handler.nextCalled, isTrue);
      });

      test('should not trigger refresh on 400 response', () async {
        final requestOptions = RequestOptions(path: '/api/test');
        final response = Response(
          requestOptions: requestOptions,
          statusCode: HttpStatus.badRequest, // 400
        );
        final error = DioException(
          requestOptions: requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(0));
        expect(handler.nextCalled, isTrue);
      });
    });

    group('onError - Network errors', () {
      test('should pass through error when no response (network error)', () async {
        final requestOptions = RequestOptions(path: '/api/test');
        final error = DioException(
          requestOptions: requestOptions,
          type: DioExceptionType.connectionError,
          message: 'Connection refused',
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(0));
        expect(handler.nextCalled, isTrue);
        expect(handler.nextError?.message, equals('Connection refused'));
      });

      test('should pass through timeout errors', () async {
        final requestOptions = RequestOptions(path: '/api/test');
        final error = DioException(
          requestOptions: requestOptions,
          type: DioExceptionType.connectionTimeout,
          message: 'Connection timeout',
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(0));
        expect(handler.nextCalled, isTrue);
        expect(handler.nextError?.type, equals(DioExceptionType.connectionTimeout));
      });

      test('should pass through send timeout errors', () async {
        final requestOptions = RequestOptions(path: '/api/test');
        final error = DioException(
          requestOptions: requestOptions,
          type: DioExceptionType.sendTimeout,
          message: 'Send timeout',
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(0));
        expect(handler.nextCalled, isTrue);
      });

      test('should pass through receive timeout errors', () async {
        final requestOptions = RequestOptions(path: '/api/test');
        final error = DioException(
          requestOptions: requestOptions,
          type: DioExceptionType.receiveTimeout,
          message: 'Receive timeout',
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(0));
        expect(handler.nextCalled, isTrue);
      });
    });

    group('onError - 403 handling', () {
      test('should handle KindeError during refresh and reject', () async {
        refreshShouldThrowKindeError = true;

        final requestOptions = RequestOptions(path: '/api/test');
        final response = Response(
          requestOptions: requestOptions,
          statusCode: HttpStatus.forbidden,
        );
        final error = DioException(
          requestOptions: requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(1));
        expect(handler.rejected, isTrue);
        expect(handler.rejectedError?.error, isA<KindeError>());
        expect(handler.rejectedError?.message, equals('Session expired'));
      });

      test('should handle DioException during refresh and call next', () async {
        refreshShouldThrowDioException = true;

        final requestOptions = RequestOptions(path: '/api/test');
        final response = Response(
          requestOptions: requestOptions,
          statusCode: HttpStatus.forbidden,
        );
        final error = DioException(
          requestOptions: requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(1));
        expect(handler.nextCalled, isTrue);
        expect(handler.nextError?.type, equals(DioExceptionType.connectionError));
      });
    });

    group('constructor', () {
      test('should accept dio and refreshToken callback', () {
        final testDio = Dio();
        bool callbackCalled = false;

        final testInterceptor = RefreshTokenInterceptor(
          dio: testDio,
          refreshToken: () async {
            callbackCalled = true;
          },
        );

        expect(testInterceptor.dio, equals(testDio));
        testInterceptor.refreshToken();
        expect(callbackCalled, isTrue);
      });
    });

    group('edge cases', () {
      test('should handle null status code in response', () async {
        final requestOptions = RequestOptions(path: '/api/test');
        final response = Response(
          requestOptions: requestOptions,
          // statusCode is null by default if not set
        );
        final error = DioException(
          requestOptions: requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(0));
        expect(handler.nextCalled, isTrue);
      });

      test('should handle cancelled request error', () async {
        final requestOptions = RequestOptions(path: '/api/test');
        final error = DioException(
          requestOptions: requestOptions,
          type: DioExceptionType.cancel,
          message: 'Request cancelled',
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(0));
        expect(handler.nextCalled, isTrue);
      });

      test('should handle unknown error type', () async {
        final requestOptions = RequestOptions(path: '/api/test');
        final error = DioException(
          requestOptions: requestOptions,
          type: DioExceptionType.unknown,
          message: 'Unknown error',
        );

        final handler = _TestErrorInterceptorHandler();
        await interceptor.onError(error, handler);

        expect(refreshCallCount, equals(0));
        expect(handler.nextCalled, isTrue);
      });
    });
  });
}

/// Test implementation of ErrorInterceptorHandler to capture results
class _TestErrorInterceptorHandler extends ErrorInterceptorHandler {
  bool resolved = false;
  bool rejected = false;
  bool nextCalled = false;

  Response? resolvedResponse;
  DioException? rejectedError;
  DioException? nextError;

  @override
  void resolve(Response response) {
    resolved = true;
    resolvedResponse = response;
  }

  @override
  void reject(DioException error) {
    rejected = true;
    rejectedError = error;
  }

  @override
  void next(DioException error) {
    nextCalled = true;
    nextError = error;
  }
}
