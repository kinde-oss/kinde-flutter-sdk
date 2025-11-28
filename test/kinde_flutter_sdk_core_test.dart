import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:kinde_flutter_sdk/src/kinde_flutter_sdk.dart';

import 'mock_channels.dart';
import 'test_helpers/jwt_test_helper.dart';
import 'test_helpers/auth_state_fixtures.dart';

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

    test('should throw when getToken called without refresh token', () async {
      expect(
        () => sdk.getToken(forceRefresh: true),
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
  });

  group('KindeFlutterSDK Claims', () {
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

    test('getClaim should return null value when no auth state', () {
      final claim = sdk.getClaim(claim: 'org_code');
      expect(claim.name, 'org_code');
      expect(claim.value, isNull);
    });

    test('getPermissions should return empty when no auth state', () {
      final permissions = sdk.getPermissions();
      expect(permissions.permissions, isEmpty);
    });

    test('getOrganization should return empty when no auth state', () {
      final org = sdk.getOrganization();
      expect(org.orgCode, '');
    });

    test('getUserOrganizations should return empty when no auth state', () {
      final orgs = sdk.getUserOrganizations();
      expect(orgs.orgCodes, isEmpty);
    });

    test('getUserDetails should return null when no auth state', () {
      final userDetails = sdk.getUserDetails();
      expect(userDetails, isNull);
    });
  });

  group('KindeFlutterSDK Feature Flags', () {
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

    test('getFlag should throw when flag not found and no default', () {
      expect(
        () => sdk.getFlag(code: 'missing_flag'),
        throwsA(isA<KindeError>()),
      );
    });

    test('getBooleanFlag should return default when flag not found', () {
      final value = sdk.getBooleanFlag(code: 'missing_flag', defaultValue: true);
      expect(value, true);
    });

    test('getStringFlag should return default when flag not found', () {
      final value = sdk.getStringFlag(code: 'missing_flag', defaultValue: 'default');
      expect(value, 'default');
    });

    test('getIntegerFlag should return default when flag not found', () {
      final value = sdk.getIntegerFlag(code: 'missing_flag', defaultValue: 42);
      expect(value, 42);
    });
  });
}

