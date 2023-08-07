import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for FeatureFlagsApi
void main() {
  final instance = KindeApi().getFeatureFlagsApi();

  group(FeatureFlagsApi, () {
    // Create Feature Flag
    //
    // Create feature flag.
    //
    //Future<SuccessResponse> createFeatureFlag(CreateFeatureFlagRequest createFeatureFlagRequest) async
    test('test createFeatureFlag', () async {
      // TODO
    });

    // Delete Feature Flag
    //
    // Delete feature flag
    //
    //Future<SuccessResponse> deleteFeatureFlag(String featureFlagKey) async
    test('test deleteFeatureFlag', () async {
      // TODO
    });

    // Replace Feature Flag
    //
    // Update feature flag.
    //
    //Future<SuccessResponse> updateFeatureFlag(String featureFlagKey, String name, String description, String type, String allowOverrideLevel, String defaultValue) async
    test('test updateFeatureFlag', () async {
      // TODO
    });

  });
}
