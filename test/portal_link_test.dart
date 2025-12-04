import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:test/test.dart';

// tests for PortalLink
void main() {
  final instance = PortalLinkBuilder();

  group(PortalLink, () {
    test('to test the property `url`', () async {
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
