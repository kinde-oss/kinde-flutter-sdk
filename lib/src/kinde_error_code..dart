abstract class KindeErrorCode {
  const KindeErrorCode._();

  static const refreshTokenExpired = "refresh-token-expired";
  static const unknown = "unknown";
  static const missingConfig = "missing-config";
  static const sessionExpiredOrInvalid = "session-expired-or-invalid";
  static const webInitializingFailed = "web-initializing-failed";
  static const initializingFailed = "initializing-failed";
  static const logoutRequestFailed = "logout-request-failed";
  static const noCodeVerifier = "no-code-verifier";
}
