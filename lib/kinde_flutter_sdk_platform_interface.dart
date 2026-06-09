import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'kinde_flutter_sdk_method_channel.dart';

abstract class KindeFlutterSdkPlatform extends PlatformInterface {
  /// Constructs a KindeFlutterSdkPlatform.
  KindeFlutterSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static KindeFlutterSdkPlatform _instance = MethodChannelKindeFlutterSdk();

  /// The default instance of [KindeFlutterSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelKindeFlutterSdk].
  static KindeFlutterSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KindeFlutterSdkPlatform] when
  /// they register themselves.
  static set instance(KindeFlutterSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<Map<dynamic, dynamic>?> getRescuedAuthJson() {
    throw UnimplementedError('getRescuedAuthJson() has not been implemented.');
  }
}
