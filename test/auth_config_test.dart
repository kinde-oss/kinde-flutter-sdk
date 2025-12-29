import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/auth_config.dart';

void main() {
  group('AuthConfig', () {
    group('Constructor', () {
      test('should create AuthConfig with all required parameters', () {
        final config = AuthConfig(
          authDomain: 'test.kinde.com',
          authClientId: 'client_123',
          loginRedirectUri: 'myapp://callback',
          logoutRedirectUri: 'myapp://logout',
          scopes: ['openid', 'profile'],
        );

        expect(config.authDomain, 'test.kinde.com');
        expect(config.authClientId, 'client_123');
        expect(config.loginRedirectUri, 'myapp://callback');
        expect(config.logoutRedirectUri, 'myapp://logout');
        expect(config.scopes, ['openid', 'profile']);
        expect(config.audience, isNull);
      });

      test('should create AuthConfig with optional audience', () {
        final config = AuthConfig(
          authDomain: 'test.kinde.com',
          authClientId: 'client_123',
          loginRedirectUri: 'myapp://callback',
          logoutRedirectUri: 'myapp://logout',
          scopes: ['openid'],
          audience: 'https://api.example.com',
        );

        expect(config.audience, 'https://api.example.com');
      });

      test('should accept empty scopes list', () {
        final config = AuthConfig(
          authDomain: 'test.kinde.com',
          authClientId: 'client_123',
          loginRedirectUri: 'myapp://callback',
          logoutRedirectUri: 'myapp://logout',
          scopes: [],
        );

        expect(config.scopes, isEmpty);
      });
    });

    group('URL Validation', () {
      test('should accept valid http loginRedirectUri', () {
        expect(
          () => AuthConfig(
            authDomain: 'test.kinde.com',
            authClientId: 'client_123',
            loginRedirectUri: 'http://localhost:3000/callback',
            logoutRedirectUri: 'http://localhost:3000/logout',
            scopes: ['openid'],
          ),
          returnsNormally,
        );
      });

      test('should accept valid https loginRedirectUri', () {
        expect(
          () => AuthConfig(
            authDomain: 'test.kinde.com',
            authClientId: 'client_123',
            loginRedirectUri: 'https://myapp.com/callback',
            logoutRedirectUri: 'https://myapp.com/logout',
            scopes: ['openid'],
          ),
          returnsNormally,
        );
      });

      test('should accept custom scheme URIs', () {
        expect(
          () => AuthConfig(
            authDomain: 'test.kinde.com',
            authClientId: 'client_123',
            loginRedirectUri: 'myapp://auth/callback',
            logoutRedirectUri: 'myapp://auth/logout',
            scopes: ['openid'],
          ),
          returnsNormally,
        );
      });

      test('should accept URIs with query parameters', () {
        expect(
          () => AuthConfig(
            authDomain: 'test.kinde.com',
            authClientId: 'client_123',
            loginRedirectUri: 'myapp://callback?source=app',
            logoutRedirectUri: 'myapp://logout?cleared=true',
            scopes: ['openid'],
          ),
          returnsNormally,
        );
      });

      test('should accept URIs with fragments', () {
        expect(
          () => AuthConfig(
            authDomain: 'test.kinde.com',
            authClientId: 'client_123',
            loginRedirectUri: 'myapp://callback#section',
            logoutRedirectUri: 'myapp://logout#done',
            scopes: ['openid'],
          ),
          returnsNormally,
        );
      });

      test('should accept localhost URIs', () {
        expect(
          () => AuthConfig(
            authDomain: 'test.kinde.com',
            authClientId: 'client_123',
            loginRedirectUri: 'http://localhost:8080/callback',
            logoutRedirectUri: 'http://localhost:8080/logout',
            scopes: ['openid'],
          ),
          returnsNormally,
        );
      });

      test('should accept URIs with port numbers', () {
        expect(
          () => AuthConfig(
            authDomain: 'test.kinde.com',
            authClientId: 'client_123',
            loginRedirectUri: 'https://myapp.com:443/callback',
            logoutRedirectUri: 'https://myapp.com:443/logout',
            scopes: ['openid'],
          ),
          returnsNormally,
        );
      });
    });

    group('Default Scopes', () {
      test('should work with standard OAuth scopes', () {
        final config = AuthConfig(
          authDomain: 'test.kinde.com',
          authClientId: 'client_123',
          loginRedirectUri: 'myapp://callback',
          logoutRedirectUri: 'myapp://logout',
          scopes: ['openid', 'profile', 'email', 'offline'],
        );

        expect(config.scopes, contains('openid'));
        expect(config.scopes, contains('profile'));
        expect(config.scopes, contains('email'));
        expect(config.scopes, contains('offline'));
      });

      test('should preserve scope order', () {
        final scopes = ['offline', 'email', 'profile', 'openid'];
        final config = AuthConfig(
          authDomain: 'test.kinde.com',
          authClientId: 'client_123',
          loginRedirectUri: 'myapp://callback',
          logoutRedirectUri: 'myapp://logout',
          scopes: scopes,
        );

        expect(config.scopes, orderedEquals(scopes));
      });

      test('should allow duplicate scopes', () {
        final config = AuthConfig(
          authDomain: 'test.kinde.com',
          authClientId: 'client_123',
          loginRedirectUri: 'myapp://callback',
          logoutRedirectUri: 'myapp://logout',
          scopes: ['openid', 'openid', 'profile'],
        );

        expect(config.scopes, hasLength(3));
      });
    });

    group('Edge Cases', () {
      test('should handle empty authDomain', () {
        expect(
          () => AuthConfig(
            authDomain: '',
            authClientId: 'client_123',
            loginRedirectUri: 'myapp://callback',
            logoutRedirectUri: 'myapp://logout',
            scopes: ['openid'],
          ),
          returnsNormally,
        );
      });

      test('should handle empty authClientId', () {
        expect(
          () => AuthConfig(
            authDomain: 'test.kinde.com',
            authClientId: '',
            loginRedirectUri: 'myapp://callback',
            logoutRedirectUri: 'myapp://logout',
            scopes: ['openid'],
          ),
          returnsNormally,
        );
      });

      test('should handle whitespace in values', () {
        final config = AuthConfig(
          authDomain: '  test.kinde.com  ',
          authClientId: '  client_123  ',
          loginRedirectUri: 'myapp://callback',
          logoutRedirectUri: 'myapp://logout',
          scopes: ['openid'],
        );

        // Values are stored as-is (not trimmed)
        expect(config.authDomain, '  test.kinde.com  ');
        expect(config.authClientId, '  client_123  ');
      });

      test('should handle special characters in clientId', () {
        expect(
          () => AuthConfig(
            authDomain: 'test.kinde.com',
            authClientId: 'client-123_abc.xyz',
            loginRedirectUri: 'myapp://callback',
            logoutRedirectUri: 'myapp://logout',
            scopes: ['openid'],
          ),
          returnsNormally,
        );
      });
    });
  });
}

