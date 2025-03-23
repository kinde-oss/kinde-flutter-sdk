import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

var tokenResponseMap = {
  'accessToken': 'accessToken',
  'refreshToken': 'refreshToken',
  'accessTokenExpirationTime': DateTime.now().millisecondsSinceEpoch,
  'idToken': 'idToken',
  'scopes': ['openid', 'profile', 'email', 'offline']
};

final mockChannels = MockChannels();

class MockChannels {
  setupMockChannel() {
    const MethodChannel flutterSecureStorage =
    MethodChannel('plugins.it_nomads.com/flutter_secure_storage');

    const MethodChannel flutterAppauth =
    MethodChannel('crossingthestreams.io/flutter_appauth');

    const MethodChannel pathProvider =
    MethodChannel('plugins.flutter.io/path_provider');

    const MethodChannel customTabs =
    MethodChannel('plugins.flutter.droibit.github.io/custom_tabs');

    const MethodChannel sharedPreferences =
    MethodChannel('plugins.flutter.io/shared_preferences');

    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(sharedPreferences, (MethodCall methodCall) async {
      if(methodCall.method == 'getAll') {
        print("hello");
        return null;
      }
      return false;
    });

    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(flutterSecureStorage, (MethodCall methodCall) async {
      if(methodCall.method == 'read') {
        return '';
      }
      return false;
    });

    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(pathProvider, (MethodCall methodCall) async {
      return './';
    });

    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(flutterAppauth, (MethodCall methodCall) async {
      if(methodCall.method == 'authorizeAndExchangeCode') {
        return tokenResponseMap;
      }
      return null;
    });

    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(customTabs, (MethodCall methodCall) async {
      return null;


    });
  }
}
