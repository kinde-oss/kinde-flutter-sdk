/// Authentication flow types supported by the Kinde SDK.
///
/// Defines the OAuth 2.0 flow to use for authentication.
enum AuthFlowType {
  /// No specific authentication flow.
  ///
  /// Used as a default or placeholder value when no specific
  /// flow is required or selected.
  none(
    'none',
    'No specific authentication flow',
  ),

  /// Proof Key for Code Exchange (PKCE) flow.
  ///
  /// A more secure OAuth 2.0 flow that protects against
  /// authorization code interception attacks. Recommended
  /// for mobile and native applications.
  ///
  /// See: https://oauth.net/2/pkce/
  pkce(
    'pkce',
    'Proof Key for Code Exchange (PKCE) flow - more secure, recommended for mobile apps',
  );

  /// Creates an authentication flow type with associated metadata.
  const AuthFlowType(this.value, this.description);

  /// The string value of the flow type.
  ///
  /// Can be used for API parameters, logging, or string comparisons.
  final String value;

  /// Human-readable description of the authentication flow.
  ///
  /// Provides context about the flow type and when to use it.
  final String description;

  /// Returns the string value of the flow type.
  ///
  /// This enables seamless use of the enum in string contexts.
  @override
  String toString() => value;
}
