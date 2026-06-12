import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/additional_params.dart';

void main() {
  group('Invitation Code Feature', () {
    group('Parameter Enum', () {
      test('should have invitationCode parameter with correct value', () {
        expect(Parameter.invitationCode.value, 'invitation_code');
        expect(Parameter.invitationCode.name, 'invitation_code');
      });

      test('should have isInvitation parameter with correct value', () {
        expect(Parameter.isInvitation.value, 'is_invitation');
        expect(Parameter.isInvitation.name, 'is_invitation');
      });
    });

    group('AdditionalParameters', () {
      test('should accept invitationCode in constructor', () {
        const params = AdditionalParameters(
          invitationCode: 'test-invitation-code-123',
        );
        expect(params.invitationCode, 'test-invitation-code-123');
      });

      test('should have null invitationCode when not provided', () {
        const params = AdditionalParameters();
        expect(params.invitationCode, isNull);
      });

      test('should work alongside other parameters', () {
        const params = AdditionalParameters(
          invitationCode: 'invitation-abc',
          orgCode: 'org_123',
          lang: 'en',
          loginHint: 'user@example.com',
        );
        expect(params.invitationCode, 'invitation-abc');
        expect(params.orgCode, 'org_123');
        expect(params.lang, 'en');
        expect(params.loginHint, 'user@example.com');
      });
    });

    group('BaseAdditionalParameters.toWebParams()', () {
      test('should include invitation_code in web params when provided', () {
        const params = AdditionalParameters(
          invitationCode: 'test-code-xyz',
        );
        final webParams = params.toWebParams();

        expect(webParams['invitation_code'], 'test-code-xyz');
      });

      test('should auto-derive is_invitation=true when invitation_code is present', () {
        const params = AdditionalParameters(
          invitationCode: 'test-code-xyz',
        );
        final webParams = params.toWebParams();

        expect(webParams['is_invitation'], 'true');
      });

      test('should not include invitation params when invitationCode is null', () {
        const params = AdditionalParameters();
        final webParams = params.toWebParams();

        expect(webParams.containsKey('invitation_code'), isFalse);
        expect(webParams.containsKey('is_invitation'), isFalse);
      });

      test('should include both invitation params alongside other params', () {
        const params = AdditionalParameters(
          invitationCode: 'invite-123',
          orgCode: 'org_test',
          lang: 'fr',
        );
        final webParams = params.toWebParams();

        expect(webParams['invitation_code'], 'invite-123');
        expect(webParams['is_invitation'], 'true');
        expect(webParams['org_code'], 'org_test');
        expect(webParams['lang'], 'fr');
      });
    });

    group('InternalAdditionalParameters', () {
      test('should accept invitationCode in constructor', () {
        final params = InternalAdditionalParameters(
          invitationCode: 'internal-invite-code',
        );
        expect(params.invitationCode, 'internal-invite-code');
      });

      test('should copy invitationCode from AdditionalParameters via factory', () {
        const userParams = AdditionalParameters(
          invitationCode: 'user-invite-code',
          orgCode: 'org_456',
        );

        final internalParams =
            InternalAdditionalParameters.fromUserAdditionalParams(userParams);

        expect(internalParams.invitationCode, 'user-invite-code');
        expect(internalParams.orgCode, 'org_456');
      });

      test('should include invitation params in toWebParams()', () {
        final params = InternalAdditionalParameters(
          invitationCode: 'internal-code',
          audience: 'https://api.example.com',
        );
        final webParams = params.toWebParams();

        expect(webParams['invitation_code'], 'internal-code');
        expect(webParams['is_invitation'], 'true');
        expect(webParams['audience'], 'https://api.example.com');
      });

      test('should include invitation params in toAuthorizationRequestParams()', () {
        final params = InternalAdditionalParameters(
          invitationCode: 'auth-invite-code',
          promptValues: ['create'],
          scopes: ['openid', 'profile'],
        );
        final authParams = params.toAuthorizationRequestParams();

        // invitation params should be included
        expect(authParams['invitation_code'], 'auth-invite-code');
        expect(authParams['is_invitation'], 'true');
        // scope and prompt should be removed (set via builder)
        expect(authParams.containsKey('scope'), isFalse);
        expect(authParams.containsKey('prompt'), isFalse);
      });
    });

    group('Parameter Serialization', () {
      test('invitation_code uses correct snake_case format', () {
        expect(Parameter.invitationCode.name, 'invitation_code');
      });

      test('is_invitation uses correct snake_case format', () {
        expect(Parameter.isInvitation.name, 'is_invitation');
      });

      test('is_invitation is automatically set when invitationCode is present', () {
        const params = AdditionalParameters(invitationCode: 'any-code');
        final webParams = params.toWebParams();
        expect(webParams['is_invitation'], 'true');
      });

      test('is_invitation is not set when invitationCode is absent', () {
        const paramsWithCode = AdditionalParameters(invitationCode: 'code');
        const paramsWithoutCode = AdditionalParameters();

        expect(paramsWithCode.toWebParams()['is_invitation'], 'true');
        expect(paramsWithoutCode.toWebParams().containsKey('is_invitation'), isFalse);
      });
    });
  });
}

