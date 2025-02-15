import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/base/web_oauth_flow.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/base/model/oauth_configuration.dart';

import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/utils/code_verifier_generator.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/utils/code_verifier_storage.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/src/utils/cross_platform_support.dart';
import 'package:oauth2/oauth2.dart';

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

  late final CodeVerifierStorage _codeVerifierStorage;
  late String appBaseUrl;

  static Future<void> initialize({String? appBaseUrl}) async {
    try {
      _instance = urlStrategy?.runtimeType is HashUrlStrategy
          ? KindeWeb._hashUrlStrategy(appBaseUrl)
          : KindeWeb._pathUrlStrategy(appBaseUrl);
      _instance?._codeVerifierStorage = await CodeVerifierStorage.initialize();
    } catch (e) {
      debugPrint('Error while initializing KindeWeb: $e');
    }
  }

  void logout(String? logoutUrl) {
    _clear();
    WebUtils.replacePage(logoutUrl ?? appBaseUrl);
  }

  void startLoginFlow({
    required OAuthConfiguration configuration,
  }) {
    try {
      final String codeVerifier = generateCodeVerifier();
      _codeVerifierStorage.save(codeVerifier);
      WebOAuthFlow.login(
        configuration,
        codeVerifier: codeVerifier,
      );
    } catch (e) {
      debugPrint("Debug:: startLoginFlow():\nerror: $e");
      _clear();
    }
  }

  Future<Credentials?> finishLoginFlow(OAuthConfiguration configuration) async {
    final codeVerifier = _codeVerifierStorage.restore();
    if(codeVerifier == null) {
      throw Exception("CodeVerifier is null");
    }
    try {
      final credentials = await WebOAuthFlow.finishLogin(
          codeVerifier: codeVerifier,
          configuration: configuration,
          responseRedirect: WebUtils.getCurrentUrl!);
      _resetAppBaseUrl();
      _clear();
      return credentials;
    } catch (e) {
      _clear();
      debugPrint("Debug:: finishLoginFlow():\nerror: $e");
      return null;
    }
  }

  void _clear() {
    _codeVerifierStorage.clear();
    _resetAppBaseUrl();
  }

  /// Resets the [appBaseUrl] to the origin url to remove any path segments and query parameters in it.
  void _resetAppBaseUrl() {
    appBaseUrl = Uri.parse(appBaseUrl).origin;
  }
}


