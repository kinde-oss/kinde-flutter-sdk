class AuthUrlParams {
  static const _lang = 'lang';
  static const _connectionId = 'connection_id';

  /// Language to display for login page
  String? lang;

  /// Connection id string corresponding to social sign in
  String? connectionId;

  AuthUrlParams({
    this.lang,
    this.connectionId,
  });

  Map<String, String> toMap() {
    final params = <String, String>{};
    if (lang != null) {
      params[_lang] = lang!;
    }
    if (connectionId != null) {
      params[_connectionId] = connectionId!;
    }

    return params;
  }
}
