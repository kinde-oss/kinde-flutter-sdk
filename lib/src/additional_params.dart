abstract class BaseAdditionalParameters {
  /// Optional organization code, used for tenant-specific authentication.
  final String? orgCode;
  /// Optional login hint (e.g., email) to pre-fill the login form.
  final String? loginHint;
  /// Language to display for login page
  final String? lang;
  /// Connection id string corresponding to social sign in
  final String? connectionId;

  const BaseAdditionalParameters(
      {this.lang,
        this.connectionId,
        this.loginHint,
        this.orgCode});

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

class AdditionalParameters extends BaseAdditionalParameters {
  const AdditionalParameters(): super();
}

class InternalAdditionalParameters extends BaseAdditionalParameters {
  String? audience;
  List<String>? promptValues;
  List<String>? scopes;
  String? state;
  String? registrationPage;
  bool? createOrg;
  String? orgName;
  ///not participate in toMap() method
  String? codeVerifier;

  InternalAdditionalParameters(
      {this.audience,
      this.promptValues,
        this.scopes,
        this.state,
        this.registrationPage,
        this.createOrg,
        this.orgName,
      super.lang,
      super.connectionId,
      super.loginHint,
      super.orgCode});

  factory InternalAdditionalParameters.fromUserAdditionalParams(AdditionalParameters userParams) {
    return InternalAdditionalParameters(
      lang: userParams.lang,
      connectionId: userParams.connectionId,
      loginHint: userParams.loginHint,
      orgCode: userParams.orgCode,
    );
  }

  @override
  Map<String, String> toMap() {
    final result = Map<String, String>.from(super.toMap());
    if (audience != null) {
      result["audience"] = audience!;
    }
    if (promptValues != null) {
      result["prompt"] = promptValues!.join(' ');
    }
    if (scopes != null) {
      result["scope"] = scopes!.join(' ');
    }
    if (state != null) {
      result["state"] = state!;
    }
    if (registrationPage != null) {
      result["start_page"] = registrationPage!;
    }
    if (createOrg != null) {
      result["is_create_org"] = createOrg.toString();
    }
    if (orgName != null) {
      result["org_name"] = orgName!;
    }
    return result;
  }
}
