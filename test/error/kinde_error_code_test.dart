import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/error/kinde_error.dart';

void main() {
  group('KindeErrorCode Enhanced Enum', () {
    group('Basic Enum Properties', () {
      test('should have exactly 16 error codes', () {
        expect(KindeErrorCode.values.length, 16);
      });

      test('should maintain kebab-case string format for all codes', () {
        expect(KindeErrorCode.userCanceled.code, 'user-canceled');
        expect(KindeErrorCode.sessionExpiredOrInvalid.code,
            'session-expired-or-invalid');
        expect(KindeErrorCode.refreshTokenExpired.code,
            'refresh-token-expired');
        expect(KindeErrorCode.missingConfig.code, 'missing-config');
        expect(KindeErrorCode.webInitializingFailed.code,
            'web-initializing-failed');
        expect(KindeErrorCode.initializingFailed.code, 'initializing-failed');
        expect(
            KindeErrorCode.logoutRequestFailed.code, 'logout-request-failed');
        expect(KindeErrorCode.requestTimedOut.code, 'request-timed-out');
        expect(KindeErrorCode.noCodeVerifier.code, 'no-code-verifier');
        expect(KindeErrorCode.noAuthStateStored.code,
            'no-auth-request-state-stored');
        expect(KindeErrorCode.authStateNotMatch.code,
            'auth-request-state-not-match');
        expect(KindeErrorCode.notRedirect.code, 'not-redirect-url');
        expect(KindeErrorCode.invalidRedirect.code, 'invalid-redirect');
        expect(KindeErrorCode.unsupportedScheme.code, 'unsupported-scheme');
        expect(KindeErrorCode.loginInProcess.code, 'login-in-process');
        expect(KindeErrorCode.unknown.code, 'unknown');
      });

      test('should have non-empty descriptions for all codes', () {
        for (final code in KindeErrorCode.values) {
          expect(code.description, isNotEmpty,
              reason: '${code.code} should have a description');
        }
      });

      test('toString() should return the code string', () {
        expect(KindeErrorCode.userCanceled.toString(), 'user-canceled');
        expect(KindeErrorCode.unknown.toString(), 'unknown');
      });
    });

    group('fromString() Method', () {
      test('should find correct error code for valid string', () {
        final code = KindeErrorCode.fromString('user-canceled');
        expect(code, KindeErrorCode.userCanceled);
      });

      test('should return unknown for invalid code', () {
        final code = KindeErrorCode.fromString('invalid-code-xyz');
        expect(code, KindeErrorCode.unknown);
      });

      test('should return unknown for empty string', () {
        final code = KindeErrorCode.fromString('');
        expect(code, KindeErrorCode.unknown);
      });

      test('should handle all valid error codes', () {
        for (final errorCode in KindeErrorCode.values) {
          final found = KindeErrorCode.fromString(errorCode.code);
          expect(found, errorCode,
              reason: 'Should find ${errorCode.code} correctly');
        }
      });
    });

    group('Error Categories', () {
      test('authentication errors should be correctly categorized', () {
        expect(KindeErrorCode.refreshTokenExpired.category,
            ErrorCategory.authentication);
        expect(KindeErrorCode.sessionExpiredOrInvalid.category,
            ErrorCategory.authentication);
      });

      test('configuration errors should be correctly categorized', () {
        expect(
            KindeErrorCode.missingConfig.category, ErrorCategory.configuration);
      });

      test('initialization errors should be correctly categorized', () {
        expect(KindeErrorCode.webInitializingFailed.category,
            ErrorCategory.initialization);
        expect(KindeErrorCode.initializingFailed.category,
            ErrorCategory.initialization);
      });

      test('network errors should be correctly categorized', () {
        expect(KindeErrorCode.logoutRequestFailed.category,
            ErrorCategory.network);
        expect(KindeErrorCode.requestTimedOut.category, ErrorCategory.network);
      });

      test('OAuth errors should be correctly categorized', () {
        expect(KindeErrorCode.noCodeVerifier.category, ErrorCategory.oauth);
        expect(
            KindeErrorCode.noAuthStateStored.category, ErrorCategory.oauth);
        expect(
            KindeErrorCode.authStateNotMatch.category, ErrorCategory.oauth);
        expect(KindeErrorCode.notRedirect.category, ErrorCategory.oauth);
        expect(KindeErrorCode.invalidRedirect.category, ErrorCategory.oauth);
        expect(
            KindeErrorCode.unsupportedScheme.category, ErrorCategory.oauth);
      });

      test('state errors should be correctly categorized', () {
        expect(KindeErrorCode.loginInProcess.category, ErrorCategory.state);
      });

      test('user errors should be correctly categorized', () {
        expect(KindeErrorCode.userCanceled.category, ErrorCategory.user);
      });

      test('unknown errors should be correctly categorized', () {
        expect(KindeErrorCode.unknown.category, ErrorCategory.unknown);
      });
    });

    group('byCategory() Method', () {
      test('should return authentication errors', () {
        final authErrors =
            KindeErrorCode.byCategory(ErrorCategory.authentication);
        expect(authErrors, hasLength(2));
        expect(authErrors, contains(KindeErrorCode.refreshTokenExpired));
        expect(authErrors, contains(KindeErrorCode.sessionExpiredOrInvalid));
      });

      test('should return OAuth errors', () {
        final oauthErrors = KindeErrorCode.byCategory(ErrorCategory.oauth);
        expect(oauthErrors, hasLength(6));
        expect(oauthErrors, contains(KindeErrorCode.noCodeVerifier));
        expect(oauthErrors, contains(KindeErrorCode.notRedirect));
      });

      test('should return empty list for category with no errors', () {
        // All categories currently have at least one error,
        // but test the mechanism works
        final allCategories = ErrorCategory.values;
        for (final category in allCategories) {
          final errors = KindeErrorCode.byCategory(category);
          expect(errors, isA<List<KindeErrorCode>>());
        }
      });

      test('should return network errors', () {
        final networkErrors = KindeErrorCode.byCategory(ErrorCategory.network);
        expect(networkErrors, hasLength(2));
        expect(networkErrors, contains(KindeErrorCode.logoutRequestFailed));
        expect(networkErrors, contains(KindeErrorCode.requestTimedOut));
      });
    });

    group('isRecoverable Property', () {
      test('authentication errors should be recoverable', () {
        expect(KindeErrorCode.refreshTokenExpired.isRecoverable, isTrue);
        expect(KindeErrorCode.sessionExpiredOrInvalid.isRecoverable, isTrue);
      });

      test('user-initiated errors should not be recoverable', () {
        expect(KindeErrorCode.userCanceled.isRecoverable, isFalse);
      });

      test('configuration errors should not be recoverable', () {
        expect(KindeErrorCode.missingConfig.isRecoverable, isFalse);
      });

      test('initialization errors should not be recoverable', () {
        expect(KindeErrorCode.webInitializingFailed.isRecoverable, isFalse);
        expect(KindeErrorCode.initializingFailed.isRecoverable, isFalse);
      });

      test('network errors should be recoverable', () {
        expect(KindeErrorCode.logoutRequestFailed.isRecoverable, isTrue);
        expect(KindeErrorCode.requestTimedOut.isRecoverable, isTrue);
      });

      test('OAuth flow errors should not be recoverable', () {
        expect(KindeErrorCode.noCodeVerifier.isRecoverable, isFalse);
        expect(KindeErrorCode.noAuthStateStored.isRecoverable, isFalse);
        expect(KindeErrorCode.authStateNotMatch.isRecoverable, isFalse);
        expect(KindeErrorCode.notRedirect.isRecoverable, isFalse);
        expect(KindeErrorCode.invalidRedirect.isRecoverable, isFalse);
        expect(KindeErrorCode.unsupportedScheme.isRecoverable, isFalse);
      });
    });

    group('Backward Compatibility', () {
      test('error codes should work in string contexts', () {
        final code = KindeErrorCode.userCanceled;
        final codeString = '$code';
        expect(codeString, 'user-canceled');
      });

      test('error codes should work with string interpolation', () {
        final message =
            'Error occurred: ${KindeErrorCode.sessionExpiredOrInvalid}';
        expect(message, contains('session-expired-or-invalid'));
      });

      test('error codes can be compared as strings', () {
        expect(KindeErrorCode.unknown.toString(), equals('unknown'));
      });
    });

    group('Cross-SDK Consistency', () {
      test('should use kebab-case for TypeScript/Node compatibility', () {
        // All error codes should use kebab-case (hyphen-separated)
        for (final code in KindeErrorCode.values) {
          expect(code.code, isNot(contains('_')),
              reason: '${code.code} should not contain underscores');
          expect(code.code, isNot(matches(RegExp(r'[A-Z]'))),
              reason: '${code.code} should not contain uppercase letters');
        }
      });

      test('common error codes should match across SDKs', () {
        // These error codes are expected to exist across multiple SDKs
        expect(
            KindeErrorCode.values
                .any((e) => e.code == 'unknown'), isTrue);
        expect(
            KindeErrorCode.values
                .any((e) => e.code == 'user-canceled'),
            isTrue);
      });
    });
  });

  group('ErrorCategory Enum', () {
    test('should have all expected categories', () {
      expect(ErrorCategory.values, hasLength(8));
      expect(ErrorCategory.values, contains(ErrorCategory.authentication));
      expect(ErrorCategory.values, contains(ErrorCategory.configuration));
      expect(ErrorCategory.values, contains(ErrorCategory.initialization));
      expect(ErrorCategory.values, contains(ErrorCategory.network));
      expect(ErrorCategory.values, contains(ErrorCategory.oauth));
      expect(ErrorCategory.values, contains(ErrorCategory.state));
      expect(ErrorCategory.values, contains(ErrorCategory.user));
      expect(ErrorCategory.values, contains(ErrorCategory.unknown));
    });
  });

  group('KindeError Integration', () {
    test('should work with enhanced enum in KindeError constructor', () {
      final error = KindeError(
        code: KindeErrorCode.userCanceled.code,
        message: 'User canceled the operation',
      );
      expect(error.code, 'user-canceled');
      expect(error.message, 'User canceled the operation');
    });

    test('should maintain default unknown code behavior', () {
      final error = KindeError(message: 'Something went wrong');
      expect(error.code, 'unknown');
    });
  });
}

