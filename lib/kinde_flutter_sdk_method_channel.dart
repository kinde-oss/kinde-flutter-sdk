import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'kinde_flutter_sdk_platform_interface.dart';

/// An implementation of [KindeFlutterSdkPlatform] that uses method channels.
class MethodChannelKindeFlutterSdk extends KindeFlutterSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.kinde.flutter/auth');


  @override
  Future<Map<dynamic, dynamic>?> getRescuedAuthJson() async {
    final result = await methodChannel.invokeMethod<Map<dynamic, dynamic>>(
      'getRescuedAuthJson',
    );
    return result;
  }
}
