abstract class WebUtils {
  const WebUtils._();

  static void openPage(String url) {}
  static void replacePage(String url) {}

  static String? get getCurrentUrl => null;

  static String? get getOriginUrl => null;

  static String get temporaryDirectory => "";

  static String? getSessionItem(String key) => null;

  static void setSessionItem(String key, String value) {}

  static void removeSessionItem(String key) {}
}
