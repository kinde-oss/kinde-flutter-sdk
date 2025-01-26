// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

abstract class WebUtils {
  const WebUtils._();

  static void loadPage(String url) => window.location.assign(url);

  static String get getOriginUrl => window.location.origin;
}
