import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

var tokenResponseMap = {
  'accessToken': 'accessToken',
  'refreshToken': 'refreshToken',
  'accessTokenExpirationTime': DateTime.now().millisecondsSinceEpoch,
  'idToken': 'idToken',
  'scopes': ['openid', 'profile', 'email', 'offline']
};

var authorizeResponse = {
  'authorizationCode': 'authorizationCode',
  'codeVerifier': 'codeVerifier',
  'nonce': null,
  'authorizationAdditionalParameters': {},
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

    const MethodChannel sharedPreferences =
        MethodChannel('plugins.flutter.io/shared_preferences');

    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(sharedPreferences,
            (MethodCall methodCall) async {
      if (methodCall.method == 'getAll') {
        return null;
      }
      return false;
    });

    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(flutterSecureStorage,
            (MethodCall methodCall) async {
      if (methodCall.method == 'read') {
        return null;
      }
      return false;
    });

    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathProvider, (MethodCall methodCall) async {
      return './';
    });

    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(flutterAppauth,
            (MethodCall methodCall) async {
      if (methodCall.method == 'authorizeAndExchangeCode' ||
          methodCall.method == 'token') {
        return tokenResponseMap;
      }
      if (methodCall.method == 'authorize') {
        return authorizeResponse;
      }
      if (methodCall.method == 'endSession') {
        return {};
      }
      return null;
    });
  }
}
