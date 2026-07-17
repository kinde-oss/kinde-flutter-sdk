import 'package:kinde_flutter_sdk/src/token/auth_state.dart';
import 'jwt_test_helper.dart';

/// Fixtures for AuthState testing.
///
/// Provides pre-configured AuthState instances for common test scenarios.
class AuthStateFixtures {
  /// Creates a valid, non-expired AuthState with all tokens.
  static AuthState createValid({
    String? accessToken,
    String? idToken,
    String? refreshToken,
    DateTime? expiresAt,
    String? scope,
  }) {
    return AuthState(
      accessToken: accessToken ?? JwtTestHelper.createAccessToken(),
      idToken: idToken ?? JwtTestHelper.createIdToken(),
      refreshToken: refreshToken ?? 'test_refresh_token',
      accessTokenExpirationDateTime: expiresAt ?? DateTime.now().add(const Duration(hours: 1)),
      scope: scope ?? 'openid profile email offline',
    );
  }

  /// Creates an expired AuthState.
  static AuthState createExpired() {
    return AuthState(
      accessToken: JwtTestHelper.createExpiredAccessToken(),
      idToken: JwtTestHelper.createIdToken(),
      refreshToken: 'test_refresh_token',
      accessTokenExpirationDateTime: DateTime.now().subtract(const Duration(hours: 1)),
      scope: 'openid profile email offline',
    );
  }

  /// Creates an AuthState expiring in the specified duration.
  static AuthState createExpiringIn(Duration duration) {
    final expiresAt = DateTime.now().add(duration);
    final expSeconds = expiresAt.millisecondsSinceEpoch ~/ 1000;

    return AuthState(
      accessToken: JwtTestHelper.createAccessToken(exp: expSeconds),
      idToken: JwtTestHelper.createIdToken(exp: expSeconds),
      refreshToken: 'test_refresh_token',
      accessTokenExpirationDateTime: expiresAt,
      scope: 'openid profile email offline',
    );
  }

  /// Creates an AuthState with only an access token (no ID token).
  static AuthState createWithAccessTokenOnly() {
    return AuthState(
      accessToken: JwtTestHelper.createAccessToken(),
      idToken: null,
      refreshToken: 'test_refresh_token',
      accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
    );
  }

  /// Creates an AuthState with no tokens (null state).
  static AuthState createEmpty() {
    return const AuthState(
      accessToken: null,
      idToken: null,
      refreshToken: null,
      accessTokenExpirationDateTime: null,
    );
  }

  /// Creates an AuthState with feature flags in the access token.
  static AuthState createWithFeatureFlags(Map<String, dynamic> flags) {
    return AuthState(
      accessToken: JwtTestHelper.createAccessTokenWithFlags(flags),
      idToken: JwtTestHelper.createIdToken(),
      refreshToken: 'test_refresh_token',
      accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
    );
  }

  /// Creates an AuthState with specific permissions.
  static AuthState createWithPermissions(List<String> permissions) {
    return AuthState(
      accessToken: JwtTestHelper.createAccessToken(permissions: permissions),
      idToken: JwtTestHelper.createIdToken(),
      refreshToken: 'test_refresh_token',
      accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
    );
  }

  /// Creates an AuthState with a specific organization.
  static AuthState createWithOrganization(String orgCode) {
    return AuthState(
      accessToken: JwtTestHelper.createAccessToken(orgCode: orgCode),
      idToken: JwtTestHelper.createIdToken(),
      refreshToken: 'test_refresh_token',
      accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
    );
  }

  /// Creates a valid JSON map for AuthState.fromJson testing.
  static Map<String, dynamic> createValidJson({
    int? expiresIn,
    String? accessToken,
    String? refreshToken,
    String? idToken,
    String? grantType,
    String? scope,
  }) {
    return {
      'access_token': accessToken ?? JwtTestHelper.createAccessToken(),
      'refresh_token': refreshToken ?? 'test_refresh_token',
      'id_token': idToken ?? JwtTestHelper.createIdToken(),
      'expires_in': expiresIn ?? 3600,
      'grant_type': grantType ?? 'refresh_token',
      'scope': scope ?? 'openid profile email offline',
    };
  }

  /// Creates JSON with ISO date string instead of expires_in.
  static Map<String, dynamic> createJsonWithIsoDate({DateTime? expiresAt}) {
    final expiry = expiresAt ?? DateTime.now().add(const Duration(hours: 1));
    return {
      'access_token': JwtTestHelper.createAccessToken(),
      'refresh_token': 'test_refresh_token',
      'id_token': JwtTestHelper.createIdToken(),
      'access_token_expiration_date_time': expiry.toIso8601String(),
      'grant_type': 'refresh_token',
      'scope': 'openid profile email offline',
    };
  }
}

