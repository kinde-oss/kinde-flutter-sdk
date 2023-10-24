import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for ReplaceRedirectCallbackURLsRequest
void main() {
  final instance = ReplaceRedirectCallbackURLsRequestBuilder();
  // TODO add properties to the builder and call build()

  group(ReplaceRedirectCallbackURLsRequest, () {
    // Array of callback urls.
    // BuiltList<String> urls
    test('to test the property `urls`', () async {
      // TODO
      final urls = instance.urls;
      expect(urls, isA<ListBuilder<String>>());
      expect(urls.length, isZero);
      instance.urls.add('url1');
      instance.urls.add('url2');
      final result = instance.build();
      expect(result, isA<ReplaceRedirectCallbackURLsRequest>());
      expect(result.urls, isA<BuiltList<String>>());
      expect(result.urls?.length, equals(2));
      expect(result.urls, contains('url1'));
      expect(result.urls, contains('url2'));
    });
  });
}
