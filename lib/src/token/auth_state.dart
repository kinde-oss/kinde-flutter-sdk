import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:kinde_flutter_sdk/src/model/token_type.dart';

class AuthState {

  final String? accessToken;

  final String? refreshToken;

  final DateTime? accessTokenExpirationDateTime;

  final String? idToken;

  final String? grantType;

  final String? scope;

  const AuthState({
    this.accessToken,
    this.refreshToken,
    this.accessTokenExpirationDateTime,
    this.idToken,
    this.grantType = GrantType.refreshToken,
    this.scope
  });

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'access_token_expiration_date_time': accessTokenExpirationDateTime?.toIso8601String(),
      'id_token': idToken,
      'grant_type': grantType,
      'scope': scope
    };
  }

  Map<String, String> createRequestTokenParam() {
    return {
      if(refreshToken != null)
        'refresh_token': refreshToken!,
      if(grantType != null)
        'grant_type': grantType!,
      if(scope != null && scope!.isNotEmpty)
        'scope': scope!,
    };
  }

  factory AuthState.fromJson(Map<String, dynamic> map) {
    DateTime? expiredTime;
    if(map.containsKey('expires_in')) {
      expiredTime = DateTime.now().add(Duration(seconds: map['expires_in']));
    } else {
      expiredTime = DateTime.tryParse(map['access_token_expiration_date_time']);
    }
    return AuthState(
      accessToken: map['access_token'] as String,
      refreshToken: map['refresh_token'] as String,
      accessTokenExpirationDateTime: expiredTime,
      idToken: map['id_token'] as String,
      grantType: (map['grant_type'] ?? GrantType.refreshToken) as String,
      scope: map['scope'] as String,
    );
  }



  bool isExpired() {
    if (accessToken == null || accessTokenExpirationDateTime == null) {
      return false;
    }
    return DateTime.now().isAfter(accessTokenExpirationDateTime!);
  }

  String? getToken(TokenType tokenType) {
    return tokenType == TokenType.accessToken ? accessToken : idToken;
  }
}
