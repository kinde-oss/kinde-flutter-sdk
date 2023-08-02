import 'package:kinde_flutter_sdk/src/model/token_type.dart';

class AuthState {

  final String? accessToken;

  final String? refreshToken;

  final DateTime? accessTokenExpirationDateTime;

  final String? idToken;

  const AuthState({
    this.accessToken,
    this.refreshToken,
    this.accessTokenExpirationDateTime,
    this.idToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'accessTokenExpirationDateTime': accessTokenExpirationDateTime?.toIso8601String(),
      'idToken': idToken,
    };
  }

  factory AuthState.fromJson(Map<String, dynamic> map) {
    return AuthState(
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
      accessTokenExpirationDateTime:
          DateTime.tryParse(map['accessTokenExpirationDateTime']),
      idToken: map['idToken'] as String,
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
