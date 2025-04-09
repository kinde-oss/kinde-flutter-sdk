import 'dart:async';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/kinde_secure_storage/kinde_secure_storage_i.dart';
import 'package:kinde_flutter_sdk/src/utils/helpers.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';
import 'package:kinde_flutter_sdk/src/kinde_secure_storage/kinde_secure_storage.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/base/web_oauth_flow.dart';

import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/utils/code_verifier_generator.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/utils/code_verifier_storage.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/utils/cross_platform_support.dart';
import 'package:oauth2/oauth2.dart';

class KindeWeb {
  /// Creates a KindeWeb instance using hash URL strategy.
  ///
  /// [appBaseUrl] is the base URL of the application. If not provided,
  /// it will be extracted from the current URL, removing any hash fragments
  /// and trailing slashes.
  KindeWeb._(this._kindeSecureStorage);

  final KindeSecureStorageInterface _kindeSecureStorage;

  static KindeWeb? _instance;

  static KindeWeb get instance {
    if (_instance == null) {
      throw Exception("Did you forget to call the initialize() method?");
    }
    return _instance!;
  }

  late final CodeVerifierStorage _codeVerifierStorage;

  static Future<void> initialize(
      {String? appBaseUrl, required KindeSecureStorageInterface secureStorage}) async {
    try {
      String? tempAppBaseUrl = appBaseUrl;

      if (urlStrategy?.runtimeType is HashUrlStrategy) {
        tempAppBaseUrl ??= Uri.base.toString().trim();
      } else {
        // Log when using fallback strategy
        if (urlStrategy == null) {
          kindeDebugPrint(
              methodName: 'KindeWeb.initialize',
              message:
                  '[Kinde] No urlStrategy detected. Defaulting to path strategy.');
        } else {
          kindeDebugPrint(
              methodName: 'KindeWeb.initialize',
              message:
                  '[Kinde] Using custom urlStrategy: ${urlStrategy.runtimeType}');
        }

        tempAppBaseUrl ??= Uri.base.origin;
      }

      // Check validity
      final isBaseUrlValid = isSafeWebUrl(tempAppBaseUrl);
      if (!isBaseUrlValid) {
        throw ArgumentError(
            'Invalid appBaseUrl: must be a valid HTTP/HTTPS URL');
      }

      kindeDebugPrint(
          methodName: 'KindeWeb.initialize',
          message: 'Successfully validated base URL: $tempAppBaseUrl');

      // Proceed
      _instance = KindeWeb._(secureStorage);
      _instance?._codeVerifierStorage = await CodeVerifierStorage.initialize();
    } catch (e, st) {
      throw KindeError(
        code: KindeErrorCode.initializingFailed,
        message: e.toString(),
        stackTrace: st,
      );
    }
  }

  Future<void> logout(String logoutUrl) async {
    if (_loginInProgress) {
      throw const KindeError(code: KindeErrorCode.loginInProcess);
    }
    if (!isSafeWebUrl(logoutUrl)) {
      throw const KindeError(
          code: KindeErrorCode.invalidRedirect,
          message: 'Unsafe or untrusted logout URL detected');
    }
    await _clear();
    WebUtils.replacePage(logoutUrl);
  }

  bool _loginInProgress = false;

  ///If multiple logins are triggered in parallel, then flow finished correctly only for
  ///last triggered login, for others after finishing login will be thrown [KindeError] with code=[invalid_grant]
  Future<void> startLoginFlow(AuthorizationRequest configuration) async {
    if (_loginInProgress) {
      throw const KindeError(code: KindeErrorCode.loginInProcess);
    }
    try {
      _loginInProgress = true;

      final String codeVerifier = generateCodeVerifier();
      _codeVerifierStorage.save(codeVerifier);
      final String authState = generateAuthState();
      try {
        await _kindeSecureStorage.saveAuthRequestState(authState);
      } catch (e, st) {
        throw KindeError(
            code: KindeErrorCode.unknown,
            message: e.toString(),
            stackTrace: st);
      }
      WebOAuthFlow.login(configuration,
          codeVerifier: codeVerifier, authState: authState);
    } catch (e) {
      await _clear();
      if (e is KindeError) rethrow;
    }
  }

  Future<Credentials?> finishLoginFlow(
      {required String redirectUrl,
      required String responseUrl,
      required String clientId,
      required String authorizationEndpoint,
      required String tokenEndpoint,
      required List<String> scopes}) async {
    final codeVerifier = _codeVerifierStorage.restore();
    if (codeVerifier == null) {
      throw const KindeError(
          code: KindeErrorCode.noCodeVerifier,
          message: "No code verifier in storage.");
    }

    final authRequestState = await _kindeSecureStorage.getAuthRequestState();
    if (authRequestState == null) {
      throw const KindeError(
          code: KindeErrorCode.noAuthStateStored,
          message: "No auth request state in storage.");
    }

    final authorizationCodeGrant = AuthorizationCodeGrant(
      clientId,
      Uri.parse(authorizationEndpoint),
      Uri.parse(tokenEndpoint),
      codeVerifier: codeVerifier,
      basicAuth: true,
    );

    try {
      final credentials = await WebOAuthFlow.finishLogin(
          authRequestState: authRequestState,
          responseUrl: responseUrl,
          authorizationCodeGrant: authorizationCodeGrant,
          redirectUrl: redirectUrl,
          scopes: scopes);
      await _clear();
      return credentials;
    } catch (e, st) {
      await _clear();
      throw KindeError.fromError(e, st);
    }
  }

  Future<void> _clear() async {
    _loginInProgress = false;
    await _kindeSecureStorage.removeAuthRequestState();
    await _codeVerifierStorage.clear();
  }
}
