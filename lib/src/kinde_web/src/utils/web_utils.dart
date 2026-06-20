import 'package:web/web.dart' as web;

abstract class WebUtils {
  const WebUtils._();

  static void openPage(String url) => web.window.location.assign(url);

  static void replacePage(String url) => web.window.location.replace(url);

  static String? get getCurrentUrl => web.window.location.href;

  static String? get getOriginUrl => web.window.location.origin;

  static String get temporaryDirectory =>
      web.window.localStorage.getItem('temporary_directory') ?? "";
}
