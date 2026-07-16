import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:kinde_flutter_sdk/src/additional_params.dart';
import 'package:kinde_flutter_sdk/src/kinde_secure_storage/kinde_secure_storage_i.dart';
import 'package:kinde_flutter_sdk/src/utils/app_lifecycle_util.dart';
import 'package:kinde_flutter_sdk/src/utils/deep_link_util.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_custom_types.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';
import 'package:kinde_flutter_sdk/src/kinde_secure_storage/kinde_secure_storage.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/kinde_web.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/utils/cross_platform_support.dart';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';

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

  // Background token refresh timer
  Timer? _refreshTimer;

  // Timer constants for background refresh
  static const Duration _refreshBufferDuration = Duration(seconds: 10);
  static const Duration _maxRefreshInterval = Duration(hours: 24);
  static const Duration _minRefreshInterval = Duration(seconds: 1);

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

  bool _handlingInvitationCode = false;
  StreamSubscription<Uri>? _deepLinkSubscription;

  /// SessionStorage key used to prevent infinite reauth retries on Web.
  static const _webAuthRetriedFlag = 'kinde_web_auth_retried';

  /// SessionStorage key used to preserve custom AdditionalParameters across Web redirects/retries.
  static const _webSavedParamsKey = 'kinde_web_saved_additional_params';

  static KindeFlutterSDK get instance {
    return _instance ??= KindeFlutterSDK._internal();
  }

  KindeFlutterSDK._internal(
    {KindeSecureStorageInterface? secureStorage, Dio? dio}) {
    if (_config == null) {
      throw KindeError(
        code: KindeErrorCode.missingConfig.code,
        message: 'KindeFlutterSDK has not been configured',
      );
    }

    _kindeSecureStorage = secureStorage ?? KindeSecureStorage();

    final domainUrl = _normalizeDomain(_config!.authDomain);

    _serviceConfiguration = AuthorizationServiceConfiguration(
        authorizationEndpoint: '$domainUrl$_authPath',
        tokenEndpoint: '$domainUrl$_tokenPath',
        endSessionEndpoint: '$domainUrl$_logoutPath');
    dio ??= Dio(BaseOptions(
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

  static String _normalizeDomain(String authDomain) {
    if (authDomain.startsWith('https')) {
      return authDomain;
    } else if (authDomain.startsWith('http')) {
      return authDomain.replaceFirst('http', 'https');
    } else {
      return 'https://$authDomain';
    }
  }

  static String _getDomainFromUrl(String url) {
    try {
      final uri = Uri.parse(_normalizeDomain(url));
      return uri.host;
    } catch (_) {
      return '[invalid-domain]';
    }
  }

  static Future<KindeFlutterSDK> initializeSDK({
    required String authDomain,
    required String authClientId,
    required String loginRedirectUri,
    required String logoutRedirectUri,
    List<String> scopes = _defaultScopes,
    String? audience,
  }) async {
    return _initializeSDK(
        authDomain: authDomain,
        authClientId: authClientId,
        loginRedirectUri: loginRedirectUri,
        logoutRedirectUri: logoutRedirectUri,
        scopes: scopes,
        audience: audience);
  }

  static Future<KindeFlutterSDK> _initializeSDK(
      {required String authDomain,
      required String authClientId,
      required String loginRedirectUri,
      required String logoutRedirectUri,
      required List<String> scopes,
      String? audience,
      Dio? dio}) async {
    String step = 'initializing';
    void updateStep(String newStep) {
      step = newStep;
    }

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

      final kindeSecureStorage = KindeSecureStorage();

      await _initializeStore(kindeSecureStorage, stepUpdater: updateStep);

      await _initializeWebLayerIfNeeded(kindeSecureStorage,
          stepUpdater: updateStep);

      updateStep('finalization');

      _instance =
          KindeFlutterSDK._internal(secureStorage: kindeSecureStorage, dio: dio);

      kindeDebugPrint(
        methodName: 'initializeSDK',
        message: 'SDK initialized',
        context: {
          'domain': _getDomainFromUrl(authDomain),
          'platform': kIsWeb ? 'web' : Platform.operatingSystem,
        },
      );

      _instance!._startInvitationLoginIfNeeded();
      return _instance!;
    } catch (e, st) {
      _config = null;
      kindeDebugPrint(
        methodName: 'initializeSDK',
        message: 'Initialization failed at step: $step',
        context: {'step': step, 'error': e.toString()},
      );
      if (e is KindeError) rethrow;

      throw KindeError(
        code: KindeErrorCode.initializingFailed.code,
        message: 'Error during "$step": ${e.toString()}',
        stackTrace: st,
      );
    }
  }

  static Future<void> _initializeStore(KindeSecureStorage kindeSecureStorage,
      {required InitializationStepUpdater stepUpdater}) async {
    stepUpdater('secure storage initialization');
    await Store.init();

    stepUpdater('loading cached data');
    await Store.instance.loadFromStorage();
  }

  static Future<void> _initializeWebLayerIfNeeded(
      KindeSecureStorage kindeSecureStorage,
      {required InitializationStepUpdater stepUpdater}) async {
    if (kIsWeb) {
      stepUpdater('web layer initialization');
      await KindeWeb.initialize(secureStorage: kindeSecureStorage);
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

  /// Logs out the user from the Kinde session.
  ///
  /// For web platforms, this redirects to [logoutRedirectUri].
  /// For mobile/desktop, uses FlutterAppAuth.endSession() with proper redirect handling.
  ///
  /// Parameters:
  /// - [dio] - Optional Dio client for direct HTTP logout fallback (macOS only)
  /// - [macosLogoutWithoutRedirection] - On macOS, use direct HTTP logout without browser redirect (default: true)
  /// - [timeout] - Timeout duration for logout request (default: 30 seconds)
  Future<void> logout({
    Dio? dio,
    bool macosLogoutWithoutRedirection = true,
    Duration timeout = const Duration(seconds: 30),
  }) async {
    if (authState == null) {
      kindeDebugPrint(methodName: 'logout', message: 'No active session');
      return;
    }

    kindeDebugPrint(
      methodName: 'logout',
      message: 'Logout initiated',
      context: {'platform': kIsWeb ? 'web' : Platform.operatingSystem},
    );

    if (kIsWeb) {
      await _handleWebLogout();
    } else {
      await _handleNonWebLogout(
          dio: dio,
          macosLogoutWithoutRedirection: macosLogoutWithoutRedirection,
          timeout: timeout);
    }

    await _commonLogoutCleanup();
    kindeDebugPrint(methodName: 'logout', message: 'Logout completed');
  }

  Future<void> _handleNonWebLogout({
    Dio? dio,
    required bool macosLogoutWithoutRedirection,
    required Duration timeout,
  }) async {
    if (Platform.operatingSystem == "macos" && macosLogoutWithoutRedirection) {
      return _logoutWithoutRedirection(dio: dio);
    }

    try {
      const appAuth = FlutterAppAuth();
      // To prevent "414 Request-URI Too Large" errors caused by appending a massive
      // idToken to the logout URL, we do not pass `idTokenHint` with the `postLogoutRedirectUrl`.
      //
      // We instead pass the `client_id` as part of `additionalParameters`.
      //
      final endSessionRequest = EndSessionRequest(
        externalUserAgent:
            ExternalUserAgent.ephemeralAsWebAuthenticationSession,
        postLogoutRedirectUrl: _config!.logoutRedirectUri,
        serviceConfiguration: _serviceConfiguration,
        additionalParameters: {'client_id': _config!.authClientId},
      );

      await appAuth.endSession(endSessionRequest).timeout(timeout,
          onTimeout: () {
        throw KindeError(
            code: KindeErrorCode.requestTimedOut.code,
            message: 'Logout request timed out');
      });
    } catch (e, st) {
      kindeDebugPrint(methodName: "Logout", message: e.toString());
      throw KindeError.fromError(e, st);
    }
  }

  Future<void> _handleWebLogout() async {
    if (_config?.logoutRedirectUri != null &&
        _config!.logoutRedirectUri.isNotEmpty) {
      KindeWeb.instance.logout(_config!.logoutRedirectUri);
    }
  }

  Future<void> _commonLogoutCleanup() async {
    _clearRefreshTimer();

    _kindeApi.setBearerAuth(_bearerAuth, '');
    await Store.instance.clear();
  }

  /// Logs out the user without redirection using a direct HTTP GET request.
  ///
  /// This method performs a simple logout by calling the logout endpoint
  /// without any additional parameters. It does NOT redirect the user after logout.
  ///
  /// Use this only when:
  /// - Running on macOS with macosLogoutWithoutRedirection=true
  /// - You need to avoid the 414 error and don't need redirect functionality
  ///
  /// Note: This approach does not include the id_token_hint, which may be
  /// required for org-specific logout in multi-organization scenarios.
  Future<void> _logoutWithoutRedirection({Dio? dio}) async {
    try {
      var dioClient = dio ?? Dio();
      final response =
          await dioClient.get(_serviceConfiguration.endSessionEndpoint!);

      await _commonLogoutCleanup();

      if (response.statusCode != null && response.statusCode! >= 400) {
        final errorMessage = response.data is Map
            ? response.data['error_description'] ??
                response.data['error'] ??
                "Unknown error"
            : "Logout failed with status: ${response.statusCode}";
        kindeDebugPrint(
          methodName: '_logoutWithoutRedirection',
          message: 'Logout request failed',
          context: {'statusCode': response.statusCode},
        );
        throw KindeError(
            code: KindeErrorCode.logoutRequestFailed.code, message: errorMessage);
      }
    } catch (error, st) {
      kindeDebugPrint(
        methodName: '_logoutWithoutRedirection',
        message: 'Logout error',
        context: {'error': error.toString()},
      );
      throw KindeError.fromError(error, st);
    }
  }

  /// for web it returns null, and invokes loginRedirectUri
  Future<String?> login({
    AuthFlowType? type,
    AdditionalParameters additionalParams = const AdditionalParameters(),
  }) async {
    kindeDebugPrint(
      methodName: 'login',
      message: 'Login initiated',
      context: {
        'flowType': type?.name ?? 'default',
        'platform': kIsWeb ? 'web' : Platform.operatingSystem,
      },
    );
    final internalAdditionalParams =
        _prepareInternalAdditionalParameters(additionalParams);
    internalAdditionalParams.promptValues =
        additionalParams.invitationCode != null ? ['create'] : ['login'];
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
    internalAdditionalParams.scopes = _config!.scopes;
    internalAdditionalParams.supportsReauth = true;
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
      return _handleOtherLogin(type, internalAdditionalParameters, isRetrying: false,);
    }
    return null;
  }

  /// Handles login for macOS, Android and iOS
  ///
  /// [isRetrying] tracks if we are retrying the authentication flow.
  /// We currently only retry once if the login link has expired.
  ///
  Future<String?> _handleOtherLogin(
    AuthFlowType? type, InternalAdditionalParameters params, {required bool isRetrying,}) async {
    const appAuth = FlutterAppAuth();
    TokenResponse tokenResponse;
    try {
      if (type == AuthFlowType.pkce) {
        final authorizationRequest = _createAuthorizationRequest(params);
        final AuthorizationResponse result =
            await appAuth.authorize(authorizationRequest);
        final tokenRequest = _createTokenRequest(
            authorizationResponse: result,
            scopes: params.scopes,
            additionalParameters: authorizationRequest.additionalParameters);
        tokenResponse = await appAuth.token(tokenRequest);
      } else {
        final authorizationTokenRequest =
            _createAuthorizationTokenRequest(params);
        tokenResponse =
            await appAuth.authorizeAndExchangeCode(authorizationTokenRequest);
      }

      if (params.orgName != null) {
        return params.orgName;
      }

      _saveState(tokenResponse);
      return tokenResponse.accessToken;
    } catch (e, st) {
      final kindeError = KindeError.fromError(e, st);

      // Only retry once if the login link has expired
      // If we're already in a retry, do not retry again.
      if (kindeError is LoginLinkExpiredKindeError && !isRetrying) {
        /// Currently On Android, `reauthState` is null,
        /// but this is fine since have the original `params` object.
        /// See `LoginLinkExpiredKindeError._extractReauthState` for more details.
        final reauthState = kindeError.reauthState;

        params.reauthState = reauthState;

        // Since the app is being reopened from the expired login link,
        // we need to ensure it is in the foreground before attempting to
        // retry the authentication flow.
        final isForeground = await AppLifecycleUtil.ensureAppIsInForeground();

        if (isForeground) {
          return _handleOtherLogin(type, params, isRetrying: true);
        } else {
          kindeDebugPrint(
            methodName: '_handleOtherLogin',
            message:
                'App did not return to foreground in time. Aborting retry.',
          );
        }
      }

      kindeDebugPrint(
        methodName: '_handleOtherLogin',
        message: 'Authentication failed',
        context: {'flowType': type?.name ?? 'default', 'error': e.toString()},
      );
      throw kindeError;
    }
  }

  TokenRequest _createTokenRequest(
          {required AuthorizationResponse authorizationResponse,
          List<String>? scopes,
          Map<String, String>? additionalParameters}) =>
      TokenRequest(
        _config!.authClientId,
        _config!.loginRedirectUri,
        codeVerifier: authorizationResponse.codeVerifier,
        authorizationCode: authorizationResponse.authorizationCode,
        serviceConfiguration: _serviceConfiguration,
        nonce: authorizationResponse.nonce,
        scopes: scopes,
        additionalParameters: additionalParameters,
      );

  AuthorizationRequest _createAuthorizationRequest(
      InternalAdditionalParameters additionalParameters) {
    final authorizationRequestParams =
        additionalParameters.toAuthorizationRequestParams();
    final authorizationRequest = AuthorizationRequest(
        _config!.authClientId, _config!.loginRedirectUri,
        serviceConfiguration: _serviceConfiguration,
        externalUserAgent:
            ExternalUserAgent.ephemeralAsWebAuthenticationSession,
        additionalParameters: authorizationRequestParams,
        scopes: additionalParameters.scopes,
        promptValues: additionalParameters.promptValues);
    return authorizationRequest;
  }

  AuthorizationTokenRequest _createAuthorizationTokenRequest(
      InternalAdditionalParameters additionalParameters) {
    final authorizationRequestParams =
        additionalParameters.toAuthorizationRequestParams();
    final authorizationTokenRequest = AuthorizationTokenRequest(
        _config!.authClientId, _config!.loginRedirectUri,
        serviceConfiguration: _serviceConfiguration,
        externalUserAgent:
            ExternalUserAgent.ephemeralAsWebAuthenticationSession,
        additionalParameters: authorizationRequestParams,
        scopes: additionalParameters.scopes,
        promptValues: additionalParameters.promptValues);
    return authorizationTokenRequest;
  }

  void _handleWebLogin(
    InternalAdditionalParameters params,
  ) {
    WebUtils.setSessionItem(
      _webSavedParamsKey,
      jsonEncode(params.toUserAdditionalParams().toJson()),
    );
    KindeWeb.instance.startLoginFlow(
        AuthorizationRequest(
          _config!.authClientId,
          _config!.loginRedirectUri,
          serviceConfiguration: _serviceConfiguration,
          externalUserAgent:
              ExternalUserAgent.ephemeralAsWebAuthenticationSession,
        ),
        additionalParameters: params);
  }

  Future<bool> _finishWebLogin(String responseUrl) async {
    WebUtils.removeSessionItem(_webSavedParamsKey);
    WebUtils.removeSessionItem(_webAuthRetriedFlag);
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
            "No credentials received - login may have been canceled");
      return false;
    }

    kindeDebugPrint(
      methodName: 'finishWebLogin',
      message: 'Web login completed',
      context: {'expiresAt': credentials.expiration?.toIso8601String()},
    );

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
    kindeDebugPrint(
      methodName: 'register',
      message: 'Registration initiated',
      context: {
        'flowType': type?.name ?? 'default',
        'platform': kIsWeb ? 'web' : Platform.operatingSystem,
      },
    );
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

  Future<void> createOrg({
    required String orgName,
    AuthFlowType? type,
    String? planInterest,
    String? pricingTableKey,
  }) async {
    final params = _prepareInternalAdditionalParameters(AdditionalParameters(
      planInterest: planInterest,
      pricingTableKey: pricingTableKey,
    ));
    params.registrationPage = _registrationPageParamValue;
    params.createOrg = true;
    params.orgName = orgName;

    await _redirectToKinde(type: type, internalAdditionalParameters: params);
  }

  Future<String?> getToken({bool forceRefresh = false}) async {
    /// This is important to ensure we have the latest tokens before performing
    /// checks or refresh operations with the tokens.
    /// This is especially important for apps with concurrent background tasks
    /// using isolates that don't have access to the latest cached state
    await _store.reloadAuthState();

    // Return existing token if authenticated and not forcing refresh
    if (!forceRefresh && await isAuthenticated()) {
      _kindeApi.setBearerAuth(_bearerAuth, _store.authState?.accessToken ?? '');
      return _store.authState?.accessToken;
    }

    // Proceed with token refresh
    kindeDebugPrint(
      methodName: 'getToken',
      message: 'Token refresh initiated',
      context: {
        'trigger': forceRefresh ? 'manual' : 'auto',
        'hasRefreshToken': authState?.refreshToken != null,
      },
    );

    final version = await _getVersion();
    final versionParam = 'Flutter/$version';
    try {
      if (authState?.refreshToken == null) {
        kindeDebugPrint(
          methodName: 'getToken',
          message: 'No refresh token available',
        );
        throw KindeError(code: KindeErrorCode.sessionExpiredOrInvalid.code);
      }
      final data = await _tokenApi.retrieveToken(
          versionParam,
          _store.authState!.createRequestTokenParam()
            ..putIfAbsent(_clientIdParamName, () => _config!.authClientId));
      _store.authState = AuthState.fromJson(data as Map<String, dynamic>);
      _kindeApi.setBearerAuth(_bearerAuth, _store.authState?.accessToken ?? '');

      kindeDebugPrint(
        methodName: 'getToken',
        message: 'Token refresh successful',
        context: {
          'expiresAt': _store.authState?.accessTokenExpirationDateTime
              ?.toIso8601String(),
        },
      );

      return _store.authState?.accessToken;
    } catch (e, st) {
      kindeDebugPrint(
        methodName: 'getToken',
        message: 'Token refresh failed',
        context: {'error': e.toString()},
      );
      throw KindeError.fromError(e, st);
    }
  }

  /// Checks if the user is authenticated with a valid, non-expired token.
  ///
  /// This method performs a simple expiry check on the access token.
  ///
  /// This method does **not** perform any login completion or mutate state.
  ///
  /// Returns `true` if:
  /// - Auth state exists
  /// - Access token exists and is not empty
  /// - Token has not expired
  ///
  /// Returns `false` otherwise.
  ///
  /// ⚠️ **Note:** If your app supports web-based login flows,
  /// make sure to call [completePendingLoginIfNeeded] first
  /// to finalize any in-progress authentication before calling this.
  ///
  /// Example:
  /// ```dart
  /// if (await sdk.isAuthenticated()) {
  ///   // User is authenticated
  /// } else {
  ///   // Redirect to login
  /// }
  /// ```
  Future<bool> isAuthenticated() async {
    final state = authState;
    if (state == null || state.isExpired()) {
      return false;
    }

    final token = state.accessToken;
    if (token == null || token.isEmpty) {
      return false;
    }

    return true;
  }

  /// Attempts to complete a pending web login flow if auth parameters
  /// are present in the current URL.
  ///
  /// This method performs a side-effect and may modify auth state
  /// and secure storage.
  ///
  /// Call this **before** checking authentication status.
  Future<bool> completePendingLoginIfNeeded() async {
    final currentUrl = WebUtils.getCurrentUrl ?? "";
    final currentUri = Uri.tryParse(currentUrl);

    /// Check if this is an expired login link, retrieving the reauth_state
    if (currentUri?.queryParameters case {
      'error': 'login_link_expired',
      'reauth_state': String reauthState,
    }) {
      _handleExpiredWebLogin(reauthState: reauthState);
      /// Returning false because we aren't actually completing the auth process here
      /// We're rather retrying the flow if expired
      return false;
    }

    final finishLoginUri = _isCurrentUrlContainWebAuthParams(currentUrl: currentUrl);
    if (finishLoginUri != null) {
      final storedState = await _kindeSecureStorage.getAuthRequestState();
      if (storedState != null) {
        return _finishWebLogin(finishLoginUri);
      }
    }
    return false;
  }

  void _handleExpiredWebLogin({required String reauthState}) {
    final hasAlreadyRetried =
        WebUtils.getSessionItem(_webAuthRetriedFlag) == 'true';

    // Clear retry flag after retrieval
    WebUtils.removeSessionItem(_webAuthRetriedFlag);

    if (hasAlreadyRetried) {
      const errorMessage =
          "Reauth retry already attempted. Aborting to prevent infinite loop.";
      kindeDebugPrint(
        methodName: "_handleExpiredWebLogin",
        message: errorMessage,
      );
      throw LoginLinkExpiredKindeError(
        message: errorMessage,
        details: {'reauth_state': reauthState},
      );
    }

    kindeDebugPrint(
      methodName: "_handleExpiredWebLogin",
      message: "Login link expired on Web. Retrying login with reauth_state...",
    );
    WebUtils.setSessionItem(_webAuthRetriedFlag, 'true');

    final savedParamsJson = WebUtils.getSessionItem(_webSavedParamsKey);
    final recoveredUserParams =
        savedParamsJson != null && savedParamsJson.isNotEmpty
            ? AdditionalParameters.fromJson(
                jsonDecode(savedParamsJson) as Map<String, dynamic>)
            : const AdditionalParameters();

    final params = _prepareInternalAdditionalParameters(recoveredUserParams);
    params.reauthState = reauthState;

    _handleWebLogin(params);
  }

  ///returns current url if it contain required params for finishing auth flow
  String? _isCurrentUrlContainWebAuthParams({required String currentUrl}) {
    if (kIsWeb && authState == null) {
      if (currentUrl.isEmpty) return null;
      final currentUri = Uri.tryParse(currentUrl);
      if (currentUri == null || !currentUri.hasScheme) return null;
      return (currentUri.queryParameters["code"]?.isNotEmpty ?? false) &&
              (currentUri.queryParameters["state"]?.isNotEmpty ?? false)
          ? currentUrl
          : null;
    }
    return null;
  }

  void _startInvitationLoginIfNeeded() {
    try {
      kindeDebugPrint(
        methodName: "_startInvitationLoginIfNeeded",
        message: "Starting invitation code deep link listener",
      );

      _deepLinkSubscription?.cancel();

      _deepLinkSubscription = DeepLinkUtil().listenForDeepLinks(
        onNewLink: ((newLinkUri) {
          final invitationCode = newLinkUri.queryParameters['invitation_code'];

          if (invitationCode == null || invitationCode.isEmpty) return;

          _handleInvitationCode(invitationCode);
        }),
      );
    } catch (e) {
      kindeDebugPrint(
        methodName: "_startInvitationLoginIfNeeded",
        message: "Failed to setup invitation code deep link listener: ${e.toString()}",
      );
    }
  }

  Future<void> _handleInvitationCode(String invitationCode) async {
    try {
      if (_handlingInvitationCode)  {
        kindeDebugPrint(
          methodName: "_handleInvitationCode",
          message: "Invitation code already being handled. Returning without processing",
        );
        return;
      }

      _handlingInvitationCode = true;

      kindeDebugPrint(
        methodName: "_handleInvitationCode",
        message:
            "Starting invitation login for invitation code",
      );
      await login(
        additionalParams: AdditionalParameters(invitationCode: invitationCode),
      );
    } catch (e) {
      kindeDebugPrint(
        methodName: "_handleInvitationCode",
          message: "Failed to handle invitation code: ${e.toString()}");
    } finally {
      _handlingInvitationCode = false;
    }
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

    kindeDebugPrint(
      methodName: '_saveState',
      message: 'Auth state saved',
      context: {
        'expiresAt': tokenResponse?.accessTokenExpirationDateTime
            ?.toIso8601String(),
        'hasRefreshToken': tokenResponse?.refreshToken != null,
      },
    );

    _scheduleNextRefresh();
  }

  /// Sets a refresh timer with automatic cleanup and safety constraints.
  ///
  /// Timers are always cleared before setting a new one, and durations are
  /// constrained to prevent extremely long or short timers.
  ///
  /// The timer duration is automatically adjusted to be 10 seconds less than
  /// the requested duration (refresh buffer) and capped at 24 hours for safety.
  void _setRefreshTimer(Duration duration, VoidCallback callback) {
    _clearRefreshTimer();

    if (duration.inSeconds <= 0) {
      throw KindeError(
        code: KindeErrorCode.unknown.code,
        message: 'Timer duration must be positive',
      );
    }

    // Apply 10-second buffer and 24-hour cap
    final adjustedDuration = Duration(
      milliseconds: min(
        duration.inMilliseconds - _refreshBufferDuration.inMilliseconds,
        _maxRefreshInterval.inMilliseconds,
      ),
    );

    // Ensure minimum 1 second
    final safeDuration = adjustedDuration.inSeconds < 1
        ? _minRefreshInterval
        : adjustedDuration;

    _refreshTimer = Timer(safeDuration, callback);
  }

  /// Clears the current refresh timer if one exists.
  ///
  /// Safe to call even if no timer is currently active.
  void _clearRefreshTimer() {
    _refreshTimer?.cancel();
    _refreshTimer = null;
  }

  /// Schedules the next background token refresh based on token expiry.
  ///
  /// After every successful token refresh, the next refresh is automatically
  /// scheduled using the JWT 'exp' claim.
  void _scheduleNextRefresh() {
    try {
      // Get expiry from access token's 'exp' claim using public API
      final expClaim = getClaim(claim: 'exp');
      final exp = expClaim.value as int?;

      if (exp == null) {
        // No exp claim, cannot schedule refresh
        return;
      }

      // Calculate seconds until expiry
      final nowSec = DateTime.now().millisecondsSinceEpoch ~/ 1000;
      final secsToExpiry = max(exp - nowSec, 1); // Minimum 1 second

      // Schedule refresh (will fire 10 seconds before actual expiry due to buffer)
      _setRefreshTimer(Duration(seconds: secsToExpiry), () async {
        await _performBackgroundRefresh();
      });
    } catch (e) {
      // If token parsing fails (e.g., in tests with mock tokens), silently skip
      // scheduling. This is safe as the timer simply won't be set.
      kindeDebugPrint(
        methodName: '_scheduleNextRefresh',
        message: 'Could not schedule refresh: $e',
      );
    }
  }

  /// Performs a background token refresh and schedules the next one.
  ///
  /// This method is called by the refresh timer 10 seconds before token expiry.
  /// Forces a token refresh even if the current token is still technically valid,
  /// ensuring seamless token renewal before expiration.
  ///
  /// Uses [forceRefresh] parameter to bypass the isAuthenticated() check,
  /// allowing refresh to occur before the token actually expires.
  Future<void> _performBackgroundRefresh() async {
    try {
      // Force refresh even if token is still valid (that's the point!)
      await getToken(forceRefresh: true);

      // After successful refresh, schedule the next one (recursive pattern)
      _scheduleNextRefresh();
    } catch (e) {
      // If refresh fails, clear timer
      // User will need to re-authenticate manually
      _clearRefreshTimer();
      kindeDebugPrint(
        methodName: '_performBackgroundRefresh',
        message: 'Background refresh failed: $e',
      );
    }
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

  /// Configure Kinde SDK logging.
  ///
  /// [enabled] - Set to false to disable all SDK logging.
  static void configureLogging({required bool enabled}) {
    configureKindeLogging(enabled: enabled);
  }

  /// Returns a link to the self-serve portal for the authenticated user. The user can use this link to manage their account, update their profile, and view their entitlements.
  ///
  /// Throws [KindeError] if the request fails.
  ///
  /// Optional Parameters:
  ///
  /// [subnav] - The area of the portal you want the user to land on
  /// [returnUrl] - The URL to redirect the user to after they have completed their actions in the portal.
  /// [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// [headers] - Can be used to add additional headers to the request
  /// [extra] - Can be used to add flags to the request
  /// [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  Future<String> generatePortalUrl({
    PortalUrlSubnav? subnav,
    String? returnUrl,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final selfServePortalApi = _kindeApi.getSelfServePortalApi();

      final response = await selfServePortalApi.generatePortalUrl(
        subnav: subnav?.value,
        returnUrl: returnUrl,
        cancelToken: cancelToken,
        headers: headers,
        extra: extra,
        validateStatus: validateStatus,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      final portalLink = response.data;

      final portalLinkUrl = portalLink?.url;

      if (portalLinkUrl == null) {
        throw KindeError(
          code: KindeErrorCode.portalLinkUrlIsNull.code,
          message: "Portal link URL is null",
        );
      }

      return portalLinkUrl;
    } catch (e, st) {
      throw KindeError.fromError(e, st);
    }
  }
}

Future<KindeFlutterSDK> initializeKindeFlutterSdkForTest(
    {required String authDomain,
    required String authClientId,
    required String loginRedirectUri,
    required String logoutRedirectUri,
    List<String> scopes = KindeFlutterSDK._defaultScopes,
    String? audience,
    Dio? dio}) async {
  return KindeFlutterSDK._initializeSDK(
      authDomain: authDomain,
      authClientId: authClientId,
      loginRedirectUri: loginRedirectUri,
      logoutRedirectUri: logoutRedirectUri,
      scopes: scopes,
      audience: audience,
      dio: dio);
}
