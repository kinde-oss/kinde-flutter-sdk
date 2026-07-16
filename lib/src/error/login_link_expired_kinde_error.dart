part of 'kinde_error.dart';

/// An exception raised when the login link expires during authentication.
///
/// This only shows up when [InternalAdditionalParameters.supportsReauth]
/// is enabled during an authentication request.
class LoginLinkExpiredKindeError extends KindeError {
  /// Platform exceptions details
  final Map<Object?, Object?> _details;

  /// The state returned with the error when the login link expires.
  ///
  /// Used to restart the authentication flow.
  String? get reauthState => _extractReauthState(_details);

  LoginLinkExpiredKindeError({
    super.message,
    required Map<Object?, Object?> details,
    super.stackTrace,
  }) : _details = details,
       super(code: KindeErrorCode.loginLinkExpired.code);

  /// Extracts the [reauth_state] from the error details.
  ///
  /// Note, this only extracts from the iOS error details.
  /// This is because the Android SDK, AppAuth-Android, doesn't currently
  /// return query params in the [PlatformException.details]
  static String? _extractReauthState(Map<Object?, Object?> details) {
    final match = RegExp(
      r'"reauth_state"\s*=\s*"([^"]+)"',
    ).firstMatch(details.toString());
    return match?.group(1);
  }
}
