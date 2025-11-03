part of 'kinde_error.dart';

abstract class KindeErrorCode {
  const KindeErrorCode._();

  /// Indicates that the refresh token has expired and a new authentication is required.
  static const refreshTokenExpired = "refresh-token-expired";
  /// Used when the specific error is unknown or cannot be determined.
  static const unknown = "unknown";
  /// Configuration required for SDK initialization is missing.
  static const missingConfig = "missing-config";
  /// The user's session has expired or is invalid, requiring re-authentication.
  static const sessionExpiredOrInvalid = "session-expired-or-invalid";
  /// Initialization of web-specific authentication components failed.
  static const webInitializingFailed = "web-initializing-failed";
  /// General initialization of the SDK failed.
  static const initializingFailed = "initializing-failed";
  /// The request to logout the user failed.
  static const logoutRequestFailed = "logout-request-failed";
  /// No code verifier was found when one was expected for PKCE flow.
  static const noCodeVerifier = "no-code-verifier";
  /// User canceled login/registration process.
  static const userCanceled = "user-canceled";
  /// Parameter 'state' used for login request in secure storage.
  static const noAuthStateStored = "no-auth-request-state-stored";
  /// Parameter 'state' used for login request isn't equal stored one.
  static const authStateNotMatch = "auth-request-state-not-match";
  /// Parameter 'state' used for login request doesn't match the stored state value.
  static const notRedirect = "not-redirect-url";
  static const loginInProcess = "login-in-process";
  static const invalidRedirect = "invalid-redirect";
  /// Web-only: indicates a scheme that is neither "http" nor "https".
  static const unsupportedScheme = "unsupported-scheme";
  static const requestTimedOut = "request-timed-out";
  /// Occurs when plugin interference causes activity result handling conflicts.
  /// This typically happens when another plugin consumes activity results without proper requestCode filtering.
  static const pluginInterference = "plugin-interference";
}
