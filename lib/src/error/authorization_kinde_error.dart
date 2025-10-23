part of 'kinde_error.dart';

/// An exception raised when OAuth2 authorization fails.
/// Duplicate [AuthorizationException]
/// more in https://datatracker.ietf.org/doc/html/draft-ietf-oauth-v2-31
class AuthorizationKindeError extends KindeError {
  /// Possible names are
  /// [invalid_request], [invalid_client], [invalid_grant], [unauthorized_client], [unsupported_grant_type], [invalid_scope]
  @override
  String get code => super.code;

  AuthorizationKindeError._(String code, String description)
      : super(code: code, message: description);

  @protected
  factory AuthorizationKindeError.fromOauth2Exception(
          AuthorizationException error) =>
      AuthorizationKindeError._(
        error.error,
        error.description ?? "Unknown OAuth2 authorization error",
      );
}
