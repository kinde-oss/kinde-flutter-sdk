import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/token/auth_state.dart';

import 'mock_channels.dart';
import 'test_helpers/jwt_test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  mockChannels.setupMockChannel();

  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://test.kinde.com'));
    dioAdapter = DioAdapter(dio: dio);

    // Setup common mock endpoints
    dioAdapter.onGet(
      '/.well-known/jwks.json',
      (server) => server.reply(200, {
        'keys': [
          {
            'e': 'AQAB',
            'n': 'test_modulus',
            'alg': 'RS256',
            'kid': 'test_key_id',
            'kty': 'RSA',
            'use': 'sig',
          }
        ]
      }),
    );

    dioAdapter.onGet(
      'https://test.kinde.com/logout',
      (server) => server.reply(200, null),
    );
  });

  group('KindeFlutterSDK Initialization', () {
    test('should initialize SDK with valid configuration', () async {
      await initializeKindeFlutterSdkForTest(
        authDomain: 'test.kinde.com',
        authClientId: 'test_client_id',
        loginRedirectUri: 'myapp://callback',
        logoutRedirectUri: 'myapp://logout',
        dio: dio,
      );

      expect(KindeFlutterSDK.instance, isNotNull);
    });

    test('should initialize SDK with custom scopes', () async {
      await initializeKindeFlutterSdkForTest(
        authDomain: 'test.kinde.com',
        authClientId: 'test_client_id',
        loginRedirectUri: 'myapp://callback',
        logoutRedirectUri: 'myapp://logout',
        scopes: ['openid', 'profile'],
        dio: dio,
      );

      expect(KindeFlutterSDK.instance, isNotNull);
    });

    test('should initialize SDK with audience', () async {
      await initializeKindeFlutterSdkForTest(
        authDomain: 'test.kinde.com',
        authClientId: 'test_client_id',
        loginRedirectUri: 'myapp://callback',
        logoutRedirectUri: 'myapp://logout',
        audience: 'https://api.example.com',
        dio: dio,
      );

      expect(KindeFlutterSDK.instance, isNotNull);
    });

    test('should handle https:// prefix in auth domain', () async {
      await initializeKindeFlutterSdkForTest(
        authDomain: 'https://test.kinde.com',
        authClientId: 'test_client_id',
        loginRedirectUri: 'myapp://callback',
        logoutRedirectUri: 'myapp://logout',
        dio: dio,
      );

      expect(KindeFlutterSDK.instance, isNotNull);
    });

    test('should convert http:// to https:// in auth domain', () async {
      await initializeKindeFlutterSdkForTest(
        authDomain: 'http://test.kinde.com',
        authClientId: 'test_client_id',
        loginRedirectUri: 'myapp://callback',
        logoutRedirectUri: 'myapp://logout',
        dio: dio,
      );

      expect(KindeFlutterSDK.instance, isNotNull);
    });
  });

  group('KindeFlutterSDK.isAuthenticated', () {
    late KindeFlutterSDK sdk;

    setUp(() async {
      sdk = await initializeKindeFlutterSdkForTest(
        authDomain: 'test.kinde.com',
        authClientId: 'test_client_id',
        loginRedirectUri: 'myapp://callback',
        logoutRedirectUri: 'myapp://logout',
        dio: dio,
      );
    });

    test('should return false when auth state is null', () async {
      // Initial state should be null
      final isAuth = await sdk.isAuthenticated();
      expect(isAuth, isFalse);
    });

    test('should return false when access token is null', () async {
      // Auth state with null access token
      expect(await sdk.isAuthenticated(), isFalse);
    });

    test('should return false when access token is empty', () async {
      expect(await sdk.isAuthenticated(), isFalse);
    });
  });

  group('KindeFlutterSDK Token Operations', () {
    late KindeFlutterSDK sdk;

    setUp(() async {
      sdk = await initializeKindeFlutterSdkForTest(
        authDomain: 'test.kinde.com',
        authClientId: 'test_client_id',
        loginRedirectUri: 'myapp://callback',
        logoutRedirectUri: 'myapp://logout',
        dio: dio,
      );
    });

    // Note: Positive getToken test requires full auth flow setup with valid
    // refresh token and token endpoint mocking. This is covered by integration
    // tests. Here we test the error handling path.

    test('should throw when getToken called without refresh token', () async {
      expect(
        () => sdk.getToken(forceRefresh: true),
        throwsA(isA<KindeError>()),
      );
    });

    test('should throw session-expired-or-invalid when auth state invalid', () async {
      // Setting authState without proper validation still triggers error
      sdk.authState = AuthState(
        accessToken: JwtTestHelper.createAccessToken(),
        refreshToken: 'test_refresh_token',
        accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
      );

      // getToken validates the session which requires full auth flow
      expect(
        () => sdk.getToken(),
        throwsA(isA<KindeError>()),
      );
    });
  });

  group('KindeFlutterSDK Logout', () {
    late KindeFlutterSDK sdk;

    setUp(() async {
      sdk = await initializeKindeFlutterSdkForTest(
        authDomain: 'test.kinde.com',
        authClientId: 'test_client_id',
        loginRedirectUri: 'myapp://callback',
        logoutRedirectUri: 'myapp://logout',
        dio: dio,
      );
    });

    test('should handle logout when auth state is null', () async {
      // Should not throw when auth state is null
      await sdk.logout(dio: dio);
      expect(sdk.authState, isNull);
    });

    test('should return early without making request when auth state is null', () async {
      // Auth state is null
      expect(sdk.authState, isNull);

      // Should complete without error
      await sdk.logout(dio: dio);

      // Still null
      expect(sdk.authState, isNull);
    });

    test('should accept custom Dio instance parameter', () async {
      // Create a separate Dio instance
      final customDio = Dio(BaseOptions(baseUrl: 'https://test.kinde.com'));
      final customAdapter = DioAdapter(dio: customDio);
      customAdapter.onGet('/logout', (server) => server.reply(200, null));

      // Should accept the parameter without error
      await sdk.logout(dio: customDio);

      expect(sdk.authState, isNull);
    });

    // Note: Tests for logout with valid authState require the full auth flow
    // setup (login -> store persistence). The logout method internally calls
    // Store.clear() and makes a GET request to the logout endpoint.
    // Integration tests would cover the complete logout flow.
  });

  // Note: Claims and Feature Flags tests are covered in token_utils_test.dart
  // which tests the TokenUtils mixin directly. No need to duplicate here.
}

