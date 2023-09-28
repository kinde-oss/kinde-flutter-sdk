import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for UpdateEnvironementFeatureFlagOverrideRequest
void main() {
  final instance = UpdateEnvironementFeatureFlagOverrideRequestBuilder();
  // TODO add properties to the builder and call build()

  group(UpdateEnvironementFeatureFlagOverrideRequest, () {
    // The flag override value.
    // String value
    test('to test the property `value`', () async {
      // TODO
      final value = instance.value;
      expect(value, isNull);
      instance.value = 'value';
      final result = instance.build();
      expect(result, isA<UpdateEnvironementFeatureFlagOverrideRequest>());
      expect(result.value, isNotNull);
      expect(result.value, equals('value'));
    });
  });
}
