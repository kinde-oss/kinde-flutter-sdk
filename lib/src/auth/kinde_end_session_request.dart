import 'package:flutter_appauth/flutter_appauth.dart';

/// A custom [EndSessionRequest] implementation used to bypass
/// `flutter_appauth`'s [EndSessionRequest] assertion that requires both
/// [idTokenHint] and [postLogoutRedirectUrl] to be either both null or both
/// non-null.
///
/// This is required so we can omit [idTokenHint] when we pass the
/// [postLogoutRedirectUrl]. We now pass the [client_id] as part of
/// [additionalParameters] instead.
///
/// Omitting [idTokenHint] prevents 414 Request-URI Too Large errors caused by
/// appending a potentially large idToken to the logout URL.
///
/// TODO: This class should be removed when `flutter_appauth` removes its
/// assertions, so we can use [EndSessionRequest] directly.
/// See https://github.com/MaikuB/flutter_appauth/pull/585.
class KindeEndSessionRequest implements EndSessionRequest {
  @override
  final String? idTokenHint;
  @override
  final String? postLogoutRedirectUrl;
  @override
  final String? state;
  @override
  bool allowInsecureConnections;
  @override
  ExternalUserAgent? externalUserAgent;
  @override
  final Map<String, String>? additionalParameters;
  @override
  AuthorizationServiceConfiguration? serviceConfiguration;
  @override
  String? issuer;
  @override
  String? discoveryUrl;

  KindeEndSessionRequest({
    this.idTokenHint,
    this.postLogoutRedirectUrl,
    this.state,
    this.allowInsecureConnections = false,
    this.externalUserAgent = ExternalUserAgent.asWebAuthenticationSession,
    this.additionalParameters,
    this.serviceConfiguration,
    this.issuer,
    this.discoveryUrl,
  });

  @override
  void assertConfigurationInfo() {
    assert(
      issuer != null || discoveryUrl != null || serviceConfiguration != null,
      'Either the issuer, discovery URL or service configuration must be '
      'provided',
    );
  }
}
