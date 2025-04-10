import 'dart:async';
import 'dart:io';

import 'package:kinde_flutter_sdk/src/additional_params.dart';
import 'package:kinde_flutter_sdk/src/kinde_secure_storage/kinde_secure_storage_i.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';
import 'package:kinde_flutter_sdk/src/kinde_secure_storage/kinde_secure_storage.dart';
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
  static const _registrationPageParamValue = 'registration';
  static const _authPath = '/oauth2/auth';
  static const _tokenPath = '/oauth2/token';
  static const _logoutPath = '/logout';
  static const _defaultScopes = ['openid', 'profile', 'email', 'offline'];
  static const _bearerAuth = 'kindeBearerAuth';
  static const _clientIdParamName = 'client_id';

  // Singleton
  static KindeFlutterSDK? _instance;

  late final KindeSecureStorageInterface _kindeSecureStorage;

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

  @visibleForTesting
  static KindeFlutterSDK testInstance(
      KindeSecureStorageInterface? kindeSecureStorage) {
    return _instance ??=
        KindeFlutterSDK._internal(secureStorage: kindeSecureStorage);
  }

  KindeFlutterSDK._internal({KindeSecureStorageInterface? secureStorage}) {
    if (_config == null) {
      throw const KindeError(
        code: KindeErrorCode.missingConfig,
        message: 'KindeFlutterSDK has not been configured',
      );
    }

    _kindeSecureStorage = secureStorage ?? KindeSecureStorage();

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

  static Future<KindeFlutterSDK> initializeSDK({
    required String authDomain,
    required String authClientId,
    required String loginRedirectUri,
    required String logoutRedirectUri,
    List<String> scopes = _defaultScopes,
    String? audience,
  }) async {

    String step = 'initializing';

    try {
      step = 'config setup';
      _config = AuthConfig(
        authDomain: authDomain,
        authClientId: authClientId,
        loginRedirectUri: loginRedirectUri,
        logoutRedirectUri: logoutRedirectUri,
        scopes: scopes,
        audience: audience,
      );

      step = 'secure key retrieval';


      final kindeSecureStorage = KindeSecureStorage();

      List<int>? secureKey =
          await kindeSecureStorage.getSecureKey();

      if (secureKey == null) {
        step = 'secure key generation and storage';
        secureKey = Hive.generateSecureKey();
        await kindeSecureStorage.saveSecureKey(secureKey);
      }

      step = 'temp path resolution';
      final String path = await getTemporaryDirectoryPath();

      step = 'Hive store initialization';
      await Store.init(HiveAesCipher(secureKey), path);

      if (kIsWeb) {
        step = 'web layer initialization';
        await KindeWeb.initialize(secureStorage: kindeSecureStorage);
      }

      step = 'finalization';

      return KindeFlutterSDK._internal(secureStorage: kindeSecureStorage);
    } catch (e, st) {
      _config = null;
      kindeDebugPrint(
          methodName: "KindeFlutterSDK.initializeSDK",
          message: 'SDK initialization failed at step: $step');
      if (e is KindeError) rethrow;

      throw KindeError(
        code: KindeErrorCode.initializingFailed,
        message: 'Error during "$step": ${e.toString()}',
        stackTrace: st,
      );
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
  Future<void> logout(
      {Dio? dio, bool macosLogoutWithoutRedirection = true}) async {
    if (!kIsWeb) {
      if (Platform.operatingSystem == "macos" &&
          macosLogoutWithoutRedirection) {
        _logoutWithoutRedirection(dio: dio);
        return;
      }
      try {
        const appAuth = FlutterAppAuth();
        final endSessionRequest = EndSessionRequest(
          ///macOS and iOS 12 and above
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
    AdditionalParameters additionalParams = const AdditionalParameters(),
  }) async {
    final internalAdditionalParams =
        _prepareInternalAdditionalParameters(additionalParams);
    return _redirectToKinde(
      type: type,
      internalAdditionalParameters: internalAdditionalParams,
    );
  }

  InternalAdditionalParameters _prepareInternalAdditionalParameters(
      AdditionalParameters additionalParams) {
    final internalAdditionalParams =
        InternalAdditionalParameters.fromUserAdditionalParams(additionalParams);
    internalAdditionalParams.audience = _config!.audience;
    internalAdditionalParams.promptValues = ['login'];
    internalAdditionalParams.scopes = _config!.scopes;
    return internalAdditionalParams;
  }

  /// for web it returns null, and invokes loginRedirectUri
  Future<String?> _redirectToKinde({
    AuthFlowType? type,
    required InternalAdditionalParameters internalAdditionalParameters,
  }) async {
    if (kIsWeb) {
      _handleWebLogin(internalAdditionalParameters);
    } else {
      return _handleOtherLogin(type, internalAdditionalParameters);
    }
    return null;
  }

  //MacOs, Android, IOS
  Future<String?> _handleOtherLogin(
      AuthFlowType? type, InternalAdditionalParameters params) async {
    const appAuth = FlutterAppAuth();
    TokenResponse tokenResponse;
    final additionalParameters = params.toMap();
    try {
      if (type == AuthFlowType.pkce) {
        final AuthorizationResponse result = await appAuth.authorize(
          AuthorizationRequest(
            _config!.authClientId,
            _config!.loginRedirectUri,
            serviceConfiguration: _serviceConfiguration,
            externalUserAgent:
                ExternalUserAgent.ephemeralAsWebAuthenticationSession,
            additionalParameters: additionalParameters,
          ),
        );

        tokenResponse = await appAuth.token(
          TokenRequest(
            _config!.authClientId,
            _config!.loginRedirectUri,
            codeVerifier: result.codeVerifier,
            authorizationCode: result.authorizationCode,
            serviceConfiguration: _serviceConfiguration,
            nonce: result.nonce,
            additionalParameters: additionalParameters,
          ),
        );
      } else {
        tokenResponse = await appAuth.authorizeAndExchangeCode(
          AuthorizationTokenRequest(
            _config!.authClientId,
            _config!.loginRedirectUri,
            serviceConfiguration: _serviceConfiguration,
            externalUserAgent:
                ExternalUserAgent.ephemeralAsWebAuthenticationSession,
            additionalParameters: additionalParameters,
          ),
        );
      }

      if (params.orgName != null) {
        return params.orgName;
      }

      _saveState(tokenResponse);
      return tokenResponse.accessToken;
    } catch (e, st) {
      throw KindeError.fromError(e, st);
    }
  }

  void _handleWebLogin(
    InternalAdditionalParameters params,
  ) {
    KindeWeb.instance.startLoginFlow(
      AuthorizationRequest(
        _config!.authClientId,
        _config!.loginRedirectUri,
        serviceConfiguration: _serviceConfiguration,
        externalUserAgent:
            ExternalUserAgent.ephemeralAsWebAuthenticationSession,
      ),
      additionalParameters: params
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
    AdditionalParameters additionalParams = const AdditionalParameters(),
  }) async {
    final internalAdditionalParams =
        _prepareInternalAdditionalParameters(additionalParams);
    internalAdditionalParams.registrationPage = _registrationPageParamValue;

    return _redirectToKinde(
        type: type, internalAdditionalParameters: internalAdditionalParams);
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
    final params =
        _prepareInternalAdditionalParameters(const AdditionalParameters());
    params.registrationPage = _registrationPageParamValue;
    params.createOrg = true;
    params.orgName = orgName;

    await _redirectToKinde(type: type, internalAdditionalParameters: params);
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
    final finishLoginUri = _isCurrentUrlContainWebAuthParams();
    if (finishLoginUri != null) {
      final storedState = await _kindeSecureStorage.getAuthRequestState();
      if (storedState != null) {
        return await _finishWebLogin(finishLoginUri);
      }
    }

    final hasValidAuthState = authState != null && !authState!.isExpired();
    return hasValidAuthState && await _checkToken();
  }

  ///returns current url if it contain required params for finishing auth flow
  String? _isCurrentUrlContainWebAuthParams() {
    if (kIsWeb && authState == null) {
      final currentUrl = WebUtils.getCurrentUrl ?? "";
      final currentUri = Uri.tryParse(currentUrl);
      return (currentUri?.queryParameters["code"]?.isNotEmpty ?? false) &&
              (currentUri?.queryParameters["state"]?.isNotEmpty ?? false)
          ? currentUrl
          : null;
    }
    return null;
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
