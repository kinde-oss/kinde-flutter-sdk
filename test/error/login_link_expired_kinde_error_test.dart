import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/error/kinde_error.dart';

void main() {
  group('LoginLinkExpiredKindeError reauthState', () {
    test('extracts reauthState from iOS NSError debug description string', () {
      final details = {
        'error': 'login_link_expired',
        'error_debug_description':
            'Error Domain=org.openid.appauth.general Code=-61440 "login_link_expired" UserInfo={\n'
            '    NSLocalizedDescription = "login_link_expired";\n'
            '    OIDOAuthErrorResponseErrorKey = \'AuthorizationErrorResponse: { error = "login_link_expired"; "reauth_state" = "sample_ios_reauth_token_123"; }\';\n'
            '}',
      };

      final error = LoginLinkExpiredKindeError(details: details);

      expect(error.reauthState, 'sample_ios_reauth_token_123');
      expect(error.code, KindeErrorCode.loginLinkExpired.code);
    });

    test(
      'extracts reauthState from Android AuthorizationException string',
      () {},
      skip:
          'Skipping as the underlying Android library, AppAuth-Android currently doesn\'t return the reauth_state in the error response',
    );

    test('returns null when reauth_state is not present in details', () {
      const details = {
        'error': 'login_link_expired',
        'error_description': 'Login link has expired',
      };

      final error = LoginLinkExpiredKindeError(details: details);

      expect(error.reauthState, isNull);
    });
  });
}
