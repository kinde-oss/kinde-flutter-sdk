// ignore_for_file: avoid_web_libraries_in_flutter
import 'package:flutter/foundation.dart';
import 'package:web/web.dart' as web;

abstract class WebUtils {
  const WebUtils._();

  static void openPage(String url) {
    if (kIsWeb) {
      web.window.location.assign(url);
    }
  }

  static void replacePage(String url) {
    if (kIsWeb) {
      web.window.location.replace(url);
    }
  }

  static String? get getCurrentUrl {
    if (kIsWeb) {
      return web.window.location.href;
    }
    return null;
  }

  static String? get getOriginUrl {
    if (kIsWeb) {
      return web.window.location.origin;
    }
    return null;
  }

  static String get temporaryDirectory {
    if (kIsWeb) {
      return web.window.localStorage.getItem('temporary_directory') ?? "";
    }
    return "";
  }
}
