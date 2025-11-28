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

    // Mock storage for testing - stores data in memory
    final Map<String, String> mockSecureStorage = {};

    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(flutterSecureStorage,
            (MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'read':
          final key = methodCall.arguments['key'] as String?;
          return key != null ? mockSecureStorage[key] : null;
        case 'write':
          final key = methodCall.arguments['key'] as String?;
          final value = methodCall.arguments['value'] as String?;
          if (key != null && value != null) {
            mockSecureStorage[key] = value;
          }
          return null;
        case 'delete':
          final key = methodCall.arguments['key'] as String?;
          if (key != null) {
            mockSecureStorage.remove(key);
          }
          return null;
        case 'deleteAll':
          mockSecureStorage.clear();
          return null;
        case 'containsKey':
          final key = methodCall.arguments['key'] as String?;
          return key != null ? mockSecureStorage.containsKey(key) : false;
        case 'readAll':
          return mockSecureStorage;
        default:
          return null;
      }
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
      return null;


    });
  }
}
