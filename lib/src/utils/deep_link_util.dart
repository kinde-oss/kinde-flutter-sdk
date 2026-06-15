import 'dart:async';
import 'package:app_links/app_links.dart';

class DeepLinkUtil {
  StreamSubscription<Uri> listenForDeepLinks(
      {required Function(Uri uri) onNewLink}) {
    return AppLinks().uriLinkStream.listen((uri) {
      onNewLink(uri);
    });
  }
}

