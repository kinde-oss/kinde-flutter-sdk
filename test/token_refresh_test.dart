import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/kinde_flutter_sdk.dart';

import 'mock_channels.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const secureStorageChannel =
      MethodChannel('plugins.it_nomads.com/flutter_secure_storage');
  final secureStorage = <String, String>{};

  late Dio dio;
  late DioAdapter adapter;
  var tokenRequests = 0;

  setUpAll(() async {
    mockChannels.setupMockChannel();
    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(secureStorageChannel, (call) async {
      final arguments = call.arguments as Map<Object?, Object?>;
      final key = arguments['key'] as String?;
      switch (call.method) {
        case 'write':
          await Future<void>.delayed(const Duration(milliseconds: 20));
          secureStorage[key!] = arguments['value'] as String;
          return null;
        case 'read':
          return secureStorage[key];
        case 'delete':
          secureStorage.remove(key);
          return null;
        case 'deleteAll':
          secureStorage.clear();
          return null;
        case 'containsKey':
          return secureStorage.containsKey(key);
        case 'readAll':
          return secureStorage;
      }
      return null;
    });

    dio = Dio();
    adapter = DioAdapter(dio: dio)
      ..onGet('/.well-known/jwks.json',
          (server) => server.reply(200, {'keys': []}));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (options.path == '/oauth2/token') tokenRequests++;
      handler.next(options);
    }));

    await initializeKindeFlutterSdkForTest(
        authDomain: 'authDomain',
        authClientId: 'authClientId',
        loginRedirectUri: 'loginRedirectUri',
        logoutRedirectUri: 'logoutRedirectUri',
        dio: dio);
  });

  setUp(() async {
    tokenRequests = 0;
    await KindeFlutterSDK.instance.login();
  });

  void replyToRefresh(int status, Map<String, dynamic> body) => adapter.onPost(
        '/oauth2/token',
        (server) => server.reply(status, body),
        data: Matchers.any,
      );

  test('a token read straight after sign-in sees the new tokens', () async {
    secureStorage.clear();
    await KindeFlutterSDK.instance.login();

    expect(KindeFlutterSDK.instance.authState?.refreshToken, 'refreshToken');
    expect(await KindeFlutterSDK.instance.isAuthenticated(), isFalse);
    replyToRefresh(200, {'access_token': 'newAccessToken', 'expires_in': 3600});

    expect(await KindeFlutterSDK.instance.getToken(), 'newAccessToken');
  });

  test('keeps the refresh token when the response leaves it out', () async {
    replyToRefresh(200, {'access_token': 'newAccessToken', 'expires_in': 3600});

    final token = await KindeFlutterSDK.instance.getToken(forceRefresh: true);

    expect(token, 'newAccessToken');
    expect(KindeFlutterSDK.instance.authState?.refreshToken, 'refreshToken');
  });

  test('takes a rotated refresh token', () async {
    replyToRefresh(200, {
      'access_token': 'newAccessToken',
      'refresh_token': 'rotatedRefreshToken',
      'expires_in': 3600,
    });

    await KindeFlutterSDK.instance.getToken(forceRefresh: true);

    expect(KindeFlutterSDK.instance.authState?.refreshToken,
        'rotatedRefreshToken');
  });

  test('concurrent refreshes send one request', () async {
    replyToRefresh(200, {'access_token': 'newAccessToken', 'expires_in': 3600});

    final tokens = await Future.wait([
      KindeFlutterSDK.instance.getToken(forceRefresh: true),
      KindeFlutterSDK.instance.getToken(forceRefresh: true),
    ]);

    expect(tokens, ['newAccessToken', 'newAccessToken']);
    expect(tokenRequests, 1);
  });

  for (final status in [400, 401]) {
    test('a $status means the refresh token was rejected', () async {
      replyToRefresh(status, {'error': 'invalid_grant'});

      await expectLater(
        KindeFlutterSDK.instance.getToken(forceRefresh: true),
        throwsA(isA<KindeError>().having((error) => error.code, 'code',
            KindeErrorCode.refreshTokenExpired.code)),
      );
    });
  }

  for (final status in [429, 500, 503]) {
    test('a $status does not mean the refresh token was rejected', () async {
      replyToRefresh(status, {'error': 'unavailable'});

      await expectLater(
        KindeFlutterSDK.instance.getToken(forceRefresh: true),
        throwsA(isA<KindeError>().having((error) => error.code, 'code',
            isNot(KindeErrorCode.refreshTokenExpired.code))),
      );
    });
  }
}
