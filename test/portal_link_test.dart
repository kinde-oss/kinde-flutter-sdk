import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:test/test.dart';

// tests for PortalLink
void main() {
  final instance = PortalLinkBuilder();
  // TODO add properties to the builder and call build()

  group(PortalLink, () {
    // Unique URL to redirect the user to.
    // String url
    test('to test the property `url`', () async {
      // TODO
      final url = instance.url;
      expect(url, isNull);
      instance.url = 'url';
      final result = instance.build();
      expect(result, isA<PortalLink>());
      expect(result.url, isNotNull);
      expect(result.url, isA<String>());
      expect(result.url, equals('url'));
    });
  });
}
