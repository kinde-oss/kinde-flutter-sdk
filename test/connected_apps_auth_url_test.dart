import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for ConnectedAppsAuthUrl
void main() {
  final instance = ConnectedAppsAuthUrlBuilder();
  // TODO add properties to the builder and call build()

  group(ConnectedAppsAuthUrl, () {
    // A URL that is used to authenticate an end-user against a connected app.
    // String url
    test('to test the property `url`', () async {
      // TODO
      final url = instance.url;
      expect(url, isNull);
      instance.url = "url";
      final result = instance.build();
      expect(result, isA<ConnectedAppsAuthUrl>());
      expect(result.url, isNotNull);
      expect(result.url, equals("url"));
    });

    // A unique identifier for the login session.
    // String sessionId
    test('to test the property `sessionId`', () async {
      // TODO
      final sessionId = instance.sessionId;
      expect(sessionId, isNull);
      instance.sessionId = "sessionId";
      final result = instance.build();
      expect(result, isA<ConnectedAppsAuthUrl>());
      expect(result.sessionId, isNotNull);
      expect(result.sessionId, equals("sessionId"));
    });
  });
}
