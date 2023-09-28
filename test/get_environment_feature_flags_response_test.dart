import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for GetEnvironmentFeatureFlagsResponse
void main() {
  final instance = GetEnvironmentFeatureFlagsResponseBuilder();
  // TODO add properties to the builder and call build()

  group(GetEnvironmentFeatureFlagsResponse, () {
    // Response code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = 'code';
      final result = instance.build();
      expect(result, isA<GetEnvironmentFeatureFlagsResponse>());
      expect(result.code, isA<String>());
      expect(result.code, isNotNull);
      expect(result.code, equals('code'));
    });

    // Response message.
    // String message
    test('to test the property `message`', () async {
      // TODO
      final message = instance.message;
      expect(message, isNull);
      instance.message = 'message';
      final result = instance.build();
      expect(result, isA<GetEnvironmentFeatureFlagsResponse>());
      expect(result.message, isA<String>());
      expect(result.message, isNotNull);
      expect(result.message, equals('message'));
    });

    // The environment's feature flag settings.
    // BuiltMap<String, GetOrganizationFeatureFlagsResponseFeatureFlagsValue> featureFlags
    test('to test the property `featureFlags`', () async {
      // TODO
      final featureFlags = instance.featureFlags;
      expect(featureFlags.length, isZero);
      var featureFlagsBuilder = MapBuilder<String,
          GetOrganizationFeatureFlagsResponseFeatureFlagsValue>();
      instance.featureFlags = featureFlagsBuilder;
      final result = instance.build();
      expect(result, isA<GetEnvironmentFeatureFlagsResponse>());
      expect(
          result.featureFlags,
          isA<
              BuiltMap<String,
                  GetOrganizationFeatureFlagsResponseFeatureFlagsValue>?>());
      expect(result.featureFlags, isNotNull);
    });

    // Pagination token.
    // String nextToken
    test('to test the property `nextToken`', () async {
      // TODO
      final nextToken = instance.nextToken;
      expect(nextToken, isNull);
      instance.nextToken = 'nextToken';
      final result = instance.build();
      expect(result.nextToken, isA<String>());
      expect(result.nextToken, isNotNull);
    });
  });
}
