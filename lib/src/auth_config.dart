class AuthConfig {
  final String authDomain;
  final String authClientId;
  final String loginRedirectUri;
  final String logoutRedirectUri;
  final List<String> scopes;
  final String? audience;

  AuthConfig({
    required this.authDomain,
    required this.authClientId,
    required this.loginRedirectUri,
    required this.logoutRedirectUri,
    required this.scopes,
    this.audience
  });
}
