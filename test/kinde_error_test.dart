import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/error/kinde_error.dart';
import 'package:oauth2/oauth2.dart';

void main() {
  group('KindeError', () {
    group('Constructor', () {
      test('should create error with message and code', () {
        final error = KindeError(
          code: 'test-error',
          message: 'Test error message',
        );

        expect(error.code, 'test-error');
        expect(error.message, 'Test error message');
        expect(error.stackTrace, isNull);
      });

      test('should default to unknown code when not provided', () {
        final error = KindeError(message: 'Test message');

        expect(error.code, KindeErrorCode.unknown.code);
      });

      test('should default to empty message when not provided', () {
        final error = KindeError(code: 'test-code');

        expect(error.message, '');
      });

      test('should store stack trace when provided', () {
        final stackTrace = StackTrace.current;
        final error = KindeError(
          code: 'test-error',
          message: 'Test message',
          stackTrace: stackTrace,
        );

        expect(error.stackTrace, stackTrace);
      });
    });

    group('Equality', () {
      test('should be equal when code and message match', () {
        final error1 = KindeError(code: 'test', message: 'message');
        final error2 = KindeError(code: 'test', message: 'message');

        expect(error1, equals(error2));
      });

      test('should not be equal when code differs', () {
        final error1 = KindeError(code: 'test1', message: 'message');
        final error2 = KindeError(code: 'test2', message: 'message');

        expect(error1, isNot(equals(error2)));
      });

      test('should not be equal when message differs', () {
        final error1 = KindeError(code: 'test', message: 'message1');
        final error2 = KindeError(code: 'test', message: 'message2');

        expect(error1, isNot(equals(error2)));
      });

      test('should have consistent hashCode', () {
        final error1 = KindeError(code: 'test', message: 'message');
        final error2 = KindeError(code: 'test', message: 'message');

        expect(error1.hashCode, equals(error2.hashCode));
      });
    });

    group('toString', () {
      test('should format as [code] message', () {
        final error = KindeError(code: 'test-code', message: 'Test message');

        expect(error.toString(), '[test-code] Test message');
      });

      test('should include stack trace when present', () {
        final stackTrace = StackTrace.current;
        final error = KindeError(
          code: 'test-code',
          message: 'Test message',
          stackTrace: stackTrace,
        );

        expect(error.toString(), contains('[test-code] Test message'));
        expect(error.toString(), contains('\n\n'));
      });
    });

    group('fromError factory', () {
      test('should return same KindeError if passed KindeError', () {
        final original = KindeError(code: 'original', message: 'Original error');
        final result = KindeError.fromError(original, StackTrace.current);

        expect(identical(result, original), isTrue);
      });

      test('should handle PlatformException', () {
        final platformException = PlatformException(
          code: 'platform_error',
          message: 'Platform error message',
        );

        final result = KindeError.fromError(platformException, StackTrace.current);

        expect(result.code, 'platform_error');
        expect(result.message, 'Platform error message');
      });

      test('should handle FlutterAppAuthUserCancelledException', () {
        // FlutterAppAuthUserCancelledException extends PlatformException
        // The error mapper checks for this type and returns userCanceled code
        final cancelException = FlutterAppAuthUserCancelledException(
          code: 'user_cancelled',
          platformErrorDetails: FlutterAppAuthPlatformErrorDetails(
            error: null,
            errorDescription: 'User cancelled',
            errorUri: null,
          ),
        );

        final result = KindeError.fromError(cancelException, StackTrace.current);

        expect(result.code, KindeErrorCode.userCanceled.code);
      });

      test('should handle AuthorizationException from oauth2', () {
        final authException = AuthorizationException(
          'invalid_grant',
          'The refresh token is invalid',
          Uri.parse('https://example.com'),
        );

        final result = KindeError.fromError(authException, StackTrace.current);

        expect(result, isA<AuthorizationKindeError>());
        expect(result.code, 'invalid_grant');
        expect(result.message, 'The refresh token is invalid');
      });

      test('should handle generic Exception', () {
        final exception = Exception('Generic error');

        final result = KindeError.fromError(exception, StackTrace.current);

        expect(result.message, contains('Generic error'));
      });

      test('should handle unknown object types', () {
        const unknownError = 'String error';

        final result = KindeError.fromError(unknownError, StackTrace.current);

        expect(result.message, 'String error');
      });
    });

    group('DioException handling', () {
      RequestOptions createRequestOptions({String path = '/test'}) {
        return RequestOptions(path: path);
      }

      test('should handle DioException with bad response on token endpoint', () {
        final dioError = DioException(
          type: DioExceptionType.badResponse,
          requestOptions: createRequestOptions(path: '/oauth2/token'),
          message: 'Token refresh failed',
        );

        final result = KindeError.fromError(dioError, StackTrace.current);

        expect(result.code, KindeErrorCode.refreshTokenExpired.code);
      });

      test('should handle DioException with bad response on other endpoints', () {
        final dioError = DioException(
          type: DioExceptionType.badResponse,
          requestOptions: createRequestOptions(path: '/api/users'),
          message: 'Request failed',
        );

        final result = KindeError.fromError(dioError, StackTrace.current);

        expect(result.message, contains('Request failed'));
      });

      test('should handle DioException with connection timeout', () {
        final dioError = DioException(
          type: DioExceptionType.connectionTimeout,
          requestOptions: createRequestOptions(),
          message: 'Connection timed out',
        );

        final result = KindeError.fromError(dioError, StackTrace.current);

        expect(result.message, contains('Connection timed out'));
      });

      test('should handle DioException with receive timeout', () {
        final dioError = DioException(
          type: DioExceptionType.receiveTimeout,
          requestOptions: createRequestOptions(),
          message: 'Receive timed out',
        );

        final result = KindeError.fromError(dioError, StackTrace.current);

        expect(result.message, contains('Receive timed out'));
      });

      test('should handle DioException with send timeout', () {
        final dioError = DioException(
          type: DioExceptionType.sendTimeout,
          requestOptions: createRequestOptions(),
          message: 'Send timed out',
        );

        final result = KindeError.fromError(dioError, StackTrace.current);

        expect(result.message, contains('Send timed out'));
      });

      test('should handle DioException with connection error', () {
        final dioError = DioException(
          type: DioExceptionType.connectionError,
          requestOptions: createRequestOptions(),
          message: 'Connection error',
        );

        final result = KindeError.fromError(dioError, StackTrace.current);

        expect(result.message, contains('Connection error'));
      });

      test('should handle DioException with cancel', () {
        final dioError = DioException(
          type: DioExceptionType.cancel,
          requestOptions: createRequestOptions(),
          message: 'Request cancelled',
        );

        final result = KindeError.fromError(dioError, StackTrace.current);

        expect(result.message, contains('Request cancelled'));
      });

      test('should handle DioException with nested KindeError', () {
        final nestedError = KindeError(code: 'nested', message: 'Nested error');
        final dioError = DioException(
          type: DioExceptionType.unknown,
          requestOptions: createRequestOptions(),
          error: nestedError,
        );

        final result = KindeError.fromError(dioError, StackTrace.current);

        expect(result.code, 'nested');
        expect(result.message, 'Nested error');
      });
    });

    group('FormatException handling', () {
      test('should handle OAuth state parameter mismatch', () {
        final formatException = FormatException(
          'parameter "state" expected "abc" but was "xyz"',
        );

        final result = KindeError.fromError(formatException, StackTrace.current);

        expect(result.code, KindeErrorCode.authRequestStateNotMatch.code);
      });

      test('should extract error from JSON in message', () {
        final formatException = FormatException(
          'Error response: {"error": "invalid_request", "error_description": "Missing required parameter"}',
        );

        final result = KindeError.fromError(formatException, StackTrace.current);

        expect(result.code, 'invalid_request');
        expect(result.message, 'Missing required parameter');
      });

      test('should handle FormatException without JSON', () {
        final formatException = FormatException('Invalid format');

        final result = KindeError.fromError(formatException, StackTrace.current);

        expect(result.code, KindeErrorCode.unknown.code);
        expect(result.message, 'Invalid format');
      });

      test('should handle malformed JSON in FormatException', () {
        final formatException = FormatException(
          'Error: {invalid json}',
        );

        final result = KindeError.fromError(formatException, StackTrace.current);

        // Should not crash, should return an error
        expect(result, isA<KindeError>());
      });
    });
  });

  group('AuthorizationKindeError', () {
    test('should be created from AuthorizationException', () {
      final authException = AuthorizationException(
        'access_denied',
        'User denied access',
        Uri.parse('https://example.com'),
      );

      final result = AuthorizationKindeError.fromOauth2Exception(
        authException,
        StackTrace.current,
      );

      expect(result.code, 'access_denied');
      expect(result.message, 'User denied access');
    });

    test('should handle null description', () {
      final authException = AuthorizationException(
        'access_denied',
        null,
        Uri.parse('https://example.com'),
      );

      final result = AuthorizationKindeError.fromOauth2Exception(
        authException,
        StackTrace.current,
      );

      expect(result.code, 'access_denied');
      expect(result.message, 'Unknown OAuth2 authorization error');
    });
  });
}

