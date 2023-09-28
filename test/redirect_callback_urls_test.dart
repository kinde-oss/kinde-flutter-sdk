import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for RedirectCallbackUrls
void main() {
  final instance = RedirectCallbackUrlsBuilder();
  // TODO add properties to the builder and call build()

  group(RedirectCallbackUrls, () {
    // An application's redirect URLs.
    // BuiltList<String> redirectUrls
    test('to test the property `redirectUrls`', () async {
      // TODO
      final redirectUrls = instance.redirectUrls;
      expect(redirectUrls.length, isZero);
      instance.redirectUrls.add('redirectUrl1');
      instance.redirectUrls.add('redirectUrl2');
      final result = instance.build();
      expect(result, isA<RedirectCallbackUrls>());
      expect(result.redirectUrls?.length, equals(2));
      expect(result.redirectUrls, contains('redirectUrl1'));
      expect(result.redirectUrls, contains('redirectUrl2'));
    });
  });
}
