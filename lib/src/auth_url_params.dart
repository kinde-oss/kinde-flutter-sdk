import 'dart:collection';

class AuthUrlParams {
  final String? orgCode;
  final String? loginHint;
  // static const _connectionId = 'connection_id';
  /// Language to display for login page
  final String? lang;
  /// Connection id string corresponding to social sign in
  final String? connectionId;

  AuthUrlParams({
    this.lang,
    this.connectionId,
    this.loginHint,
    this.orgCode
  });

  Map<String, String> toMap() {
    final params = <String, String>{};
    if (orgCode != null) {
      params["org_code"] = orgCode!;
    }
    if (lang != null) {
      params["lang"] = lang!;
    }
    if (connectionId != null) {
      params["connection_id"] = connectionId!;
    }
    if (loginHint != null) {
      params["login_hint"] = loginHint!;
    }
    return params;
  }
}
