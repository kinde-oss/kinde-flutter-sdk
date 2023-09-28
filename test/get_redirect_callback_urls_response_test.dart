import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for GetRedirectCallbackUrlsResponse
void main() {
  final instance = GetRedirectCallbackUrlsResponseBuilder();
  // TODO add properties to the builder and call build()

  group(GetRedirectCallbackUrlsResponse, () {
    // An application's redirect callback URLs.
    // BuiltList<RedirectCallbackUrls> redirectUrls
    test('to test the property `redirectUrls`', () async {
      // TODO
      final redirectUrls = instance.redirectUrls;
      expect(redirectUrls.length, isZero);
      RedirectCallbackUrls redirectCallbackUrls = RedirectCallbackUrls();
      instance.redirectUrls.add(redirectCallbackUrls);
      final result = instance.build();
      expect(result, isA<GetRedirectCallbackUrlsResponse>());
      expect(result.redirectUrls, isA<BuiltList<RedirectCallbackUrls>?>());
    });
  });
}
