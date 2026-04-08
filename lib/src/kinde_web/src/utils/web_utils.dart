// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

abstract class WebUtils {
  const WebUtils._();

  static void openPage(String url) => window.location.assign(url);

  static void replacePage(String url) => window.location.replace(url);

  static String? get getCurrentUrl => window.location.href;

  static String? get getOriginUrl => window.location.origin;

  static String? getParameterFromUrl(String parameterName) {
    final currentUrl = getCurrentUrl;
    if (currentUrl == null || currentUrl.isEmpty) return null;
    final uri = Uri.tryParse(currentUrl);
    if (uri == null) return null;
    return uri.queryParameters[parameterName];
  }

  static String get temporaryDirectory => window.localStorage['temporary_directory'] ?? "";
}
