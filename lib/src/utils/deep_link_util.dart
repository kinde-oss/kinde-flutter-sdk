import 'package:app_links/app_links.dart';

class DeepLinkUtil {
  void listenForDeepLinks({required Function(Uri uri) onNewLink}) {
    AppLinks().uriLinkStream.listen((uri) {
      onNewLink(uri);
    });
  }
}
