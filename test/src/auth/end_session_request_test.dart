import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("EndSessionRequest logout compatibility", () {
    group("constructor", () {
      test("does not throw assertion error if both "
          "idTokenHint and postLogoutRedirectUrl are null", () {
        expect(
          () =>
              EndSessionRequest(idTokenHint: null, postLogoutRedirectUrl: null),
          isNot(throwsAssertionError),
        );
      });

      test("does not throw assertion error if idTokenHint is non-null but "
          "postLogoutRedirectUrl is null", () {
        expect(
          () => EndSessionRequest(
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
            () => EndSessionRequest(
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
          () => EndSessionRequest(
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
          () => EndSessionRequest().assertConfigurationInfo(),
          throwsAssertionError,
        );
      });

      test("does not throw exception if issuer is provided", () {
        expect(
          () => EndSessionRequest(issuer: 'issuer').assertConfigurationInfo(),
          isNot(throwsAssertionError),
        );
      });

      test("does not throw exception if discoveryUrl is provided", () {
        expect(
          () => EndSessionRequest(
            discoveryUrl: 'discoveryUrl',
          ).assertConfigurationInfo(),
          isNot(throwsAssertionError),
        );
      });

      test("does not throw exception if serviceConfiguration is provided", () {
        expect(
          () => EndSessionRequest(
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
