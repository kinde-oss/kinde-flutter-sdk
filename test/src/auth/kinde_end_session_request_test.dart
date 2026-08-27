import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/auth/kinde_end_session_request.dart';

void main() {
  group("KindeEndSessionRequest", () {
    group("constructor", () {
      test("does not throw assertion error if both "
          "idTokenHint and postLogoutRedirectUrl are null", () {
        expect(
          () => KindeEndSessionRequest(
            idTokenHint: null,
            postLogoutRedirectUrl: null,
          ),
          isNot(throwsAssertionError),
        );
      });

      test("does not throw assertion error if idTokenHint is non-null but "
          "postLogoutRedirectUrl is null", () {
        expect(
          () => KindeEndSessionRequest(
            idTokenHint: 'idTokenHint',
            postLogoutRedirectUrl: null,
          ),
          isNot(throwsAssertionError),
        );
      });

      test(
        "does not throw assertion error if postLogoutRedirectUrl is non-null but "
        "idTokenHint is null",
        () {
          expect(
            () => KindeEndSessionRequest(
              idTokenHint: null,
              postLogoutRedirectUrl: 'postLogoutRedirectUrl',
            ),
            isNot(throwsAssertionError),
          );
        },
      );

      test("does not throw assertion error if both "
          "idTokenHint and postLogoutRedirectUrl are non-null", () {
        expect(
          () => KindeEndSessionRequest(
            idTokenHint: 'idTokenHint',
            postLogoutRedirectUrl: 'postLogoutRedirectUrl',
          ),
          isNot(throwsAssertionError),
        );
      });
    });

    group("assertConfigurationInfo", () {
      test("throws exception if no configuration "
          "information is provided", () {
        expect(
          () => KindeEndSessionRequest().assertConfigurationInfo(),
          throwsAssertionError,
        );
      });

      test("does not throw exception if issuer is provided", () {
        expect(
          () => KindeEndSessionRequest(
            issuer: 'issuer',
          ).assertConfigurationInfo(),
          isNot(throwsAssertionError),
        );
      });

      test("does not throw exception if discoveryUrl is provided", () {
        expect(
          () => KindeEndSessionRequest(
            discoveryUrl: 'discoveryUrl',
          ).assertConfigurationInfo(),
          isNot(throwsAssertionError),
        );
      });

      test("does not throw exception if serviceConfiguration is provided", () {
        expect(
          () => KindeEndSessionRequest(
            serviceConfiguration: const AuthorizationServiceConfiguration(
              authorizationEndpoint: 'authorizationEndpoint',
              tokenEndpoint: 'tokenEndpoint',
            ),
          ).assertConfigurationInfo(),
          isNot(throwsAssertionError),
        );
      });
    });
  });
}
