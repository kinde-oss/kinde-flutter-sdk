class AuthUrlParams {
  static const _lang = 'lang';
  static const _loginHint = 'login_hint';
  static const _connectionId = 'connection_id';

  /// Language to display for login page
  String? lang;

  /// Email or phone-number to pre-fill login page
  String? loginHint;

  /// Connection id string corresponding to social sign in
  String? connectionId;

  AuthUrlParams({
    this.lang,
    this.loginHint,
    this.connectionId,
  });

  Map<String, String> toMap() {
    final params = <String, String>{};
    if (lang != null) {
      params[_lang] = lang!;
    }
    if (loginHint != null) {
      params[_loginHint] = loginHint!;
    }
    if (connectionId != null) {
      params[_connectionId] = connectionId!;
    }

    return params;
  }
}
