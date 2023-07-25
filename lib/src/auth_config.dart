class AuthConfig {
  // final String baseUrl;
  final String authDomain;
  final String authClientId;
  final String loginRedirectUri;
  final String logoutRedirectUri;

  AuthConfig({
    // required this.baseUrl,
    required this.authDomain,
    required this.authClientId,
    required this.loginRedirectUri,
    required this.logoutRedirectUri,
  });
}
