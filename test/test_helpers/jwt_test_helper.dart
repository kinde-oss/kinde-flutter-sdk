import 'dart:convert';

/// Helper class for creating test JWTs.
///
/// Creates properly formatted JWT tokens for testing without cryptographic
/// signing (signature is a placeholder). Sufficient for testing token parsing
/// and claim extraction logic.
class JwtTestHelper {
  /// Standard test claims that appear in most Kinde tokens
  static const String testUserId = 'kp_test_user_123';
  static const String testEmail = 'test@example.com';
  static const String testGivenName = 'Test';
  static const String testFamilyName = 'User';
  static const String testPicture = 'https://example.com/avatar.png';
  static const String testOrgCode = 'org_test123';
  static const List<String> testOrgCodes = ['org_test123', 'org_other456'];
  static const List<String> testPermissions = ['read:users', 'write:users'];

  /// Creates a valid access token JWT with customizable claims.
  static String createAccessToken({
    String? sub,
    String? orgCode,
    List<String>? permissions,
    Map<String, dynamic>? featureFlags,
    int? exp,
    int? iat,
    String? aud,
    String? iss,
    Map<String, dynamic>? additionalClaims,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    final payload = <String, dynamic>{
      'sub': sub ?? testUserId,
      'org_code': orgCode ?? testOrgCode,
      'permissions': permissions ?? testPermissions,
      'iat': iat ?? now,
      'exp': exp ?? (now + 3600), // Default 1 hour expiry
      'aud': aud ?? 'test-audience',
      'iss': iss ?? 'https://test.kinde.com',
    };

    if (featureFlags != null) {
      payload['feature_flags'] = featureFlags;
    }

    if (additionalClaims != null) {
      payload.addAll(additionalClaims);
    }

    return _createJwt(payload);
  }

  /// Creates a valid ID token JWT with user identity claims.
  ///
  /// Set any claim to empty string '' to explicitly exclude it from the token.
  static String createIdToken({
    String? sub,
    String? email,
    String? givenName,
    String? familyName,
    String? picture,
    List<String>? orgCodes,
    int? exp,
    int? iat,
    bool excludeOrgCodes = false,
    Map<String, dynamic>? additionalClaims,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    final payload = <String, dynamic>{
      'sub': sub ?? testUserId,
      'email': email ?? testEmail,
      'iat': iat ?? now,
      'exp': exp ?? (now + 3600),
    };

    // Only add optional claims if they're provided or use defaults
    if (givenName != null) {
      payload['given_name'] = givenName;
    } else {
      payload['given_name'] = testGivenName;
    }

    if (familyName != null) {
      payload['family_name'] = familyName;
    } else {
      payload['family_name'] = testFamilyName;
    }

    if (picture != null) {
      payload['picture'] = picture;
    } else {
      payload['picture'] = testPicture;
    }

    if (!excludeOrgCodes) {
      payload['org_codes'] = orgCodes ?? testOrgCodes;
    }

    if (additionalClaims != null) {
      payload.addAll(additionalClaims);
    }

    return _createJwt(payload);
  }

  /// Creates an expired access token (expired 1 hour ago).
  static String createExpiredAccessToken({
    String? sub,
    String? orgCode,
  }) {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return createAccessToken(
      sub: sub,
      orgCode: orgCode,
      exp: now - 3600, // Expired 1 hour ago
      iat: now - 7200, // Issued 2 hours ago
    );
  }

  /// Creates an access token that expires in the specified duration.
  static String createTokenExpiringIn(Duration duration) {
    final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return createAccessToken(
      exp: now + duration.inSeconds,
    );
  }

  /// Creates an access token with feature flags for testing.
  static String createAccessTokenWithFlags(Map<String, dynamic> flags) {
    return createAccessToken(featureFlags: flags);
  }

  /// Creates a token with no permissions.
  static String createAccessTokenWithNoPermissions() {
    return createAccessToken(permissions: []);
  }

  /// Creates a token with a specific permission.
  static String createAccessTokenWithPermission(String permission) {
    return createAccessToken(permissions: [permission]);
  }

  /// Standard feature flags for testing.
  static Map<String, dynamic> get testFeatureFlags => {
    'is_dark_mode': {'t': 'b', 'v': true},
    'theme_color': {'t': 's', 'v': 'blue'},
    'max_items': {'t': 'i', 'v': 100},
  };

  /// Creates a JWT string from a payload.
  static String _createJwt(Map<String, dynamic> payload) {
    final header = {'alg': 'RS256', 'typ': 'JWT'};

    final encodedHeader = _base64UrlEncode(jsonEncode(header));
    final encodedPayload = _base64UrlEncode(jsonEncode(payload));

    // Signature is not validated in SDK tests, so we use a placeholder
    const signature = 'test_signature_placeholder';

    return '$encodedHeader.$encodedPayload.$signature';
  }

  static String _base64UrlEncode(String input) {
    return base64Url.encode(utf8.encode(input)).replaceAll('=', '');
  }
}

/// Convenience extension for creating test tokens with common patterns.
extension JwtTestExtensions on Duration {
  /// Creates a token expiring in this duration.
  String toExpiringToken() => JwtTestHelper.createTokenExpiringIn(this);
}

