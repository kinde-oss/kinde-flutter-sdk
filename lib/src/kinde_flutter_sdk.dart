import 'dart:async';
import 'dart:io';

import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_secure_storage.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/kinde_web.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/utils/cross_platform_support.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

import 'package:hive/hive.dart';
import 'package:jose/jose.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/keys/keys_api.dart';
import 'package:kinde_flutter_sdk/src/store/store.dart';
import 'package:kinde_flutter_sdk/src/token/auth_state.dart';
import 'package:kinde_flutter_sdk/src/token/refresh_token_interceptor.dart';
import 'package:kinde_flutter_sdk/src/token/token_api.dart';
import 'package:kinde_flutter_sdk/src/token/token_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

class KindeFlutterSDK with TokenUtils {
  static const _orgNameParamName = 'org_name';
  static const _audienceParamName = 'audience';
  static const _createOrgParamName = 'is_create_org';
  static const _registrationPageParamName = 'start_page';
  static const _registrationPageParamValue = 'registration';
  static const _authPath = '/oauth2/auth';
  static const _tokenPath = '/oauth2/token';
  static const _logoutPath = '/logout';
  static const _defaultScopes = ['openid', 'profile', 'email', 'offline'];
  static const _bearerAuth = 'kindeBearerAuth';
  static const _clientIdParamName = 'client_id';

  // Singleton
  static KindeFlutterSDK? _instance;

  @override
  AuthState? get authState => _store.authState;

  static AuthConfig? _config;
  late KindeApi _kindeApi;
  late KeysApi _keysApi;
  late TokenApi _tokenApi;
  late AuthorizationServiceConfiguration _serviceConfiguration;

  static KindeFlutterSDK get instance {
    return _instance ??= KindeFlutterSDK._internal();
  }

  KindeFlutterSDK._internal() {
    if (_config == null) {
      throw const KindeError(
        code: KindeErrorCode.missingConfig,
        message: 'KindeFlutterSDK has not been configured',
      );
    }

    var domainUrl = "";
    if (_config!.authDomain.startsWith('https')) {
      domainUrl = _config!.authDomain;
    } else if (_config!.authDomain.startsWith('http')) {
      domainUrl = _config!.authDomain.replaceFirst('http', "https");
    } else {
      domainUrl = 'https://${_config!.authDomain}';
    }

    _serviceConfiguration = AuthorizationServiceConfiguration(
        authorizationEndpoint: '$domainUrl$_authPath',
        tokenEndpoint: '$domainUrl$_tokenPath',
        endSessionEndpoint: '$domainUrl$_logoutPath');

    Dio dio = Dio(BaseOptions(
      baseUrl: domainUrl,
    ));

    _kindeApi = KindeApi(dio: dio, interceptors: [
      BearerAuthInterceptor(),
      RefreshTokenInterceptor(
        dio: dio,
        refreshToken: getToken,
      ),
    ]);
    _keysApi = KeysApi(_kindeApi.dio);
    _tokenApi = TokenApi(_kindeApi.dio);
    if (_store.keys == null) {
      _keysApi.getKeys().then((value) {
        _store.keys = value;
      });
    }

    var token = authState?.accessToken;
    if (token != null) {
      _kindeApi.setBearerAuth(_bearerAuth, token);
    }
  }

  Store get _store => Store.instance;

  static Future<KindeFlutterSDK> initializeSDK(
      {required String authDomain,
      required String authClientId,
      required String loginRedirectUri,
      required String logoutRedirectUri,
      List<String> scopes = _defaultScopes,
      String? audience}) async {
    try {
      _config = AuthConfig(
          authDomain: authDomain,
          authClientId: authClientId,
          loginRedirectUri: loginRedirectUri,
          logoutRedirectUri: logoutRedirectUri,
          scopes: scopes,
          audience: audience);

      List<int>? secureKey = await KindeSecureStorage.instance.getSecureKey();
      if (secureKey == null) {
        secureKey = Hive.generateSecureKey();
        await KindeSecureStorage.instance.saveSecureKey(secureKey);
      }

      String path = await getTemporaryDirectoryPath();

      await Store.init(HiveAesCipher(secureKey), path);
      if (kIsWeb) {
        await KindeWeb.initialize();
      }

      return instance;
    } catch (e, st) {
      if (e is KindeError) {
        rethrow;
      }
      throw KindeError(
          code: KindeErrorCode.initializingFailed,
          message: e.toString(),
          stackTrace: st);
    }
  }

  static Future<String> getTemporaryDirectoryPath() async {
    Directory? path;
    if (!kIsWeb) {
      path = await getTemporaryDirectory();
      return path.path;
    } else {
      return WebUtils.temporaryDirectory;
    }
  }

  /// for web it invokes logoutRedirectUri
  Future<void> logout({Dio? dio}) async {
    if (!kIsWeb) {
      switch (Platform.operatingSystem) {
        case "macos":
          _logoutWithoutRedirection(dio: dio);
          return;
        case "android":
        case "ios":
          try {
            const appAuth = FlutterAppAuth();
            final endSessionRequest = EndSessionRequest(
              externalUserAgent:
                  ExternalUserAgent.ephemeralAsWebAuthenticationSession,
              idTokenHint: _config!.authClientId,
              postLogoutRedirectUrl: _config!.logoutRedirectUri,
              serviceConfiguration: _serviceConfiguration,
            );
            await appAuth.endSession(endSessionRequest);
          } on FlutterAppAuthPlatformException catch (e) {
            debugPrint("Error in logout(), details: ${e.details}");
            return;
          } catch (e) {
            debugPrint("Error in logout(): $e");
            return;
          }
      }
    }
    _kindeApi.setBearerAuth(_bearerAuth, '');
    await Store.instance.clear();
    if (kIsWeb &&
        _config?.logoutRedirectUri != null &&
        _config!.logoutRedirectUri.isNotEmpty) {
      KindeWeb.instance.logout(_config!.logoutRedirectUri);
    }
  }

  /// Logs out the user without redirection.
  Future<void> _logoutWithoutRedirection({Dio? dio}) async {
    try {
      var dioClient = dio ?? Dio();
      final response =
          await dioClient.get(_serviceConfiguration.endSessionEndpoint!);

      _kindeApi.setBearerAuth(_bearerAuth, '');
      await Store.instance.clear();

      if (response.statusCode != null && response.statusCode! > 400) {
        throw KindeError(
            code: KindeErrorCode.logoutRequestFailed,
            message: "Logout status code: ${response.statusCode}");
      }
    } catch (error, st) {
      throw KindeError.fromError(error, st);
    }
  }

  /// for web it returns null, and invokes loginRedirectUri
  Future<String?> login({
    AuthFlowType? type,
    AuthUrlParams? urlParams,
  }) async {
    return _redirectToKinde(
      type: type,
      queryParams: urlParams?.toMap(),
    );
  }

  /// for web it returns null, and invokes loginRedirectUri
  Future<String?> _redirectToKinde({
    AuthFlowType? type,
    Map<String, String>? queryParams,
  }) async {
    final Map<String, String> params = Map.from(queryParams ?? {});
    if (_config?.audience != null) {
      params.putIfAbsent(_audienceParamName, () => _config!.audience!);
    }
    if (kIsWeb) {
      _handleWebLogin(params);
    } else {
      return _handleOtherLogin(type, params);
    }

    return null;
  }

  Future<String?> _handleOtherLogin(
      AuthFlowType? type, Map<String, String> params) {
    if (type == AuthFlowType.pkce) {
      return _pkceLogin(params);
    } else {
      return _normalLogin(params);
    }
  }

  void _handleWebLogin(
    Map<String, String> params,
  ) {
    KindeWeb.instance.startLoginFlow(
      AuthorizationRequest(
        _config!.authClientId,
        _config!.loginRedirectUri,
        serviceConfiguration: _serviceConfiguration,
        externalUserAgent:
            ExternalUserAgent.ephemeralAsWebAuthenticationSession,
        scopes: _config!.scopes,
        promptValues: ['login'],
        additionalParameters: params,
      ),
    );
  }

  Future<bool> _finishWebLogin(String responseUrl) async {
    final credentials = await KindeWeb.instance.finishLoginFlow(
        scopes: _config!.scopes,
        redirectUrl: _config!.loginRedirectUri,
        responseUrl: responseUrl,
        clientId: _config!.authClientId,
        authorizationEndpoint: _serviceConfiguration.authorizationEndpoint,
        tokenEndpoint: _serviceConfiguration.tokenEndpoint);

    if (credentials == null) {
      kindeDebugPrint(
          methodName: "finishWebLogin",
          message:
              "No credentials returned from finishLoginFlow. Login may have been canceled or failed.");
      return false;
    }

    _saveState(TokenResponse(
      credentials.accessToken,
      credentials.refreshToken,
      credentials.expiration,
      credentials.idToken,
      null,
      credentials.scopes,
      null,
    ));

    return true;
  }

  /// for web it returns null, and invokes loginRedirectUri
  Future<String?> register({
    AuthFlowType? type,
    AuthUrlParams? authUrlParams,
  }) async {
    final additionalParams = {
      _registrationPageParamName: _registrationPageParamValue
    };
    if (authUrlParams != null) {
      additionalParams.addAll(authUrlParams.toMap());
    }

    return _redirectToKinde(type: type, queryParams: additionalParams);
  }

  Future<UserProfileV2?> getUserProfileV2() async {
    return _kindeApi.getOAuthApi().getUserProfileV2().then((value) {
      return value.data;
    }).catchError((error, st) {
      throw KindeError.fromError(error, st);
    });
  }

  Future<UserProfile?> getUser() async {
    return _kindeApi.getOAuthApi().getUser().then((value) {
      return value.data;
    }).catchError((error, st) {
      throw KindeError.fromError(error, st);
    });
  }

  Future<void> createOrg({required String orgName, AuthFlowType? type}) async {
    final params = {
      _registrationPageParamName: _registrationPageParamValue,
      _createOrgParamName: "true",
      _orgNameParamName: orgName
    };

    await _redirectToKinde(type: type, queryParams: params);
  }

  Future<String?> getToken() async {
    if (await isAuthenticated()) {
      return _store.authState?.accessToken;
    }
    final version = await _getVersion();
    final versionParam = 'Flutter/$version';
    try {
      if (authState?.refreshToken == null) {
        throw const KindeError(
          code: KindeErrorCode.sessionExpiredOrInvalid,
        );
      }
      final data = await _tokenApi.retrieveToken(
          versionParam,
          _store.authState!.createRequestTokenParam()
            ..putIfAbsent(_clientIdParamName, () => _config!.authClientId));
      _store.authState = AuthState.fromJson(data as Map<String, dynamic>);
      _kindeApi.setBearerAuth(_bearerAuth, _store.authState?.accessToken ?? '');
      return _store.authState?.accessToken;
    } catch (e, st) {
      throw KindeError.fromError(e, st);
    }
  }

  Future<bool> isAuthenticated() async {
    final finishLoginUri = _isWebAuthInProcess();
    if (finishLoginUri != null) {
      final isWebLoginSuccess = await _finishWebLogin(finishLoginUri);
      return isWebLoginSuccess;
    }
    return authState != null && !authState!.isExpired() && await _checkToken();
  }

  ///returns current url if it contain required params for finishing auth flow
  String? _isWebAuthInProcess() {
    if (kIsWeb && authState == null) {
      final currentUrl = WebUtils.getCurrentUrl ?? "";
      final currentUri = Uri.tryParse(currentUrl);
      return currentUri?.queryParameters["code"]?.isNotEmpty ?? false
          ? currentUrl
          : null;
    }
    return null;
  }

  Future<String?> _normalLogin(Map<String, String> additionalParams) async {
    try {
      const appAuth = FlutterAppAuth();
      final authorizationTokenResponse = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          _config!.authClientId,
          _config!.loginRedirectUri,
          serviceConfiguration: _serviceConfiguration,
          externalUserAgent:
              ExternalUserAgent.ephemeralAsWebAuthenticationSession,
          scopes: _config!.scopes,
          promptValues: ['login'],
          additionalParameters: additionalParams,
        ),
      );

      if (additionalParams.containsKey(_orgNameParamName)) {
        return additionalParams[_orgNameParamName];
      }
      _saveState(authorizationTokenResponse);
      return authorizationTokenResponse.accessToken;
    } catch (e, st) {
      throw KindeError.fromError(e, st);
    }
  }

  Future<String?> _pkceLogin(Map<String, String> additionalParams) async {
    const appAuth = FlutterAppAuth();
    final loginHint = additionalParams.remove("login_hint");
    try {
      final result = await appAuth.authorize(
        AuthorizationRequest(
          _config!.authClientId,
          _config!.loginRedirectUri,
          serviceConfiguration: _serviceConfiguration,
          scopes: _config!.scopes,
          promptValues: ['login'],
          loginHint: loginHint,
          externalUserAgent:
              ExternalUserAgent.ephemeralAsWebAuthenticationSession,
          additionalParameters: additionalParams,
        ),
      );
      final token = await appAuth.token(
        TokenRequest(
          _config!.authClientId,
          _config!.loginRedirectUri,
          codeVerifier: result.codeVerifier,
          authorizationCode: result.authorizationCode,
          serviceConfiguration: _serviceConfiguration,
          nonce: result.nonce,
          scopes: _config!.scopes,
          additionalParameters: additionalParams,
        ),
      );

      if (additionalParams.containsKey(_orgNameParamName)) {
        return additionalParams[_orgNameParamName];
      }

      _saveState(token);
      return token.accessToken;
    } catch (e, st) {
      throw KindeError.fromError(e, st);
    }
  }

  Future<bool> _checkToken() async {
    final keys = _store.keys?.keys;
    if (keys != null && keys.isNotEmpty) {
      final key = keys.first;
      var jwt = JsonWebToken.unverified(_store.authState?.accessToken ?? '');

      var jwk = JsonWebKey.fromJson(key.toJson());

      var keyStore = JsonWebKeyStore()..addKey(jwk);

      return await jwt.verify(keyStore);
    }
    return false;
  }

  _saveState(TokenResponse? tokenResponse) {
    _store.authState = AuthState(
        accessToken: tokenResponse?.accessToken,
        idToken: tokenResponse?.idToken,
        accessTokenExpirationDateTime:
            tokenResponse?.accessTokenExpirationDateTime,
        refreshToken: tokenResponse?.refreshToken,
        scope: tokenResponse?.scopes?.join(' '));
    _kindeApi.setBearerAuth(_bearerAuth, tokenResponse?.accessToken ?? '');
  }

  Future<String> _getVersion() async {
    try {
      final fileContent = await rootBundle.loadString(
        "packages/kinde_flutter_sdk/pubspec.yaml",
      );
      final pubspec = Pubspec.parse(fileContent);
      return pubspec.version?.canonicalizedVersion ?? '';
    } catch (exception) {
      return '';
    }
  }
}
