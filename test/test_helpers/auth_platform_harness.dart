import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/store/store.dart';

import '../mock_channels.dart';
import 'dio_adapter.dart';

class AuthPlatformHarness {
  static final accessToken = _testJwt({
    'exp':
        DateTime.now().add(const Duration(hours: 1)).millisecondsSinceEpoch ~/
        1000,
    'sub': 'test-user',
    'org_code': 'org-test',
    'permissions': ['read:test'],
  });
  static final idToken = _testJwt({
    'sub': 'test-user',
    'given_name': 'Test',
    'family_name': 'Person',
    'email': 'person@example.com',
  });

  static String _testJwt(Map<String, Object> claims) {
    String encode(Map<String, Object> value) =>
        base64UrlEncode(utf8.encode(jsonEncode(value))).replaceAll('=', '');
    return '${encode({'alg': 'HS256'})}.${encode(claims)}.test-signature';
  }

  static const authStateKey = 'kinde_auth_state';
  static const keysKey = 'kinde_keys';
  static const storageChannel = MethodChannel(
    'plugins.it_nomads.com/flutter_secure_storage',
  );
  static const appAuthChannel = MethodChannel(
    'crossingthestreams.io/flutter_appauth',
  );

  final values = <String, String>{keysKey: '{"keys":[]}'};
  final storageCalls = <MethodCall>[];
  final authCalls = <MethodCall>[];
  final unreadableKeys = <String>{};
  final Dio dio = setupDioMock();
  PlatformException? authError;
  Future<void>? endSessionWait;
  late KindeFlutterSDK sdk;

  Map<String, Object?> get tokenResponse => {
    'accessToken': accessToken,
    'refreshToken': 'test-refresh-token',
    'idToken': idToken,
    'accessTokenExpirationTime': DateTime.now()
        .add(const Duration(hours: 1))
        .millisecondsSinceEpoch,
    'scopes': ['openid', 'profile', 'email', 'offline'],
  };

  Future<void> initialize() async {
    mockChannels.setupMockChannel();
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(storageChannel, (call) async {
      storageCalls.add(call);
      final arguments = Map<String, Object?>.from(call.arguments as Map);
      final key = arguments['key'] as String?;
      switch (call.method) {
        case 'read':
          if (unreadableKeys.contains(key)) {
            throw PlatformException(
              code: 'storage_read_failed',
              message: 'Legacy encrypted value cannot be read',
            );
          }
          return values[key];
        case 'write':
          final value = arguments['value'] as String;
          unreadableKeys.remove(key);
          values[key!] = value;
          return null;
        case 'delete':
          unreadableKeys.remove(key);
          values.remove(key);
          return null;
        default:
          throw StateError('Unexpected storage method: ${call.method}');
      }
    });
    messenger.setMockMethodCallHandler(appAuthChannel, (call) async {
      authCalls.add(call);
      if (authError != null) throw authError!;
      switch (call.method) {
        case 'authorize':
          return {
            'authorizationCode': 'test-authorization-code',
            'codeVerifier': 'test-code-verifier',
            'nonce': 'test-nonce',
            'authorizationAdditionalParameters': <String, Object?>{},
          };
        case 'authorizeAndExchangeCode':
        case 'token':
          return tokenResponse;
        case 'endSession':
          await endSessionWait;
          return {'state': null};
        default:
          throw StateError('Unexpected AppAuth method: ${call.method}');
      }
    });
    sdk = await initializeKindeFlutterSdkForTest(
      authDomain: 'authDomain',
      authClientId: 'test-client-id',
      loginRedirectUri: 'com.kinde.test://login',
      logoutRedirectUri: 'com.kinde.test://logout',
      audience: 'test-audience',
      dio: dio,
    );
  }

  Map<String, Object?> arguments(MethodCall call) =>
      Map<String, Object?>.from(call.arguments as Map);

  Map<String, Object?> get savedAuthState =>
      Map<String, Object?>.from(jsonDecode(values[authStateKey]!) as Map);

  Future<void> reloadStore() async {
    await Store.init();
    await Store.instance.loadFromStorage();
  }

  Future<void> close() async {
    authError = null;
    await sdk.logout(macosLogoutWithoutRedirection: false);
    await Store.instance.clear();
    final messenger =
        TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
    messenger.setMockMethodCallHandler(storageChannel, null);
    messenger.setMockMethodCallHandler(appAuthChannel, null);
  }
}
