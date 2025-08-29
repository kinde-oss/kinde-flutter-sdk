import 'package:flutter/services.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;
import 'package:flutter/foundation.dart';

class KindeFlutterWebSDK {
  static void registerWith(Registrar registrar) {
    KindeFlutterWebSDK instance = KindeFlutterWebSDK();
    instance.onAttachedToEngine(registrar);
  }

  void onAttachedToEngine(Registrar registrar) {
    final MethodChannel methodChannel = MethodChannel(
      'kinde_flutter_sdk',
      const StandardMethodCodec(),
      registrar.messenger,
    );

    methodChannel.setMethodCallHandler((MethodCall call) async {
      // Handle method calls from Dart
      switch (call.method) {
        case 'getPlatformVersion':
          if (kIsWeb) {
            String userAgent = web.window.navigator.userAgent;
            return 'Web $userAgent';
          }
          return 'Unknown Platform';
        default:
          throw PlatformException(
            code: 'Unimplemented',
            details: 'Method not implemented on the web',
          );
      }
    });
  }
}
