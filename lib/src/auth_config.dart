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
  }) {
    _validateUrls();
  }

  void _validateUrls() {
    try {
      Uri.parse(loginRedirectUri);
    } catch (e) {
      throw ArgumentError('Invalid loginRedirectUri format: $loginRedirectUri');
    }
    try {
      Uri.parse(logoutRedirectUri);
    } catch (e) {
      throw ArgumentError('Invalid logoutRedirectUri format: $logoutRedirectUri');
    }
  }
}
