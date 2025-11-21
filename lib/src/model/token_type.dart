/// Token types available in Kinde authentication.
///
/// Defines the different types of tokens that can be retrieved
/// from the authentication state.
enum TokenType {
  /// ID Token - Contains user identity information.
  ///
  /// The ID token is a JSON Web Token (JWT) that contains claims
  /// about the authenticated user's identity and profile information.
  ///
  /// See: https://openid.net/specs/openid-connect-core-1_0.html#IDToken
  idToken(
    'id_token',
    'ID Token containing user identity and profile information',
  ),

  /// Access Token - Used for API authentication.
  ///
  /// The access token is used to authenticate API requests to
  /// protected resources. It represents the authorization granted
  /// to the client application.
  ///
  /// See: https://oauth.net/2/access-tokens/
  accessToken(
    'access_token',
    'Access Token for authenticating API requests',
  );

  /// Creates a token type with associated metadata.
  const TokenType(this.value, this.description);

  /// The string value of the token type.
  ///
  /// Typically matches the JWT token type claim or API parameter names.
  final String value;

  /// Human-readable description of the token type and its purpose.
  final String description;

  /// Returns the string value of the token type.
  ///
  /// This enables seamless use of the enum in string contexts.
  @override
  String toString() => value;
}
