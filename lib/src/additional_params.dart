abstract class ParamName {
  const ParamName._();

  static const scope = "scope";
  static const prompt = "prompt";
  static const orgCode = "org_code";
  static const lang = "lang";
  static const connectionId = "connection_id";
  static const loginHint = "login_hint";
  static const audience = "audience";
  static const state = "state";
  static const startPage = "start_page";
  static const isCreateOrg = "is_create_org";
  static const orgName = "org_name";
}

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
      {this.lang, this.connectionId, this.loginHint, this.orgCode});

  Map<String, String> _toMap() {
    final params = <String, String>{};
    if (orgCode != null) {
      params[ParamName.orgCode] = orgCode!;
    }
    if (lang != null) {
      params[ParamName.lang] = lang!;
    }
    if (connectionId != null) {
      params[ParamName.connectionId] = connectionId!;
    }
    if (loginHint != null) {
      params[ParamName.loginHint] = loginHint!;
    }
    return params;
  }
}

class AdditionalParameters extends BaseAdditionalParameters {
  const AdditionalParameters(
      {super.lang, super.connectionId, super.loginHint, super.orgCode});
}

class InternalAdditionalParameters extends BaseAdditionalParameters {
  String? audience;
  List<String>? promptValues;
  List<String>? scopes;
  String? state;
  String? registrationPage;
  bool? createOrg;
  String? orgName;

  /// The PKCE code verifier for OAuth 2.0 Authorization Code flow with PKCE.
  /// This is a cryptographically random string used to correlate the authorization request with the token request.
  /// Not included in the toMap() method as it's not sent as a URL parameter but used separately in the token exchange step.
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

  factory InternalAdditionalParameters.fromUserAdditionalParams(
      AdditionalParameters userParams) {
    return InternalAdditionalParameters(
      lang: userParams.lang,
      connectionId: userParams.connectionId,
      loginHint: userParams.loginHint,
      orgCode: userParams.orgCode,
    );
  }

  Map<String, String> toWebParams() {
    return _toMap();
  }

  @override
  Map<String, String> _toMap() {
    final result = Map<String, String>.from(super._toMap());
    if (audience != null) {
      result[ParamName.audience] = audience!;
    }
    if (promptValues != null) {
      result[ParamName.prompt] = promptValues!.join(' ');
    }
    if (scopes != null) {
      result[ParamName.scope] = scopes!.join(' ');
    }
    if (state != null) {
      result[ParamName.state] = state!;
    }
    if (registrationPage != null) {
      result[ParamName.startPage] = registrationPage!;
    }
    if (createOrg != null) {
      result[ParamName.isCreateOrg] = createOrg.toString();
    }
    if (orgName != null) {
      result[ParamName.orgName] = orgName!;
    }
    return result;
  }

  ///for Authorization Request setting 'scope' and 'prompt' via builder
  Map<String, String> toAuthorizationRequestParams() {
    final dict = _toMap();
    dict.remove(ParamName.scope);
    dict.remove(ParamName.prompt);
    return dict;
  }
}
