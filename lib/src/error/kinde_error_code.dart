part of 'kinde_error.dart';

/// Error categories for organizational purposes.
///
/// Groups related errors together to enable better error handling,
/// filtering, and analytics. Each category represents a logical
/// grouping of error conditions that share similar characteristics
/// or handling requirements.
enum ErrorCategory {
  /// Authentication and session-related errors
  authentication,

  /// SDK configuration errors
  configuration,

  /// SDK initialization errors
  initialization,

  /// Network and request errors
  network,

  /// OAuth flow errors (PKCE, state, redirect)
  oauth,

  /// Process state errors
  state,

  /// User-initiated actions
  user,

  /// Unknown or uncategorized errors
  unknown,
}

/// Enhanced enum for Kinde SDK error codes.
///
/// Provides type-safe error codes with associated metadata including
/// human-readable descriptions, error categories, and recoverability flags.
/// Maintains cross-SDK compatibility by using kebab-case string codes.
///
/// Example usage:
/// ```dart
/// try {
///   await sdk.login();
/// } catch (e) {
///   if (e is KindeError) {
///     final errorCode = KindeErrorCode.fromString(e.code);
///     print('Error: ${errorCode.description}');
///     if (errorCode.isRecoverable) {
///       // Attempt recovery
///     }
///   }
/// }
/// ```
enum KindeErrorCode {
  // Authentication & Authorization Errors

  /// Indicates that the refresh token has expired and a new authentication is required.
  refreshTokenExpired(
    'refresh-token-expired',
    'Refresh token has expired and new authentication is required',
    category: ErrorCategory.authentication,
    isRecoverable: true,
  ),

  /// The user's session has expired or is invalid, requiring re-authentication.
  sessionExpiredOrInvalid(
    'session-expired-or-invalid',
    'User session has expired or is invalid, requiring re-authentication',
    category: ErrorCategory.authentication,
    isRecoverable: true,
  ),

  /// User canceled login/registration process.
  userCanceled(
    'user-canceled',
    'User canceled the login/registration process',
    category: ErrorCategory.user,
    isRecoverable: false,
  ),

  // Configuration Errors

  /// Configuration required for SDK initialization is missing.
  missingConfig(
    'missing-config',
    'Configuration required for SDK initialization is missing',
    category: ErrorCategory.configuration,
    isRecoverable: false,
  ),

  // Initialization Errors

  /// Initialization of web-specific authentication components failed.
  webInitializingFailed(
    'web-initializing-failed',
    'Initialization of web-specific authentication components failed',
    category: ErrorCategory.initialization,
    isRecoverable: false,
  ),

  /// General initialization of the SDK failed.
  initializingFailed(
    'initializing-failed',
    'General SDK initialization failed',
    category: ErrorCategory.initialization,
    isRecoverable: false,
  ),

  // Request & Network Errors

  /// The request to logout the user failed.
  logoutRequestFailed(
    'logout-request-failed',
    'The request to logout the user failed',
    category: ErrorCategory.network,
    isRecoverable: true,
  ),

  /// Request timed out.
  requestTimedOut(
    'request-timed-out',
    'Request timed out',
    category: ErrorCategory.network,
    isRecoverable: true,
  ),

  // PKCE & OAuth Flow Errors

  /// No code verifier was found when one was expected for PKCE flow.
  noCodeVerifier(
    'no-code-verifier',
    'No code verifier was found when one was expected for PKCE flow',
    category: ErrorCategory.oauth,
    isRecoverable: false,
  ),

  /// Parameter 'state' used for login request not found in secure storage.
  noAuthStateStored(
    'no-auth-request-state-stored',
    'Parameter state used for login request not found in secure storage',
    category: ErrorCategory.oauth,
    isRecoverable: false,
  ),

  /// Parameter 'state' used for login request doesn't match stored one.
  authStateNotMatch(
    'auth-request-state-not-match',
    'Parameter state used for login request does not match stored state value',
    category: ErrorCategory.oauth,
    isRecoverable: false,
  ),

  // Redirect & URL Errors

  /// URL is not a valid redirect URL.
  notRedirect(
    'not-redirect-url',
    'URL is not a valid redirect URL',
    category: ErrorCategory.oauth,
    isRecoverable: false,
  ),

  /// Invalid redirect URL.
  invalidRedirect(
    'invalid-redirect',
    'Invalid redirect URL',
    category: ErrorCategory.oauth,
    isRecoverable: false,
  ),

  /// Web-only: indicates a scheme that is neither "http" nor "https".
  unsupportedScheme(
    'unsupported-scheme',
    'Web-only: URL scheme is neither "http" nor "https"',
    category: ErrorCategory.oauth,
    isRecoverable: false,
  ),

  // Process State Errors

  /// Login is already in process.
  loginInProcess(
    'login-in-process',
    'Login is already in process',
    category: ErrorCategory.state,
    isRecoverable: false,
  ),

  // Unknown/Catch-all

  /// Used when the specific error is unknown or cannot be determined.
  unknown(
    'unknown',
    'An unknown error occurred',
    category: ErrorCategory.unknown,
    isRecoverable: false,
  );

  /// Creates an enhanced error code with associated metadata.
  const KindeErrorCode(
    this.code,
    this.description, {
    required this.category,
    required this.isRecoverable,
  });

  /// The error code string (kebab-case for cross-SDK consistency).
  ///
  /// This maintains compatibility with TypeScript/Node SDKs and
  /// existing error handling code.
  final String code;

  /// Human-readable description of the error.
  ///
  /// Provides context about what went wrong and may guide
  /// developers toward appropriate handling.
  final String description;

  /// Category for grouping related errors.
  ///
  /// Enables filtering and specialized handling based on error type.
  final ErrorCategory category;

  /// Whether this error can potentially be recovered from.
  ///
  /// - `true`: Application can retry, refresh, or take automated recovery action
  /// - `false`: Requires user intervention or configuration change
  ///
  /// Examples:
  /// - `sessionExpiredOrInvalid.isRecoverable = true` (can refresh token)
  /// - `userCanceled.isRecoverable = false` (user must initiate again)
  /// - `missingConfig.isRecoverable = false` (requires code change)
  final bool isRecoverable;

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

  /// Get all errors in a specific category.
  ///
  /// Useful for filtering errors by type or implementing category-specific
  /// error handling logic.
  ///
  /// Example:
  /// ```dart
  /// final authErrors = KindeErrorCode.byCategory(ErrorCategory.authentication);
  /// print('Authentication errors: ${authErrors.length}');
  /// ```
  static List<KindeErrorCode> byCategory(ErrorCategory category) {
    return values.where((e) => e.category == category).toList();
  }

  /// Returns the error code string.
  ///
  /// This enables seamless use of the enum in string contexts and
  /// maintains backward compatibility with code expecting string values.
  @override
  String toString() => code;
}
