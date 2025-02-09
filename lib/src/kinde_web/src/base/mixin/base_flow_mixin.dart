import 'package:flutter/foundation.dart';
import 'package:kinde_flutter_sdk/src/kinde_web/kinde_web.dart';

import '../../utils/cross_platform_support.dart';


mixin BaseFlowMixin {
  /// This function will be called when any of the redirectUrls is loaded in web view.
  /// It will pass the url it causes redirect.
  ValueChanged<String>? _onSuccessRedirect;

  /// This function will be called if any error occurs.
  /// It will receive the error data which could be some Exception or Error
  ValueChanged<dynamic>? _onError;

  /// This function will be called when user cancels authentication.
  VoidCallback? _onCancel;

  Uri initialUri = Uri();
  final Set<String> redirectUrls = {};

  void init({
    Uri? initialUri,
    Iterable<String>? redirectUrls,
    ValueChanged<String>? onSuccessRedirect,
    ValueChanged<dynamic>? onError,
    VoidCallback? onCancel,
  }) {
    if (initialUri != null) this.initialUri = initialUri;
    if (redirectUrls != null) {
      this.redirectUrls.clear();
      this.redirectUrls.addAll(redirectUrls);
    }
    if(WebUtils.getOriginUrl != null) {
      this.redirectUrls.add(WebUtils.getOriginUrl!);
    }
    _onSuccessRedirect = onSuccessRedirect;
    _onError = onError;
    _onCancel = onCancel;
  }

  void showLoading() {}

  Future<void> hideLoading() async {}

  bool startsWithAnyRedirectUrl(String url) => redirectUrls
      .any((redirectUrl) => url != redirectUrl && url.startsWith(redirectUrl));

  bool onNavigateTo(String url) {
    if (url != 'about:blank') showLoading();
    if (startsWithAnyRedirectUrl(url)) {
      print("DEBug:: success onNavigateTo(url: $url)");
      onSuccess(url);
      return false;
    }
    print("DEBug:: initial onNavigateTo(url: ${initialUri.toString()})");
    saveState();
    WebUtils.openPage(initialUri.toString());
    return true;
  }

  void onSuccess(String responseRedirect) async {
    clearState();
    _onSuccessRedirect?.call(responseRedirect);
  }

  void onError(dynamic error) {
    clearState();
    _onError?.call(error);
  }

  void onCancel() {
    clearState();
    _onCancel?.call();
  }

  void saveState() {}
  void clearState() {
      KindeWeb.instance.resetAppBaseUrl();
      KindeWeb.instance.clearCodeVerifier();
  }
}
