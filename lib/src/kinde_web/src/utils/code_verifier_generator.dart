import 'dart:math';

/// Randomly generate a 128 character string to be used as the PKCE code verifier.
/// The codeVerifier must meet requirements specified in [RFC 7636].
///
/// [RFC 7636]: https://tools.ietf.org/html/rfc7636#section-4.1
String generateCodeVerifier() {
  return List.generate(
      128, (i) => _charset[Random.secure().nextInt(_charset.length)]).join();
}

/// Allowed characters for generating a codeVerifier
const String _charset =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';
