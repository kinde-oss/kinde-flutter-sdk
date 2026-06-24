import 'package:web/web.dart';

abstract class WebUtils {
  const WebUtils._();

  static void openPage(String url) => window.location.assign(url);

  static void replacePage(String url) => window.location.replace(url);

  static String? get getCurrentUrl => window.location.href;

  static String? get getOriginUrl => window.location.origin;

  static String get temporaryDirectory =>
      window.localStorage.getItem('temporary_directory') ?? "";
}
