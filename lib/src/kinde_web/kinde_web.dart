import 'dart:async';
import 'dart:math';
import 'dart:ui_web';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/base/base_oauth_flow.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/base/model/oauth_configuration.dart';

import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class KindeWeb {
  KindeWeb._hashUrlStrategy(String? appBaseUrl) {
    String tempAppBaseUrl = appBaseUrl ?? Uri.base.toString().trim();
    final int ignoreStartIndex = tempAppBaseUrl.indexOf('#');
    if (ignoreStartIndex > -1) {
      tempAppBaseUrl = tempAppBaseUrl.substring(0, ignoreStartIndex);
    }
    while (tempAppBaseUrl.endsWith('/')) {
      tempAppBaseUrl = tempAppBaseUrl.substring(0, tempAppBaseUrl.length - 1);
    }
    this.appBaseUrl = tempAppBaseUrl;
  }

  KindeWeb._pathUrlStrategy(String? appBaseUrl) {
    String tempAppBaseUrl = appBaseUrl ?? Uri.base.origin;
    this.appBaseUrl = tempAppBaseUrl;
  }

  static KindeWeb? _instance;

  static KindeWeb get instance {
    if (_instance == null) {
      throw (Exception("Did you forget call initialize() method ?"));
    }
    return _instance!;
  }

  late final SharedPreferences _sharedPreferences;
  late String appBaseUrl;

  static Future<void> initialize({String? appBaseUrl}) async {
    try {
      _instance = urlStrategy?.runtimeType is HashUrlStrategy
          ? KindeWeb._hashUrlStrategy(appBaseUrl)
          : KindeWeb._pathUrlStrategy(appBaseUrl);
      _instance!._sharedPreferences = await SharedPreferences.getInstance();
      debugPrint(
          '------ OAuthWebAuth appBaseUri: ${_instance!.appBaseUrl} ------');
    } catch (e) {
      debugPrint('Error while initializing KindeWeb: $e');
    }
  }

  static void startLoginFlow({
    Key? key,
    required OAuthConfiguration configuration,
  }) {
    final oauthFlow = BaseOAuthFlow()
      ..initOAuth(
        configuration: configuration,
      );
    oauthFlow.onNavigateTo(instance.appBaseUrl);
  }

  /// Clears WebView cookies
  Future<void> clearCookies() async {
    try {
      await CookieManager.instance().deleteAllCookies();
    } catch (e) {
      debugPrint("Error while clearCookies: $e");
    }
  }

  /// Clears WebView cache and cookies
  /// It's recommended to use a context when using this function.
  /// Check docs: https://docs.flutter.dev/release/breaking-changes/window-singleton#migration-guide
  Future<void> clearAll({InAppWebViewController? controller}) async {
    await clearCookies();
  }

  /// Resets the [appBaseUrl] to the origin url to remove any path segments and query parameters in it.
  void resetAppBaseUrl() {
    appBaseUrl = Uri.parse(appBaseUrl).origin;
  }

  /// Clears the last [codeVerifier] saved state.
  /// Only used in web.
  void clearCodeVerifier() {
    _sharedPreferences.remove(_codeVerifierKey);
  }

  /// Saves the state of [codeVerifier].
  /// Only used in web.
  void saveCodeVerifier(String codeVerifier) {
    _sharedPreferences.setString(_codeVerifierKey, codeVerifier);
  }

  /// Restores the state of [codeVerifier].
  /// Only used in web.
  String? restoreCodeVerifier() {
    final code = _sharedPreferences.getString(_codeVerifierKey);
    debugPrint('------ OAuthWebAuth codeVerifier: $code ------');
    return code;
  }

  static const String _codeVerifierKey = 'codeVerifier';

  /// Allowed characters for generating a codeVerifier
  static const String _charset =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';

  /// Randomly generate a 128 character string to be used as the PKCE code verifier.
  /// The codeVerifier must meet requirements specified in [RFC 7636].
  ///
  /// [RFC 7636]: https://tools.ietf.org/html/rfc7636#section-4.1
  String generateCodeVerifier() {
    return List.generate(
        128, (i) => _charset[Random.secure().nextInt(_charset.length)]).join();
  }
}
