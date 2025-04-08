import 'dart:async';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:kinde_flutter_sdk/src/utils/helpers.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_secure_storage.dart';
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
  KindeWeb._();

  static KindeWeb? _instance;

  static KindeWeb get instance {
    if (_instance == null) {
      throw Exception("Did you forget to call the initialize() method?");
    }
    return _instance!;
  }

  late final CodeVerifierStorage _codeVerifierStorage;

  static Future<void> initialize({String? appBaseUrl}) async {
    try {
      String? tempAppBaseUrl = appBaseUrl;

      if (urlStrategy?.runtimeType is HashUrlStrategy) {
        tempAppBaseUrl ??= Uri.base.toString().trim();
      } else {
        // Log when using fallback strategy
        if (urlStrategy == null) {
          kindeDebugPrint(methodName: 'KindeWeb.initialize', message: '[Kinde] No urlStrategy detected. Defaulting to path strategy.');
        } else {
          kindeDebugPrint(methodName: 'KindeWeb.initialize', message: '[Kinde] Using custom urlStrategy: ${urlStrategy.runtimeType}');
        }

        tempAppBaseUrl ??= Uri.base.origin;
      }

      // Check validity
      final isBaseUrlValid = isSafeWebUrl(tempAppBaseUrl);
      if (!isBaseUrlValid) {
        throw ArgumentError('Invalid appBaseUrl: must be a valid HTTP/HTTPS URL');
      }

      // Proceed
      _instance = KindeWeb._();
      _instance?._codeVerifierStorage = await CodeVerifierStorage.initialize();

    } catch (e, st) {
      throw KindeError(
        code: KindeErrorCode.initializingFailed,
        message: e.toString(),
        stackTrace: st,
      );
    }
  }


  void logout(String logoutUrl) {
    _clear();
    WebUtils.replacePage(logoutUrl);
  }

  bool _loginInProgress = false;

  ///If multiple logins are triggered in parallel, then flow finished correctly only for
  ///last triggered login, for others after finishing login will be thrown [KindeError] with code=[invalid_grant]
  void startLoginFlow(AuthorizationRequest configuration) {
    if (_loginInProgress) {
      throw const KindeError(code: KindeErrorCode.loginInProcess);
    }
    try {
      _loginInProgress = true;

      final String codeVerifier = generateCodeVerifier();
      _codeVerifierStorage.save(codeVerifier);
      WebOAuthFlow.login(
        configuration,
        codeVerifier: codeVerifier,
      );
    } catch (e) {
      _clear();
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
    _loginInProgress = false;
    final codeVerifier = _codeVerifierStorage.restore();
    if (codeVerifier == null) {
      throw const KindeError(
          code: KindeErrorCode.noCodeVerifier,
          message: "No code verifier in storage.");
    }

    final authRequestState =
        await KindeSecureStorage.instance.getAuthRequestState();
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
      _clear();
      return credentials;
    } catch (e, st) {
      _clear();
      throw KindeError.fromError(e, st);
    }
  }

  void _clear() {
    _loginInProgress = false;
    _codeVerifierStorage.clear();
  }
}
