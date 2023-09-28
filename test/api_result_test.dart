import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for ApiResult
void main() {
  final instance = ApiResultBuilder();
  // TODO add properties to the builder and call build()

  group(ApiResult, () {
    // The result of the api operation.
    // String result
    test('to test the property `result`', () async {
      // TODO
      final result = instance.result;
      expect(result, isNull);
      instance.result = 'result';
      final newResult = instance.build();
      expect(newResult, isA<ApiResult>());
      expect(newResult.result, isNotEmpty);
      expect(newResult.result, contains('result'));
    });
  });
}
