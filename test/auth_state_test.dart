import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/token/auth_state.dart';
import 'package:kinde_flutter_sdk/src/model/token_type.dart';

import 'test_helpers/jwt_test_helper.dart';
import 'test_helpers/auth_state_fixtures.dart';

void main() {
  group('AuthState', () {
    group('Constructor', () {
      test('should create AuthState with all parameters', () {
        final expiresAt = DateTime.now().add(const Duration(hours: 1));
        final state = AuthState(
          accessToken: 'access_token',
          refreshToken: 'refresh_token',
          idToken: 'id_token',
          accessTokenExpirationDateTime: expiresAt,
          grantType: 'authorization_code',
          scope: 'openid profile',
        );

        expect(state.accessToken, 'access_token');
        expect(state.refreshToken, 'refresh_token');
        expect(state.idToken, 'id_token');
        expect(state.accessTokenExpirationDateTime, expiresAt);
        expect(state.grantType, 'authorization_code');
        expect(state.scope, 'openid profile');
      });

      test('should default grantType to refresh_token', () {
        const state = AuthState();
        expect(state.grantType, 'refresh_token');
      });

      test('should allow null values for optional fields', () {
        const state = AuthState();
        expect(state.accessToken, isNull);
        expect(state.refreshToken, isNull);
        expect(state.idToken, isNull);
        expect(state.accessTokenExpirationDateTime, isNull);
        expect(state.scope, isNull);
      });
    });

    group('fromJson', () {
      test('should parse valid JSON with expires_in', () {
        final json = AuthStateFixtures.createValidJson(expiresIn: 3600);
        final state = AuthState.fromJson(json);

        expect(state.accessToken, isNotNull);
        expect(state.refreshToken, 'test_refresh_token');
        expect(state.idToken, isNotNull);
        expect(state.grantType, 'refresh_token');
        expect(state.scope, 'openid profile email offline');
        expect(state.accessTokenExpirationDateTime, isNotNull);

        // Expiry should be approximately now + 3600 seconds
        final expectedExpiry = DateTime.now().add(const Duration(seconds: 3600));
        expect(
          state.accessTokenExpirationDateTime!.difference(expectedExpiry).inSeconds.abs(),
          lessThan(5), // Allow 5 second tolerance
        );
      });

      test('should parse JSON with ISO date string', () {
        final expectedExpiry = DateTime.now().add(const Duration(hours: 2));
        final json = AuthStateFixtures.createJsonWithIsoDate(expiresAt: expectedExpiry);
        final state = AuthState.fromJson(json);

        expect(state.accessTokenExpirationDateTime, isNotNull);
        expect(
          state.accessTokenExpirationDateTime!.difference(expectedExpiry).inSeconds.abs(),
          lessThan(1),
        );
      });

      test('should handle missing grant_type by defaulting to refresh_token', () {
        final json = {
          'access_token': 'token',
          'expires_in': 3600,
        };
        final state = AuthState.fromJson(json);
        expect(state.grantType, 'refresh_token');
      });

      test('should handle missing optional fields', () {
        final json = {
          'access_token': 'token',
          'expires_in': 3600,
        };
        final state = AuthState.fromJson(json);

        expect(state.accessToken, 'token');
        expect(state.refreshToken, isNull);
        expect(state.idToken, isNull);
        expect(state.scope, isNull);
      });

      test('should handle zero expires_in', () {
        final json = AuthStateFixtures.createValidJson(expiresIn: 0);
        final state = AuthState.fromJson(json);

        expect(state.accessTokenExpirationDateTime, isNotNull);
        // Should be approximately now
        expect(
          state.accessTokenExpirationDateTime!.difference(DateTime.now()).inSeconds.abs(),
          lessThan(5),
        );
      });

      test('should handle negative expires_in', () {
        final json = AuthStateFixtures.createValidJson(expiresIn: -3600);
        final state = AuthState.fromJson(json);

        expect(state.accessTokenExpirationDateTime, isNotNull);
        // Should be in the past
        expect(state.accessTokenExpirationDateTime!.isBefore(DateTime.now()), isTrue);
      });
    });

    group('toJson', () {
      test('should serialize all fields correctly', () {
        final expiresAt = DateTime(2024, 12, 31, 12, 0, 0);
        final state = AuthState(
          accessToken: 'access_token',
          refreshToken: 'refresh_token',
          idToken: 'id_token',
          accessTokenExpirationDateTime: expiresAt,
          grantType: 'authorization_code',
          scope: 'openid profile',
        );

        final json = state.toJson();

        expect(json['access_token'], 'access_token');
        expect(json['refresh_token'], 'refresh_token');
        expect(json['id_token'], 'id_token');
        expect(json['access_token_expiration_date_time'], expiresAt.toIso8601String());
        expect(json['grant_type'], 'authorization_code');
        expect(json['scope'], 'openid profile');
      });

      test('should serialize null values correctly', () {
        const state = AuthState();
        final json = state.toJson();

        expect(json['access_token'], isNull);
        expect(json['refresh_token'], isNull);
        expect(json['id_token'], isNull);
        expect(json['access_token_expiration_date_time'], isNull);
      });

      test('should round-trip through JSON correctly', () {
        final original = AuthStateFixtures.createValid();
        final json = original.toJson();

        // Convert expires_in format for fromJson compatibility
        final jsonForParsing = Map<String, dynamic>.from(json);

        final restored = AuthState.fromJson(jsonForParsing);

        expect(restored.accessToken, original.accessToken);
        expect(restored.refreshToken, original.refreshToken);
        expect(restored.idToken, original.idToken);
        expect(restored.grantType, original.grantType);
        expect(restored.scope, original.scope);
      });
    });

    group('isExpired', () {
      test('should return false for non-expired token', () {
        final state = AuthStateFixtures.createExpiringIn(const Duration(hours: 1));
        expect(state.isExpired(), isFalse);
      });

      test('should return true for expired token', () {
        final state = AuthStateFixtures.createExpired();
        expect(state.isExpired(), isTrue);
      });

      test('should return false when accessToken is null', () {
        const state = AuthState(
          accessToken: null,
          accessTokenExpirationDateTime: null,
        );
        expect(state.isExpired(), isFalse);
      });

      test('should return false when expiration is null', () {
        const state = AuthState(
          accessToken: 'token',
          accessTokenExpirationDateTime: null,
        );
        expect(state.isExpired(), isFalse);
      });

      test('should return true for token expiring exactly now', () {
        final now = DateTime.now();
        final state = AuthState(
          accessToken: 'token',
          accessTokenExpirationDateTime: now.subtract(const Duration(milliseconds: 1)),
        );
        expect(state.isExpired(), isTrue);
      });

      test('should return false for token expiring 1 second from now', () {
        final state = AuthStateFixtures.createExpiringIn(const Duration(seconds: 1));
        expect(state.isExpired(), isFalse);
      });
    });

    group('getToken', () {
      test('should return accessToken for TokenType.accessToken', () {
        final state = AuthState(
          accessToken: 'my_access_token',
          idToken: 'my_id_token',
        );
        expect(state.getToken(TokenType.accessToken), 'my_access_token');
      });

      test('should return idToken for TokenType.idToken', () {
        final state = AuthState(
          accessToken: 'my_access_token',
          idToken: 'my_id_token',
        );
        expect(state.getToken(TokenType.idToken), 'my_id_token');
      });

      test('should return null when accessToken is null', () {
        const state = AuthState(accessToken: null, idToken: 'id_token');
        expect(state.getToken(TokenType.accessToken), isNull);
      });

      test('should return null when idToken is null', () {
        const state = AuthState(accessToken: 'access_token', idToken: null);
        expect(state.getToken(TokenType.idToken), isNull);
      });
    });

    group('createRequestTokenParam', () {
      test('should create params with all fields', () {
        const state = AuthState(
          refreshToken: 'my_refresh_token',
          grantType: 'refresh_token',
          scope: 'openid profile email',
        );

        final params = state.createRequestTokenParam();

        expect(params['refresh_token'], 'my_refresh_token');
        expect(params['grant_type'], 'refresh_token');
        expect(params['scope'], 'openid profile email');
      });

      test('should exclude null refreshToken', () {
        const state = AuthState(
          refreshToken: null,
          grantType: 'refresh_token',
          scope: 'openid',
        );

        final params = state.createRequestTokenParam();

        expect(params.containsKey('refresh_token'), isFalse);
        expect(params['grant_type'], 'refresh_token');
      });

      test('should exclude null grantType', () {
        const state = AuthState(
          refreshToken: 'token',
          grantType: null,
          scope: 'openid',
        );

        final params = state.createRequestTokenParam();

        expect(params.containsKey('grant_type'), isFalse);
      });

      test('should exclude empty scope', () {
        const state = AuthState(
          refreshToken: 'token',
          grantType: 'refresh_token',
          scope: '',
        );

        final params = state.createRequestTokenParam();

        expect(params.containsKey('scope'), isFalse);
      });

      test('should exclude null scope', () {
        const state = AuthState(
          refreshToken: 'token',
          grantType: 'refresh_token',
          scope: null,
        );

        final params = state.createRequestTokenParam();

        expect(params.containsKey('scope'), isFalse);
      });

      test('should return empty map when all fields are null', () {
        const state = AuthState(
          refreshToken: null,
          grantType: null,
          scope: null,
        );

        final params = state.createRequestTokenParam();

        expect(params, isEmpty);
      });
    });
  });
}

