import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:dio/dio.dart';
import '../test/test_helpers/dio_mock.dart';

/// tests for FeatureFlagsApi
void main() {
  // final instance = KindeApi().getFeatureFlagsApi();
  Dio dio = DioAdapterMock();
  final instance = KindeApi(dio: dio).getFeatureFlagsApi();
  group(FeatureFlagsApi, () {
    // Create Feature Flag
    //
    // Create feature flag.
    //
    //Future<SuccessResponse> createFeatureFlag(CreateFeatureFlagRequest createFeatureFlagRequest) async
    test('test createFeatureFlag', () async {
      // TODO
      final responseData = await instance.createFeatureFlag(
        createFeatureFlagRequest: CreateFeatureFlagRequest((builder) {
          builder.key = "test_key";
          builder.name = 'test_name';
          builder.description = 'test_description';
          builder.type = CreateFeatureFlagRequestTypeEnum.bool_;
          builder.allowOverrideLevel =
              CreateFeatureFlagRequestAllowOverrideLevelEnum.env;
          builder.defaultValue = 'test_defaultValue';
        }),
      );
      expect(responseData, isNotNull);
    });

    // Delete Feature Flag
    //
    // Delete feature flag
    //
    //Future<SuccessResponse> deleteFeatureFlag(String featureFlagKey) async
    test('test deleteFeatureFlag', () async {
      // TODO
      final response =
          await instance.deleteFeatureFlag(featureFlagKey: 'test_key');
      expect(response, isNotNull);
    });

    // Replace Feature Flag
    //
    // Update feature flag.
    //
    //Future<SuccessResponse> updateFeatureFlag(String featureFlagKey, String name, String description, String type, String allowOverrideLevel, String defaultValue) async
    test('test updateFeatureFlag', () async {
      // TODO
      final responseData = await instance.updateFeatureFlag(
        featureFlagKey: 'test_key',
        name: 'test_name',
        description: 'test_description',
        type: "test_type",
        allowOverrideLevel: "test_level",
        defaultValue: 'test_defaultValue',
      );
      expect(responseData, isNotNull);
    });
  });
}
