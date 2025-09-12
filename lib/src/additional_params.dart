enum Parameter {
  scope("scope"),
  prompt("prompt"),
  orgCode("org_code"),
  lang("lang"),
  connectionId("connection_id"),
  loginHint("login_hint"),
  audience("audience"),
  state("state"),
  startPage("start_page"),
  isCreateOrg("is_create_org"),
  orgName("org_name"),
  planInterest("plan_interest"),
  pricingTableKey("pricing_table_key");

  const Parameter(this.value);

  final String value;

  String get name => value;
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

  /// Plan the user has indicated interest in
  final String? planInterest;

  /// Key for the pricing table to use (optional)
  final String? pricingTableKey;

  const BaseAdditionalParameters(
      {this.lang,
      this.connectionId,
      this.loginHint,
      this.orgCode,
      this.planInterest,
      this.pricingTableKey});

  Map<String, String> toWebParams() {
    final params = <String, String>{};
    if (orgCode != null) {
      params[Parameter.orgCode.name] = orgCode!;
    }
    if (lang != null) {
      params[Parameter.lang.name] = lang!;
    }
    if (connectionId != null) {
      params[Parameter.connectionId.name] = connectionId!;
    }
    if (loginHint != null) {
      params[Parameter.loginHint.name] = loginHint!;
    }
    if (planInterest != null) {
      params[Parameter.planInterest.name] = planInterest!;
    }
    if (pricingTableKey != null) {
      params[Parameter.pricingTableKey.name] = pricingTableKey!;
    }
    return params;
  }
}

class AdditionalParameters extends BaseAdditionalParameters {
  const AdditionalParameters(
      {super.lang,
      super.connectionId,
      super.loginHint,
      super.orgCode,
      super.planInterest,
      super.pricingTableKey});
}

class InternalAdditionalParameters extends BaseAdditionalParameters {
  String? audience;
  List<String>? promptValues;
  List<String>? scopes;
  String? state;
  String? registrationPage;
  bool? createOrg;
  String? orgName;

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
      super.orgCode,
      super.planInterest,
      super.pricingTableKey});

  factory InternalAdditionalParameters.fromUserAdditionalParams(
      AdditionalParameters userParams) {
    return InternalAdditionalParameters(
      lang: userParams.lang,
      connectionId: userParams.connectionId,
      loginHint: userParams.loginHint,
      orgCode: userParams.orgCode,
      planInterest: userParams.planInterest,
      pricingTableKey: userParams.pricingTableKey,
    );
  }

  @override
  Map<String, String> toWebParams() {
    final result = Map<String, String>.from(super.toWebParams());
    if (audience != null) {
      result[Parameter.audience.name] = audience!;
    }
    if (promptValues != null) {
      result[Parameter.prompt.name] = promptValues!.join(' ');
    }
    if (scopes != null) {
      result[Parameter.scope.name] = scopes!.join(' ');
    }
    if (state != null) {
      result[Parameter.state.name] = state!;
    }
    if (registrationPage != null) {
      result[Parameter.startPage.name] = registrationPage!;
    }
    if (createOrg != null) {
      result[Parameter.isCreateOrg.name] = createOrg.toString();
    }
    if (orgName != null) {
      result[Parameter.orgName.name] = orgName!;
    }
    return result;
  }

  ///for Authorization Request setting 'scope' and 'prompt' via builder
  Map<String, String> toAuthorizationRequestParams() {
    final dict = toWebParams();
    dict.remove(Parameter.scope.name);
    dict.remove(Parameter.prompt.name);
    return dict;
  }
}
