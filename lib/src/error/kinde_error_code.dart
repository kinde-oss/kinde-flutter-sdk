part of 'kinde_error.dart';

/// Error codes for Kinde SDK exceptions.
///
/// Uses kebab-case string codes for cross-SDK compatibility
/// with Kinde's JavaScript, Python, and other SDKs.
///
/// This simplified enum matches the pattern used across Kinde SDKs,
/// where errors are represented as simple string codes without
/// additional metadata or categorization.
///
/// Example usage:
/// ```dart
/// throw KindeError(
///   code: KindeErrorCode.userCanceled.code,
///   message: 'User canceled the login process',
/// );
///
/// // String conversion
/// final errorCode = KindeErrorCode.fromString('user-canceled');
/// print(errorCode.code); // 'user-canceled'
/// ```
enum KindeErrorCode {
  // Authentication & Authorization Errors
  refreshTokenExpired,
  sessionExpiredOrInvalid,
  userCanceled,

  // Configuration Errors
  missingConfig,

  // Initialization Errors
  webInitializingFailed,
  initializingFailed,

  // Request & Network Errors
  logoutRequestFailed,
  requestTimedOut,

  // PKCE & OAuth Flow Errors
  noCodeVerifier,
  noAuthRequestStateStored,
  authRequestStateNotMatch,

  // Redirect & URL Errors
  notRedirectUrl,
  invalidRedirect,
  unsupportedScheme,

  // Self-Serve Portal Errors
  portalLinkUrlIsNull,

  // Process State Errors
  loginInProcess,

  // Unknown/Catch-all
  unknown;

  /// Returns the kebab-case error code string.
  ///
  /// Converts camelCase enum name to kebab-case for cross-SDK
  /// compatibility (e.g., `userCanceled` → `"user-canceled"`).
  ///
  /// This maintains consistency with error codes used in Kinde's
  /// TypeScript, Python, and other SDKs.
  String get code {
    // Convert camelCase to kebab-case
    return name
        .replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) => '-${match[0]!.toLowerCase()}',
        )
        .replaceFirst(RegExp(r'^-'), ''); // Remove leading dash if present
  }

  /// Find error code by its string value.
  ///
  /// Returns the corresponding [KindeErrorCode] enum value for the given
  /// string code. If no match is found, returns [KindeErrorCode.unknown].
  ///
  /// This enables backward compatibility with code that uses string-based
  /// error codes.
  ///
  /// Example:
  /// ```dart
  /// final code = KindeErrorCode.fromString('user-canceled');
  /// assert(code == KindeErrorCode.userCanceled);
  /// ```
  static KindeErrorCode fromString(String code) {
    return values.firstWhere(
      (e) => e.code == code,
      orElse: () => KindeErrorCode.unknown,
    );
  }

  /// Returns the error code string for cross-SDK compatibility.
  ///
  /// This enables seamless use of the enum in string contexts and
  /// maintains backward compatibility with code expecting string values.
  @override
  String toString() => code;
}
