import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/error/kinde_error.dart';

void main() {
  group('KindeErrorCode Enum', () {
    group('Basic Enum Properties', () {
      test('should have exactly 16 error codes', () {
        expect(KindeErrorCode.values.length, 16);
      });

      test('should convert camelCase enum names to kebab-case strings', () {
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
        expect(KindeErrorCode.noAuthRequestStateStored.code,
            'no-auth-request-state-stored');
        expect(KindeErrorCode.authRequestStateNotMatch.code,
            'auth-request-state-not-match');
        expect(KindeErrorCode.notRedirectUrl.code, 'not-redirect-url');
        expect(KindeErrorCode.invalidRedirect.code, 'invalid-redirect');
        expect(KindeErrorCode.unsupportedScheme.code, 'unsupported-scheme');
        expect(KindeErrorCode.loginInProcess.code, 'login-in-process');
        expect(KindeErrorCode.unknown.code, 'unknown');
      });

      test('toString() should return the kebab-case code string', () {
        expect(KindeErrorCode.userCanceled.toString(), 'user-canceled');
        expect(KindeErrorCode.sessionExpiredOrInvalid.toString(),
            'session-expired-or-invalid');
        expect(KindeErrorCode.unknown.toString(), 'unknown');
      });

      test('code getter should return same value as toString()', () {
        for (final errorCode in KindeErrorCode.values) {
          expect(errorCode.code, equals(errorCode.toString()));
        }
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

      test('should handle all valid error codes round-trip', () {
        for (final errorCode in KindeErrorCode.values) {
          final codeString = errorCode.code;
          final found = KindeErrorCode.fromString(codeString);
          expect(found, errorCode,
              reason:
                  'Should find ${errorCode.code} correctly via fromString()');
        }
      });

      test('should work with common error codes', () {
        expect(KindeErrorCode.fromString('user-canceled'),
            KindeErrorCode.userCanceled);
        expect(KindeErrorCode.fromString('refresh-token-expired'),
            KindeErrorCode.refreshTokenExpired);
        expect(KindeErrorCode.fromString('session-expired-or-invalid'),
            KindeErrorCode.sessionExpiredOrInvalid);
        expect(
            KindeErrorCode.fromString('unknown'), KindeErrorCode.unknown);
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
        expect('${KindeErrorCode.userCanceled}', equals('user-canceled'));
      });

      test('error codes maintain kebab-case format for all values', () {
        for (final code in KindeErrorCode.values) {
          final codeString = code.toString();
          expect(codeString, isNotEmpty);
          // All codes should use kebab-case (lowercase with hyphens)
          expect(codeString, matches(RegExp(r'^[a-z0-9-]+$')));
        }
      });
    });

    group('Cross-SDK Consistency', () {
      test('should use kebab-case for cross-SDK compatibility', () {
        // All error codes should use kebab-case (hyphen-separated, lowercase)
        // matching TypeScript, Python, and other Kinde SDKs
        for (final code in KindeErrorCode.values) {
          expect(code.code, isNot(contains('_')),
              reason: '${code.code} should not contain underscores');
          expect(code.code, isNot(matches(RegExp(r'[A-Z]'))),
              reason: '${code.code} should not contain uppercase letters');
          expect(code.code, matches(RegExp(r'^[a-z0-9-]+$')),
              reason:
                  '${code.code} should only contain lowercase letters, numbers, and hyphens');
        }
      });

      test('common error codes should match Kinde SDK conventions', () {
        // These error codes are expected to exist across multiple Kinde SDKs
        expect(KindeErrorCode.values.any((e) => e.code == 'unknown'), isTrue);
        expect(
            KindeErrorCode.values.any((e) => e.code == 'user-canceled'),
            isTrue);
        expect(
            KindeErrorCode.values
                .any((e) => e.code == 'refresh-token-expired'),
            isTrue);
        expect(
            KindeErrorCode.values
                .any((e) => e.code == 'session-expired-or-invalid'),
            isTrue);
      });

      test('error codes use simple string pattern matching js-utils', () {
        // Verify we're using simple string codes without metadata
        // This matches the pattern used in js-utils and other Kinde SDKs
        for (final code in KindeErrorCode.values) {
          // Just check that code getter returns a string - no metadata
          expect(code.code, isA<String>());
          expect(code.toString(), isA<String>());
        }
      });
    });
  });

  group('KindeError Integration', () {
    test('should work with simplified enum in KindeError constructor', () {
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

    test('should work with all error codes', () {
      for (final errorCode in KindeErrorCode.values) {
        final error = KindeError(
          code: errorCode.code,
          message: 'Test error message',
        );
        expect(error.code, errorCode.code);
      }
    });
  });
}

