import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/additional_params.dart';

void main() {
  group('Parameter enum', () {
    test('should have correct string values', () {
      expect(Parameter.scope.value, 'scope');
      expect(Parameter.prompt.value, 'prompt');
      expect(Parameter.orgCode.value, 'org_code');
      expect(Parameter.lang.value, 'lang');
      expect(Parameter.connectionId.value, 'connection_id');
      expect(Parameter.loginHint.value, 'login_hint');
      expect(Parameter.audience.value, 'audience');
      expect(Parameter.state.value, 'state');
      expect(Parameter.startPage.value, 'start_page');
      expect(Parameter.isCreateOrg.value, 'is_create_org');
      expect(Parameter.orgName.value, 'org_name');
      expect(Parameter.planInterest.value, 'plan_interest');
      expect(Parameter.pricingTableKey.value, 'pricing_table_key');
    });

    test('name getter should return value', () {
      for (final param in Parameter.values) {
        expect(param.name, equals(param.value));
      }
    });
  });

  group('AdditionalParameters', () {
    group('Constructor', () {
      test('should create with all null by default', () {
        const params = AdditionalParameters();

        expect(params.orgCode, isNull);
        expect(params.loginHint, isNull);
        expect(params.lang, isNull);
        expect(params.connectionId, isNull);
        expect(params.planInterest, isNull);
        expect(params.pricingTableKey, isNull);
      });

      test('should create with all parameters', () {
        const params = AdditionalParameters(
          orgCode: 'org_123',
          loginHint: 'user@example.com',
          lang: 'en',
          connectionId: 'conn_abc',
          planInterest: 'pro',
          pricingTableKey: 'pricing_standard',
        );

        expect(params.orgCode, 'org_123');
        expect(params.loginHint, 'user@example.com');
        expect(params.lang, 'en');
        expect(params.connectionId, 'conn_abc');
        expect(params.planInterest, 'pro');
        expect(params.pricingTableKey, 'pricing_standard');
      });
    });

    group('toWebParams', () {
      test('should return empty map when all null', () {
        const params = AdditionalParameters();
        final webParams = params.toWebParams();

        expect(webParams, isEmpty);
      });

      test('should include only non-null parameters', () {
        const params = AdditionalParameters(
          orgCode: 'org_123',
          lang: 'en',
        );
        final webParams = params.toWebParams();

        expect(webParams, hasLength(2));
        expect(webParams['org_code'], 'org_123');
        expect(webParams['lang'], 'en');
        expect(webParams.containsKey('login_hint'), isFalse);
      });

      test('should include all parameters when set', () {
        const params = AdditionalParameters(
          orgCode: 'org_123',
          loginHint: 'user@example.com',
          lang: 'en',
          connectionId: 'conn_abc',
          planInterest: 'pro',
          pricingTableKey: 'pricing_standard',
        );
        final webParams = params.toWebParams();

        expect(webParams, hasLength(6));
        expect(webParams['org_code'], 'org_123');
        expect(webParams['login_hint'], 'user@example.com');
        expect(webParams['lang'], 'en');
        expect(webParams['connection_id'], 'conn_abc');
        expect(webParams['plan_interest'], 'pro');
        expect(webParams['pricing_table_key'], 'pricing_standard');
      });
    });
  });

  group('InternalAdditionalParameters', () {
    group('fromUserAdditionalParams factory', () {
      test('should copy all fields from AdditionalParameters', () {
        const userParams = AdditionalParameters(
          orgCode: 'org_123',
          loginHint: 'user@example.com',
          lang: 'en',
          connectionId: 'conn_abc',
          planInterest: 'pro',
          pricingTableKey: 'pricing_standard',
        );

        final internalParams =
            InternalAdditionalParameters.fromUserAdditionalParams(userParams);

        expect(internalParams.orgCode, 'org_123');
        expect(internalParams.loginHint, 'user@example.com');
        expect(internalParams.lang, 'en');
        expect(internalParams.connectionId, 'conn_abc');
        expect(internalParams.planInterest, 'pro');
        expect(internalParams.pricingTableKey, 'pricing_standard');
      });

      test('should have null internal fields initially', () {
        const userParams = AdditionalParameters();
        final internalParams =
            InternalAdditionalParameters.fromUserAdditionalParams(userParams);

        expect(internalParams.audience, isNull);
        expect(internalParams.promptValues, isNull);
        expect(internalParams.scopes, isNull);
        expect(internalParams.state, isNull);
        expect(internalParams.registrationPage, isNull);
        expect(internalParams.createOrg, isNull);
        expect(internalParams.orgName, isNull);
      });
    });

    group('Constructor', () {
      test('should create with all parameters', () {
        final params = InternalAdditionalParameters(
          audience: 'https://api.example.com',
          promptValues: ['login', 'consent'],
          scopes: ['openid', 'profile'],
          state: 'abc123',
          registrationPage: 'registration',
          createOrg: true,
          orgName: 'My Org',
          orgCode: 'org_123',
          lang: 'en',
        );

        expect(params.audience, 'https://api.example.com');
        expect(params.promptValues, ['login', 'consent']);
        expect(params.scopes, ['openid', 'profile']);
        expect(params.state, 'abc123');
        expect(params.registrationPage, 'registration');
        expect(params.createOrg, true);
        expect(params.orgName, 'My Org');
        expect(params.orgCode, 'org_123');
        expect(params.lang, 'en');
      });
    });

    group('toWebParams', () {
      test('should include internal parameters', () {
        final params = InternalAdditionalParameters(
          audience: 'https://api.example.com',
          promptValues: ['login'],
          scopes: ['openid', 'profile'],
          state: 'abc123',
          registrationPage: 'registration',
          createOrg: true,
          orgName: 'My Org',
        );

        final webParams = params.toWebParams();

        expect(webParams['audience'], 'https://api.example.com');
        expect(webParams['prompt'], 'login');
        expect(webParams['scope'], 'openid profile');
        expect(webParams['state'], 'abc123');
        expect(webParams['start_page'], 'registration');
        expect(webParams['is_create_org'], 'true');
        expect(webParams['org_name'], 'My Org');
      });

      test('should join multiple prompt values with space', () {
        final params = InternalAdditionalParameters(
          promptValues: ['login', 'consent'],
        );

        final webParams = params.toWebParams();

        expect(webParams['prompt'], 'login consent');
      });

      test('should join multiple scopes with space', () {
        final params = InternalAdditionalParameters(
          scopes: ['openid', 'profile', 'email'],
        );

        final webParams = params.toWebParams();

        expect(webParams['scope'], 'openid profile email');
      });

      test('should include base class parameters', () {
        final params = InternalAdditionalParameters(
          orgCode: 'org_123',
          loginHint: 'user@example.com',
          lang: 'en',
        );

        final webParams = params.toWebParams();

        expect(webParams['org_code'], 'org_123');
        expect(webParams['login_hint'], 'user@example.com');
        expect(webParams['lang'], 'en');
      });
    });

    group('toAuthorizationRequestParams', () {
      test('should exclude scope and prompt', () {
        final params = InternalAdditionalParameters(
          scopes: ['openid', 'profile'],
          promptValues: ['login'],
          audience: 'https://api.example.com',
          orgCode: 'org_123',
        );

        final authParams = params.toAuthorizationRequestParams();

        expect(authParams.containsKey('scope'), isFalse);
        expect(authParams.containsKey('prompt'), isFalse);
        expect(authParams['audience'], 'https://api.example.com');
        expect(authParams['org_code'], 'org_123');
      });

      test('should include all other parameters', () {
        final params = InternalAdditionalParameters(
          scopes: ['openid'],
          promptValues: ['login'],
          state: 'abc123',
          registrationPage: 'registration',
          createOrg: true,
          orgName: 'My Org',
        );

        final authParams = params.toAuthorizationRequestParams();

        expect(authParams['state'], 'abc123');
        expect(authParams['start_page'], 'registration');
        expect(authParams['is_create_org'], 'true');
        expect(authParams['org_name'], 'My Org');
      });
    });

    group('Mutable fields', () {
      test('should allow modifying internal fields', () {
        final params = InternalAdditionalParameters();

        params.audience = 'https://api.example.com';
        params.promptValues = ['login'];
        params.scopes = ['openid'];
        params.state = 'abc123';
        params.registrationPage = 'registration';
        params.createOrg = true;
        params.orgName = 'My Org';

        expect(params.audience, 'https://api.example.com');
        expect(params.promptValues, ['login']);
        expect(params.scopes, ['openid']);
        expect(params.state, 'abc123');
        expect(params.registrationPage, 'registration');
        expect(params.createOrg, true);
        expect(params.orgName, 'My Org');
      });
    });
  });
}

