import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import '../test/test_helpers/dio_mock.dart';
import 'package:dio/dio.dart';

/// tests for EnvironmentsApi
void main() {
  //final instance = KindeApi().getEnvironmentsApi();
  Dio dio = DioAdapterMock();
  EnvironmentsApi instance = KindeApi(dio: dio).getEnvironmentsApi();

  group(EnvironmentsApi, () {
    // Delete Environment Feature Flag Override
    //
    // Delete environment feature flag override.
    //
    //Future<SuccessResponse> deleteEnvironementFeatureFlagOverride(String featureFlagKey) async
    test('test deleteEnvironementFeatureFlagOverride', () async {
      // TODO
      final responseData = await instance.deleteEnvironementFeatureFlagOverride(
        featureFlagKey: 'test_key',
      );
      expect(responseData, isNotNull);
    });

    // Delete Environment Feature Flag Overrides
    //
    // Delete all environment feature flag overrides.
    //
    //Future<SuccessResponse> deleteEnvironementFeatureFlagOverrides() async
    test('test deleteEnvironementFeatureFlagOverrides', () async {
      // TODO
      final responseData =
          await instance.deleteEnvironementFeatureFlagOverrides();
      expect(responseData, isNotNull);
    });

    // List Environment Feature Flags
    //
    // Get environment feature flags.
    //
    //Future<GetEnvironmentFeatureFlagsResponse> getEnvironementFeatureFlags() async
    test('test getEnvironementFeatureFlags', () async {
      // TODO
      final responseData = await instance.getEnvironementFeatureFlags();
      expect(responseData, isNotNull);
    });

    // Update Environment Feature Flag Override
    //
    // Update environment feature flag override.
    //
    //Future<SuccessResponse> updateEnvironementFeatureFlagOverride(String featureFlagKey, UpdateEnvironementFeatureFlagOverrideRequest updateEnvironementFeatureFlagOverrideRequest) async
    test('test updateEnvironementFeatureFlagOverride', () async {
      // TODO
      final responseData = await instance.updateEnvironementFeatureFlagOverride(
          featureFlagKey: 'test_key',
          updateEnvironementFeatureFlagOverrideRequest:
              UpdateEnvironementFeatureFlagOverrideRequest((builder) {
            builder.value = 'test_value';
          }));
      expect(responseData, isNotNull);
    });
  });
}
