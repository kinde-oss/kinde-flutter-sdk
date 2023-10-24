import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for ConnectedAppsAccessToken
void main() {
  final instance = ConnectedAppsAccessTokenBuilder();
  // TODO add properties to the builder and call build()

  group(ConnectedAppsAccessToken, () {
    // The access token to access a third-party provider.
    // String accessToken
    test('to test the property `accessToken`', () async {
      // TODO
      final accessToken = instance.accessToken;
      expect(accessToken, isNull);
      instance.accessToken = 'accessToken';
      final result = instance.build();
      expect(result, isA<ConnectedAppsAccessToken>());
      expect(result.accessToken, isNotEmpty);
      expect(result.accessToken, 'accessToken');
    });

    // The date and time that the access token expires.
    // String accessTokenExpiry
    test('to test the property `accessTokenExpiry`', () async {
      // TODO
      final accessTokenExpiry = instance.accessTokenExpiry;
      expect(accessTokenExpiry, isNull);
      instance.accessTokenExpiry = 'accessTokenExpiry';
      final result = instance.build();
      expect(result, isA<ConnectedAppsAccessToken>());
      expect(result.accessTokenExpiry, isNotNull);
      expect(result.accessTokenExpiry, 'accessTokenExpiry');
    });
  });
}
