import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/keys/keys.dart';
import 'package:kinde_flutter_sdk/src/store/store.dart';
import 'package:kinde_flutter_sdk/src/token/auth_state.dart';

import 'mock_channels.dart';
import 'test_helpers/jwt_test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    // Initialize mock platform channels for secure storage
    mockChannels.setupMockChannel();
  });

  group('Store', () {
    group('Singleton Pattern', () {
      test('should return same instance', () {
        final instance1 = Store.instance;
        final instance2 = Store.instance;

        expect(identical(instance1, instance2), isTrue);
      });
    });

    group('AuthState Management', () {
      test('should cache authState on set', () async {
        // Initialize store for testing
        await Store.init();
        final store = Store.instance;

        final validToken = JwtTestHelper.createAccessToken(
          sub: 'user_123',
        );

        final authState = AuthState(
          accessToken: validToken,
          idToken: validToken,
          refreshToken: 'refresh_token',
          accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
          scope: 'openid profile email',
        );

        store.authState = authState;

        // Reading should return cached value
        expect(store.authState?.accessToken, equals(validToken));
        expect(store.authState?.refreshToken, equals('refresh_token'));
        expect(store.authState?.scope, equals('openid profile email'));
      });

      test('should allow setting authState to null', () async {
        await Store.init();
        final store = Store.instance;

        // Set initial state
        final validToken = JwtTestHelper.createAccessToken();
        store.authState = AuthState(
          accessToken: validToken,
          idToken: validToken,
          refreshToken: 'token',
          accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
        );

        expect(store.authState, isNotNull);

        // Clear
        store.authState = null;
        expect(store.authState, isNull);
      });

      test('should handle authState with all fields', () async {
        await Store.init();
        final store = Store.instance;

        final accessToken = JwtTestHelper.createAccessToken(
          sub: 'user_123',
          permissions: ['read:users'],
          orgCode: 'org_test',
        );
        final idToken = JwtTestHelper.createIdToken(
          sub: 'user_123',
          givenName: 'John',
          familyName: 'Doe',
          email: 'john@example.com',
        );

        final authState = AuthState(
          accessToken: accessToken,
          idToken: idToken,
          refreshToken: 'refresh_token_value',
          accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
          scope: 'openid profile email offline',
        );

        store.authState = authState;

        expect(store.authState?.accessToken, equals(accessToken));
        expect(store.authState?.idToken, equals(idToken));
        expect(store.authState?.refreshToken, equals('refresh_token_value'));
      });

      test('should handle authState with minimal fields', () async {
        await Store.init();
        final store = Store.instance;

        final token = JwtTestHelper.createAccessToken();

        final authState = AuthState(
          accessToken: token,
          idToken: null,
          refreshToken: null,
          accessTokenExpirationDateTime: null,
          scope: null,
        );

        store.authState = authState;

        expect(store.authState?.accessToken, equals(token));
        expect(store.authState?.idToken, isNull);
        expect(store.authState?.refreshToken, isNull);
      });
    });

    group('Keys Management', () {
      test('should cache keys on set', () async {
        await Store.init();
        final store = Store.instance;

        final keys = Keys(
          keys: [
            Key(
              signingAlgorithm: 'RS256',
              exponent: 'AQAB',
              keyId: 'key_id_1',
              keyType: 'RSA',
              modulus: 'mock_n_value',
            ),
          ],
        );

        store.keys = keys;

        expect(store.keys?.keys.length, equals(1));
        expect(store.keys?.keys.first.keyId, equals('key_id_1'));
        expect(store.keys?.keys.first.signingAlgorithm, equals('RS256'));
      });

      test('should allow setting keys to null', () async {
        await Store.init();
        final store = Store.instance;

        store.keys = Keys(keys: [
          Key(
            signingAlgorithm: 'RS256',
            exponent: 'AQAB',
            keyId: 'key1',
            keyType: 'RSA',
            modulus: 'n',
          ),
        ]);
        expect(store.keys, isNotNull);

        store.keys = null;
        expect(store.keys, isNull);
      });

      test('should handle keys with multiple entries', () async {
        await Store.init();
        final store = Store.instance;

        final keys = Keys(
          keys: [
            Key(signingAlgorithm: 'RS256', exponent: 'AQAB', keyId: 'key_1', keyType: 'RSA', modulus: 'n1'),
            Key(signingAlgorithm: 'RS256', exponent: 'AQAB', keyId: 'key_2', keyType: 'RSA', modulus: 'n2'),
            Key(signingAlgorithm: 'RS256', exponent: 'AQAB', keyId: 'key_3', keyType: 'RSA', modulus: 'n3'),
          ],
        );

        store.keys = keys;

        expect(store.keys?.keys.length, equals(3));
        expect(store.keys?.keys.map((k) => k.keyId).toList(),
            equals(['key_1', 'key_2', 'key_3']));
      });
    });

    group('clear()', () {
      test('should clear both authState and keys', () async {
        await Store.init();
        final store = Store.instance;

        // Set up state
        final token = JwtTestHelper.createAccessToken();
        store.authState = AuthState(
          accessToken: token,
          idToken: token,
          refreshToken: 'refresh',
          accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
        );
        store.keys = Keys(keys: [
          Key(signingAlgorithm: 'RS256', exponent: 'AQAB', keyId: 'key1', keyType: 'RSA', modulus: 'n'),
        ]);

        expect(store.authState, isNotNull);
        expect(store.keys, isNotNull);

        // Clear
        await store.clear();

        expect(store.authState, isNull);
        expect(store.keys, isNull);
      });

      test('should handle clear when already empty', () async {
        await Store.init();
        final store = Store.instance;

        // Ensure clean state
        await store.clear();

        // Should not throw
        await store.clear();

        expect(store.authState, isNull);
        expect(store.keys, isNull);
      });
    });

    group('loadFromStorage()', () {
      test('should load cached values', () async {
        await Store.init();
        final store = Store.instance;

        // Set values first
        final token = JwtTestHelper.createAccessToken();
        store.authState = AuthState(
          accessToken: token,
          idToken: token,
          refreshToken: 'refresh',
          accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
        );

        // Load should work without error
        await store.loadFromStorage();

        // Values should still be accessible
        expect(store.authState?.accessToken, isNotNull);
      });
    });

    group('JSON Serialization', () {
      test('should handle AuthState JSON round-trip via cache', () async {
        await Store.init();
        final store = Store.instance;

        final originalToken = JwtTestHelper.createAccessToken(sub: 'user_abc');

        final original = AuthState(
          accessToken: originalToken,
          idToken: originalToken,
          refreshToken: 'original_refresh',
          accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
          scope: 'openid profile',
        );

        // Convert to JSON and back
        final json = original.toJson();
        final restored = AuthState.fromJson(json);

        store.authState = restored;

        expect(store.authState?.accessToken, equals(originalToken));
        expect(store.authState?.refreshToken, equals('original_refresh'));
        expect(store.authState?.scope, equals('openid profile'));
      });

      test('should handle Keys JSON round-trip via cache', () async {
        await Store.init();
        final store = Store.instance;

        final original = Keys(
          keys: [
            Key(
              signingAlgorithm: 'RS256',
              exponent: 'AQAB',
              keyId: 'test_key',
              keyType: 'RSA',
              modulus: 'test_n_value',
            ),
          ],
        );

        // Manually serialize keys to JSON (since Keys.toJson doesn't serialize nested objects)
        final json = {
          'keys': original.keys.map((k) => k.toJson()).toList(),
        };
        final restored = Keys.fromJson(json);

        store.keys = restored;

        expect(store.keys?.keys.length, equals(1));
        expect(store.keys?.keys.first.keyId, equals('test_key'));
      });
    });

    group('Edge Cases', () {
      test('should handle rapid consecutive updates', () async {
        await Store.init();
        final store = Store.instance;

        // Rapidly update state
        for (var i = 0; i < 10; i++) {
          final token = JwtTestHelper.createAccessToken(sub: 'user_$i');
          store.authState = AuthState(
            accessToken: token,
            refreshToken: 'refresh_$i',
            accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
          );
        }

        // Final state should be the last update
        expect(store.authState?.refreshToken, equals('refresh_9'));
      });

      test('should handle special characters in tokens', () async {
        await Store.init();
        final store = Store.instance;

        final tokenWithSpecialClaims = JwtTestHelper.createAccessToken(
          sub: 'user@example.com',
          additionalClaims: {
            'name': 'John Doe',
            'custom': 'value with special chars',
          },
        );

        store.authState = AuthState(
          accessToken: tokenWithSpecialClaims,
          idToken: tokenWithSpecialClaims,
          refreshToken: 'refresh_with_special',
          accessTokenExpirationDateTime: DateTime.now().add(const Duration(hours: 1)),
        );

        expect(store.authState?.accessToken, equals(tokenWithSpecialClaims));
        expect(store.authState?.refreshToken, equals('refresh_with_special'));
      });

      test('should handle empty strings', () async {
        await Store.init();
        final store = Store.instance;

        store.authState = AuthState(
          accessToken: '',
          idToken: '',
          refreshToken: '',
          accessTokenExpirationDateTime: null,
          scope: '',
        );

        expect(store.authState?.accessToken, equals(''));
        expect(store.authState?.scope, equals(''));
      });
    });
  });
}
