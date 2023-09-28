import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for GetOrganizationFeatureFlagsResponse
void main() {
  final instance = GetOrganizationFeatureFlagsResponseBuilder();
  // TODO add properties to the builder and call build()

  group(GetOrganizationFeatureFlagsResponse, () {
    // Response code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = "code";
      final result = instance.build();
      expect(result.code, isA<String>());
      expect(result.code, isNotNull);
    });

    // Response message.
    // String message
    test('to test the property `message`', () async {
      // TODO
      final message = instance.message;
      expect(message, isNull);
      instance.message = "message";
      final result = instance.build();
      expect(result.message, isA<String>());
      expect(result.message, isNotNull);
    });

    // The environment's feature flag settings.
    // BuiltMap<String, GetOrganizationFeatureFlagsResponseFeatureFlagsValue> featureFlags
    test('to test the property `featureFlags`', () async {
      // TODO
      final featureFlags = instance.featureFlags;
      expect(
          featureFlags,
          isA<
              MapBuilder<String,
                  GetOrganizationFeatureFlagsResponseFeatureFlagsValue>>());
      MapBuilder<String, GetOrganizationFeatureFlagsResponseFeatureFlagsValue>
          mapBuilder = MapBuilder<String,
              GetOrganizationFeatureFlagsResponseFeatureFlagsValue>();
      mapBuilder['flag1'] =
          GetOrganizationFeatureFlagsResponseFeatureFlagsValue();
      instance.featureFlags = mapBuilder;
      final result = instance.build();
      expect(result, isA<GetOrganizationFeatureFlagsResponse>());
      expect(result.featureFlags?.length, isNonZero);
      expect(
          result.featureFlags,
          isA<
              BuiltMap<String,
                  GetOrganizationFeatureFlagsResponseFeatureFlagsValue>>());
    });
  });
}
