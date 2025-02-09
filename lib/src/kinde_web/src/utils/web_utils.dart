// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

abstract class WebUtils {
  const WebUtils._();

  static void openPage(String url) => window.location.assign(url);

  static void replacePage(String url) => window.location.replace(url);

  static String? get getOriginUrl => window.location.origin;
}
