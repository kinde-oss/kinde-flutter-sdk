import 'dart:collection';
import 'dart:convert';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:kinde_api/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/kinde_error.dart';
import 'package:kinde_flutter_sdk/src/model/auth_flow_type.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import 'auth_config.dart';

class KindeFlutterSDK {
  static const orgCodeParamName = 'org_code';
  static const orgNameParamName = 'org_name';
  static const audienceParamName = 'audience';
  static const createOrgParamName = 'is_create_org';
  static const redirectParamName = 'redirect';
  static const registrationPageParamName = 'start_page';
  static const registrationPageParamValue = 'registration';
  static const authPath = '/oauth2/auth';
  static const tokenPath = '/oauth2/token';
  static const logoutPath = '/logout';
  static const defaultScopes = ['openid', 'profile', 'email', 'offline'];

  static Future<void> initializeSDK({
    required authDomain,
    required authClientId,
    required loginRedirectUri,
    required logoutRedirectUri,
  }) async {
    _config = AuthConfig(
        authDomain: authDomain,
        authClientId: authClientId,
        loginRedirectUri: loginRedirectUri,
        logoutRedirectUri: logoutRedirectUri);
    _serviceConfiguration = AuthorizationServiceConfiguration(
        authorizationEndpoint: 'https://${_config!.authDomain}$authPath',
        tokenEndpoint: 'https://${_config!.authDomain}$tokenPath',
        endSessionEndpoint: 'https://${_config!.authDomain}$logoutPath');
    _kindeApi = KindeApi(basePathOverride: 'https://${_config!.authDomain}');
  }

  // Singleton
  static KindeFlutterSDK? _instance;

  static KindeFlutterSDK get instance {
    _instance ??= KindeFlutterSDK._internal();
    return _instance ?? KindeFlutterSDK._internal();
  }

  KindeFlutterSDK._internal();

  static AuthConfig? _config;
  static KindeApi? _kindeApi;
  static late AuthorizationServiceConfiguration _serviceConfiguration;

  String _accessToken = "";

  Future<void> logout() async {
    if (_config == null) {
      throw KindeError('KindeFlutterSDK have not been configured');
    }

    await launch(_buildEndSessionUrl());
  }

  Future<String?> login(
      {AuthFlowType? type, String? orgCode, String? audience}) async {
    final additionalParams = HashMap<String, String>();
    if (_config == null) {
      throw KindeError('KindeFlutterSDK have not been configured');
    }
    if (orgCode != null) {
      additionalParams.putIfAbsent(orgCodeParamName, () => orgCode);
    }
    if (audience != null) {
      additionalParams.putIfAbsent(audienceParamName, () => audience);
    }

    if (type == AuthFlowType.pkce) {
      return _loginPKCE(orgCode, audience, additionalParams);
    } else {
      return _login(type, orgCode, audience, additionalParams);
    }
  }

  Future register({AuthFlowType? type, String? orgCode}) async {
    _login(type, orgCode, null,
        {registrationPageParamName: registrationPageParamValue});
  }

  Future<UserProfileV2?> getUserProfileV2() async {
    return _kindeApi?.getOAuthApi().getUserProfileV2().then((value) {
      return value.data;
    });
  }

  Future<String?> _login(AuthFlowType? type, String? orgCode, String? audience,
      Map<String, String> additionalParams) async {
    const appAuth = FlutterAppAuth();
    AuthorizationTokenResponse? result = await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        _config!.authClientId,
        _config!.loginRedirectUri,
        serviceConfiguration: _serviceConfiguration,
        scopes: defaultScopes,
        // promptValues: ['login'],
        // preferEphemeralSession: true,
        additionalParameters: additionalParams,
      ),
    );
    _accessToken = result?.accessToken ?? '';
    _kindeApi?.setBearerAuth('kindeBearerAuth', _accessToken);
    return result?.accessToken;
  }

  Future<String?> _loginPKCE(String? orgCode, String? audience,
      Map<String, String> additionalParams) async {
    const appAuth = FlutterAppAuth();
    final result = await appAuth.authorize(
      AuthorizationRequest(
        _config!.authClientId,
        _config!.loginRedirectUri,
        serviceConfiguration: _serviceConfiguration,
        scopes: defaultScopes,
        // promptValues: ['login'],
        // preferEphemeralSession: true,
        additionalParameters: additionalParams,
      ),
    );
    final token = await appAuth.token(
      TokenRequest(
        _config!.authClientId,
        _config!.loginRedirectUri,
        codeVerifier: result!.codeVerifier,
        authorizationCode: result.authorizationCode,
        serviceConfiguration: _serviceConfiguration,
        grantType: GrantType.authorizationCode,
        nonce: result.nonce,
        scopes: defaultScopes,
        additionalParameters: additionalParams,
      ),
    );
    _accessToken = token?.accessToken ?? '';
    _kindeApi?.setBearerAuth('kindeBearerAuth', _accessToken);
    return token?.accessToken ?? '';
  }

  String _buildEndSessionUrl() {
    var uri = Uri.parse(_serviceConfiguration.endSessionEndpoint!)
        .replace(queryParameters: {
      'post_logout_redirect_uri': _config!.logoutRedirectUri,
      'redirect': _config!.logoutRedirectUri,
    });
    return uri.toString();
  }
}
