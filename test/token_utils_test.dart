import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/token/token_utils.dart';
import 'package:kinde_flutter_sdk/src/token/auth_state.dart';
import 'package:kinde_flutter_sdk/src/model/token_type.dart';
import 'package:kinde_flutter_sdk/src/model/claim/flag.dart';
import 'package:kinde_flutter_sdk/src/error/kinde_error.dart';

import 'test_helpers/jwt_test_helper.dart';
import 'test_helpers/auth_state_fixtures.dart';

/// Test implementation of TokenUtils mixin for isolated testing.
class TestTokenUtils with TokenUtils {
  @override
  AuthState? authState;

  TestTokenUtils({this.authState});

  void setAuthState(AuthState? state) {
    authState = state;
  }
}

void main() {
  late TestTokenUtils tokenUtils;

  setUp(() {
    tokenUtils = TestTokenUtils();
  });

  group('TokenUtils', () {
    group('parseToken', () {
      test('should parse valid JWT and extract claims', () {
        final token = JwtTestHelper.createAccessToken(
          sub: 'user_123',
          orgCode: 'org_456',
        );

        final claims = tokenUtils.parseToken(token);

        expect(claims['sub'], 'user_123');
        expect(claims['org_code'], 'org_456');
      });

      test('should parse token with feature flags', () {
        final token = JwtTestHelper.createAccessTokenWithFlags({
          'is_dark_mode': {'t': 'b', 'v': true},
        });

        final claims = tokenUtils.parseToken(token);

        expect(claims['feature_flags'], isNotNull);
        expect(claims['feature_flags']['is_dark_mode']['v'], true);
      });

      test('should throw on malformed token (no dots)', () {
        // parseToken expects at least 2 parts separated by dots
        // With no dots, parts[1] access throws RangeError
        expect(
          () => tokenUtils.parseToken('invalidtoken'),
          throwsA(isA<RangeError>()),
        );
      });

      test('should throw on token with invalid base64', () {
        expect(
          () => tokenUtils.parseToken('header.!!!invalid!!!.signature'),
          throwsA(anything), // Invalid base64 throws various errors
        );
      });
    });

    group('getClaim', () {
      test('should return claim from access token by default', () {
        tokenUtils.authState = AuthStateFixtures.createWithOrganization('org_test');

        final claim = tokenUtils.getClaim(claim: 'org_code');

        expect(claim.name, 'org_code');
        expect(claim.value, 'org_test');
      });

      test('should return claim from id token when specified', () {
        tokenUtils.authState = AuthStateFixtures.createValid();

        final claim = tokenUtils.getClaim(
          claim: 'email',
          tokenType: TokenType.idToken,
        );

        expect(claim.name, 'email');
        expect(claim.value, JwtTestHelper.testEmail);
      });

      test('should return claim with null value for missing claim', () {
        tokenUtils.authState = AuthStateFixtures.createValid();

        final claim = tokenUtils.getClaim(claim: 'nonexistent_claim');

        expect(claim.name, 'nonexistent_claim');
        expect(claim.value, isNull);
      });

      test('should return claim with null value when auth state is null', () {
        tokenUtils.authState = null;

        final claim = tokenUtils.getClaim(claim: 'org_code');

        expect(claim.value, isNull);
      });

      test('should return list claims correctly', () {
        tokenUtils.authState = AuthStateFixtures.createWithPermissions(
          ['read:users', 'write:users'],
        );

        final claim = tokenUtils.getClaim(claim: 'permissions');

        expect(claim.value, isA<List>());
        expect(claim.value, contains('read:users'));
        expect(claim.value, contains('write:users'));
      });
    });

    group('getUserDetails', () {
      test('should return user details from id token', () {
        tokenUtils.authState = AuthStateFixtures.createValid();

        final userDetails = tokenUtils.getUserDetails();

        expect(userDetails, isNotNull);
        expect(userDetails!.id, JwtTestHelper.testUserId);
        expect(userDetails.email, JwtTestHelper.testEmail);
        expect(userDetails.givenName, JwtTestHelper.testGivenName);
        expect(userDetails.familyName, JwtTestHelper.testFamilyName);
        expect(userDetails.picture, JwtTestHelper.testPicture);
      });

      test('should return null when id token is null', () {
        tokenUtils.authState = AuthStateFixtures.createWithAccessTokenOnly();

        final userDetails = tokenUtils.getUserDetails();

        expect(userDetails, isNull);
      });

      test('should return null when auth state is null', () {
        tokenUtils.authState = null;

        final userDetails = tokenUtils.getUserDetails();

        expect(userDetails, isNull);
      });

      test('should handle user details with all fields populated', () {
        tokenUtils.authState = AuthStateFixtures.createValid();

        final userDetails = tokenUtils.getUserDetails();

        expect(userDetails, isNotNull);
        expect(userDetails!.id, JwtTestHelper.testUserId);
        expect(userDetails.email, JwtTestHelper.testEmail);
        expect(userDetails.givenName, JwtTestHelper.testGivenName);
        expect(userDetails.familyName, JwtTestHelper.testFamilyName);
        expect(userDetails.picture, JwtTestHelper.testPicture);
      });
    });

    group('getPermission', () {
      test('should return permission with isGranted true when permission exists', () {
        tokenUtils.authState = AuthStateFixtures.createWithPermissions(
          ['read:users', 'write:users'],
        );

        final permission = tokenUtils.getPermission('read:users');

        expect(permission.orgCode, JwtTestHelper.testOrgCode);
        expect(permission.isGranted, isTrue);
      });

      test('should return permission with isGranted false when permission missing', () {
        tokenUtils.authState = AuthStateFixtures.createWithPermissions(['read:users']);

        final permission = tokenUtils.getPermission('delete:users');

        expect(permission.orgCode, JwtTestHelper.testOrgCode);
        expect(permission.isGranted, isFalse);
      });

      test('should return false when no permissions in token', () {
        tokenUtils.authState = AuthState(
          accessToken: JwtTestHelper.createAccessTokenWithNoPermissions(),
        );

        final permission = tokenUtils.getPermission('read:users');

        expect(permission.isGranted, isFalse);
      });

      test('should handle null auth state', () {
        tokenUtils.authState = null;

        final permission = tokenUtils.getPermission('read:users');

        expect(permission.isGranted, isFalse);
        expect(permission.orgCode, '');
      });
    });

    group('getPermissions', () {
      test('should return all permissions', () {
        tokenUtils.authState = AuthStateFixtures.createWithPermissions(
          ['read:users', 'write:users', 'delete:users'],
        );

        final permissions = tokenUtils.getPermissions();

        expect(permissions.orgCode, JwtTestHelper.testOrgCode);
        expect(permissions.permissions, hasLength(3));
        expect(permissions.permissions, contains('read:users'));
        expect(permissions.permissions, contains('write:users'));
        expect(permissions.permissions, contains('delete:users'));
      });

      test('should return empty list when no permissions', () {
        tokenUtils.authState = AuthState(
          accessToken: JwtTestHelper.createAccessTokenWithNoPermissions(),
        );

        final permissions = tokenUtils.getPermissions();

        expect(permissions.permissions, isEmpty);
      });

      test('should handle null auth state', () {
        tokenUtils.authState = null;

        final permissions = tokenUtils.getPermissions();

        expect(permissions.permissions, isEmpty);
        expect(permissions.orgCode, '');
      });
    });

    group('getOrganization', () {
      test('should return organization code', () {
        tokenUtils.authState = AuthStateFixtures.createWithOrganization('org_acme');

        final org = tokenUtils.getOrganization();

        expect(org.orgCode, 'org_acme');
      });

      test('should handle null auth state', () {
        tokenUtils.authState = null;

        final org = tokenUtils.getOrganization();

        expect(org.orgCode, '');
      });
    });

    group('getUserOrganizations', () {
      test('should return all organization codes from id token', () {
        tokenUtils.authState = AuthStateFixtures.createValid();

        final orgs = tokenUtils.getUserOrganizations();

        expect(orgs.orgCodes, hasLength(2));
        expect(orgs.orgCodes, contains('org_test123'));
        expect(orgs.orgCodes, contains('org_other456'));
      });

      test('should return empty list when org_codes excluded', () {
        final idToken = JwtTestHelper.createIdToken(excludeOrgCodes: true);
        tokenUtils.authState = AuthState(
          idToken: idToken,
          accessToken: JwtTestHelper.createAccessToken(),
        );

        final orgs = tokenUtils.getUserOrganizations();

        expect(orgs.orgCodes, isEmpty);
      });

      test('should handle null auth state', () {
        tokenUtils.authState = null;

        final orgs = tokenUtils.getUserOrganizations();

        expect(orgs.orgCodes, isEmpty);
      });
    });

    group('getFlag', () {
      test('should return boolean flag', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({
          'is_dark_mode': {'t': 'b', 'v': true},
        });

        final flag = tokenUtils.getFlag(code: 'is_dark_mode');

        expect(flag, isNotNull);
        expect(flag!.code, 'is_dark_mode');
        expect(flag.type, FlagType.bool);
        expect(flag.value, true);
        expect(flag.isDefault, false);
      });

      test('should return string flag', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({
          'theme_color': {'t': 's', 'v': 'blue'},
        });

        final flag = tokenUtils.getFlag(code: 'theme_color');

        expect(flag, isNotNull);
        expect(flag!.code, 'theme_color');
        expect(flag.type, FlagType.string);
        expect(flag.value, 'blue');
      });

      test('should return integer flag', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({
          'max_items': {'t': 'i', 'v': 100},
        });

        final flag = tokenUtils.getFlag(code: 'max_items');

        expect(flag, isNotNull);
        expect(flag!.code, 'max_items');
        expect(flag.type, FlagType.integer);
        expect(flag.value, 100);
      });

      test('should return default value when flag not found', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({});

        final flag = tokenUtils.getFlag(
          code: 'missing_flag',
          defaultValue: 'default',
          type: FlagType.string,
        );

        expect(flag, isNotNull);
        expect(flag!.value, 'default');
        expect(flag.isDefault, true);
      });

      test('should throw when flag not found and no default provided', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({});

        expect(
          () => tokenUtils.getFlag(code: 'missing_flag'),
          throwsA(isA<KindeError>()),
        );
      });

      test('should throw when flag type mismatch', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({
          'is_dark_mode': {'t': 'b', 'v': true}, // Boolean flag
        });

        expect(
          () => tokenUtils.getFlag(
            code: 'is_dark_mode',
            type: FlagType.string, // Requesting as string
          ),
          throwsA(isA<KindeError>()),
        );
      });
    });

    group('getBooleanFlag', () {
      test('should return boolean flag value', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({
          'is_dark_mode': {'t': 'b', 'v': true},
        });

        final value = tokenUtils.getBooleanFlag(code: 'is_dark_mode');

        expect(value, true);
      });

      test('should return false boolean flag', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({
          'is_dark_mode': {'t': 'b', 'v': false},
        });

        final value = tokenUtils.getBooleanFlag(code: 'is_dark_mode');

        expect(value, false);
      });

      test('should return default value when flag not found', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({});

        final value = tokenUtils.getBooleanFlag(
          code: 'missing_flag',
          defaultValue: true,
        );

        expect(value, true);
      });
    });

    group('getStringFlag', () {
      test('should return string flag value', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({
          'theme_color': {'t': 's', 'v': 'blue'},
        });

        final value = tokenUtils.getStringFlag(code: 'theme_color');

        expect(value, 'blue');
      });

      test('should return default value when flag not found', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({});

        final value = tokenUtils.getStringFlag(
          code: 'missing_flag',
          defaultValue: 'red',
        );

        expect(value, 'red');
      });
    });

    group('getIntegerFlag', () {
      test('should return integer flag value', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({
          'max_items': {'t': 'i', 'v': 100},
        });

        final value = tokenUtils.getIntegerFlag(code: 'max_items');

        expect(value, 100);
      });

      test('should return default value when flag not found', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({});

        final value = tokenUtils.getIntegerFlag(
          code: 'missing_flag',
          defaultValue: 50,
        );

        expect(value, 50);
      });

      test('should handle zero as valid value', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({
          'count': {'t': 'i', 'v': 0},
        });

        final value = tokenUtils.getIntegerFlag(code: 'count');

        expect(value, 0);
      });

      test('should handle negative integers', () {
        tokenUtils.authState = AuthStateFixtures.createWithFeatureFlags({
          'offset': {'t': 'i', 'v': -10},
        });

        final value = tokenUtils.getIntegerFlag(code: 'offset');

        expect(value, -10);
      });
    });
  });
}

