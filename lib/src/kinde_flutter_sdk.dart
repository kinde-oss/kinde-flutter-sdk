import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'
    as secure_store;
import 'package:hive/hive.dart';
import 'package:jose/jose.dart';
import 'package:kinde_api/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/keys/keys_api.dart';
import 'package:kinde_flutter_sdk/src/kinde_error.dart';
import 'package:kinde_flutter_sdk/src/model/auth_flow_type.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';
import 'package:kinde_flutter_sdk/src/store/store.dart';
import 'package:kinde_flutter_sdk/src/token/auth_state.dart';
import 'package:kinde_flutter_sdk/src/token/token_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'auth_config.dart';

class KindeFlutterSDK with TokenUtils {
  static const _orgCodeParamName = 'org_code';
  static const _orgNameParamName = 'org_name';
  static const _audienceParamName = 'audience';
  static const createOrgParamName = 'is_create_org';
  static const redirectParamName = 'redirect';
  static const registrationPageParamName = 'start_page';
  static const registrationPageParamValue = 'registration';
  static const authPath = '/oauth2/auth';
  static const tokenPath = '/oauth2/token';
  static const logoutPath = '/logout';
  static const defaultScopes = ['openid', 'profile', 'email', 'offline'];
  static const bearerAuth = 'kindeBearerAuth';

  // Singleton
  static KindeFlutterSDK? _instance;

  @override
  AuthState? get authState => _store.authState;

  static AuthConfig? _config;
  late KindeApi _kindeApi;
  late KeysApi _keysApi;
  late AuthorizationServiceConfiguration _serviceConfiguration;

  static KindeFlutterSDK get instance {
    _instance ??= KindeFlutterSDK._internal();
    return _instance ?? KindeFlutterSDK._internal();
  }

  KindeFlutterSDK._internal() {
    if (_config == null) {
      throw KindeError('KindeFlutterSDK have not been configured');
    }
    _serviceConfiguration = AuthorizationServiceConfiguration(
        authorizationEndpoint: 'https://${_config!.authDomain}$authPath',
        tokenEndpoint: 'https://${_config!.authDomain}$tokenPath',
        endSessionEndpoint: 'https://${_config!.authDomain}$logoutPath');
    _kindeApi = KindeApi(basePathOverride: 'https://${_config!.authDomain}');
    _keysApi = KeysApi(_kindeApi.dio);

    if (_store.keys == null) {
      _keysApi.getKeys().then((value) {
        _store.keys = value;
      });
    }
  }

  Store get _store => Store.instance;

  static Future<void> initializeSDK(
      {required String authDomain,
      required String authClientId,
      required String loginRedirectUri,
      required String logoutRedirectUri,
      String? audience}) async {

    _config = AuthConfig(
      authDomain: authDomain,
      authClientId: authClientId,
      loginRedirectUri: loginRedirectUri,
      logoutRedirectUri: logoutRedirectUri,
      audience: audience,
    );

    secure_store.FlutterSecureStorage secureStorage =
        const secure_store.FlutterSecureStorage(
            aOptions: secure_store.AndroidOptions());

    Future<List<int>> getSecureKey(
        secure_store.FlutterSecureStorage secureStorage) async {
      var containsEncryptionKey =
          await secureStorage.containsKey(key: 'encryptionKey');
      if (!containsEncryptionKey) {
        var key = Hive.generateSecureKey();
        await secureStorage.write(
            key: 'encryptionKey', value: base64UrlEncode(key));
        return key;
      } else {
        final base64 = await secureStorage.read(key: 'encryptionKey');
        return base64Url.decode(base64!);
      }
    }

    final secureKey = await getSecureKey(secureStorage);

    final path = await getTemporaryDirectory();

    await Store.init(HiveAesCipher(secureKey), path.path);
  }

  Future<void> logout() async {
    if (Platform.isIOS) {
      final browser = ChromeSafariBrowser();
      await browser.open(url: _buildEndSessionUrl()).then((value) async {
        await browser.close();
      });
    } else {
      await launch(_buildEndSessionUrl().toString());
    }
  }

  Future<String?> login(
      {AuthFlowType? type, String? orgCode, Map<String, String> additionalParams = const {}}) async {
    if (orgCode != null) {
      additionalParams.putIfAbsent(_orgCodeParamName, () => orgCode);
    }
    if (_config?.audience != null) {
      additionalParams.putIfAbsent(_audienceParamName, () => _config!.audience!);
    }

    if (type == AuthFlowType.pkce) {
      return _loginPKCE(orgCode, additionalParams);
    } else {
      return _login(type, orgCode, additionalParams);
    }
  }

  Future register({AuthFlowType? type, String? orgCode}) async {
    login(
        type: type,
        orgCode: orgCode,
        additionalParams: {registrationPageParamName: registrationPageParamValue});
  }

  Future<UserProfileV2?> getUserProfileV2() async {
    return _kindeApi.getOAuthApi().getUserProfileV2().then((value) {
      return value.data;
    });
  }

  Future<bool> isAuthenticate() async =>
      authState != null && !authState!.isExpired() && await _checkToken();

  Future<String?> _login(AuthFlowType? type, String? orgCode,
      Map<String, String> additionalParams) async {
    const appAuth = FlutterAppAuth();
    AuthorizationTokenResponse? result = await appAuth.authorizeAndExchangeCode(
      AuthorizationTokenRequest(
        _config!.authClientId,
        _config!.loginRedirectUri,
        serviceConfiguration: _serviceConfiguration,
        scopes: defaultScopes,
        promptValues: ['login'],
        // preferEphemeralSession: true,
        additionalParameters: additionalParams,
      ),
    );
    _saveState(result);
    return result?.accessToken;
  }

  Future<String?> _loginPKCE(String? orgCode,
      Map<String, String> additionalParams) async {
    const appAuth = FlutterAppAuth();
    final result = await appAuth.authorize(
      AuthorizationRequest(
        _config!.authClientId,
        _config!.loginRedirectUri,
        serviceConfiguration: _serviceConfiguration,
        scopes: defaultScopes,
        promptValues: ['login'],
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
    _saveState(token);
    return token?.accessToken ?? '';
  }

  Uri _buildEndSessionUrl() {
    var uri = Uri.parse(_serviceConfiguration.endSessionEndpoint!)
        .replace(queryParameters: {
      'post_logout_redirect_uri': _config!.logoutRedirectUri,
      'redirect': _config!.logoutRedirectUri,
    });
    return uri;
  }

  Future<bool> _checkToken() async {
    final keys = _store.keys?.keys;
    if (keys != null && keys.isNotEmpty) {
      final key = keys.first;
      var jwt = JsonWebToken.unverified(_store.authState?.accessToken ?? '');

      if (kDebugMode) {
        print("claims: ${jwt.claims}");
      }

      var jwk = JsonWebKey.fromJson(key.toJson());

      var keyStore = JsonWebKeyStore()..addKey(jwk);

      return await jwt.verify(keyStore);
    }
    return false;
  }

  _saveState(TokenResponse? tokenResponse) {
    print('CLAIM ACCESS TOKEN: ${parseToken(tokenResponse?.accessToken)}');
    print('CLAIM ID TOKEN: ${parseToken(tokenResponse?.idToken)}');
    _store.authState = AuthState(
        accessToken: tokenResponse?.accessToken,
        idToken: tokenResponse?.idToken,
        accessTokenExpirationDateTime:
            tokenResponse?.accessTokenExpirationDateTime,
        refreshToken: tokenResponse?.refreshToken);
    _kindeApi.setBearerAuth(bearerAuth, tokenResponse?.accessToken ?? '');
  }
}
