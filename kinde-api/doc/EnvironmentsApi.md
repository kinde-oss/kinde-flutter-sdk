# kinde_api.api.EnvironmentsApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteEnvironementFeatureFlagOverride**](EnvironmentsApi.md#deleteenvironementfeatureflagoverride) | **DELETE** /api/v1/environment/feature_flags/{feature_flag_key} | Delete Environment Feature Flag Override
[**deleteEnvironementFeatureFlagOverrides**](EnvironmentsApi.md#deleteenvironementfeatureflagoverrides) | **DELETE** /api/v1/environment/feature_flags | Delete Environment Feature Flag Overrides
[**getEnvironementFeatureFlags**](EnvironmentsApi.md#getenvironementfeatureflags) | **GET** /api/v1/environment/feature_flags | List Environment Feature Flags
[**updateEnvironementFeatureFlagOverride**](EnvironmentsApi.md#updateenvironementfeatureflagoverride) | **PATCH** /api/v1/environment/feature_flags/{feature_flag_key} | Update Environment Feature Flag Override


# **deleteEnvironementFeatureFlagOverride**
> SuccessResponse deleteEnvironementFeatureFlagOverride(featureFlagKey)

Delete Environment Feature Flag Override

Delete environment feature flag override.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getEnvironmentsApi();
final String featureFlagKey = featureFlagKey_example; // String | The identifier for the feature flag.

try {
    final response = api.deleteEnvironementFeatureFlagOverride(featureFlagKey);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EnvironmentsApi->deleteEnvironementFeatureFlagOverride: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **featureFlagKey** | **String**| The identifier for the feature flag. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteEnvironementFeatureFlagOverrides**
> SuccessResponse deleteEnvironementFeatureFlagOverrides()

Delete Environment Feature Flag Overrides

Delete all environment feature flag overrides.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getEnvironmentsApi();

try {
    final response = api.deleteEnvironementFeatureFlagOverrides();
    print(response);
} catch on DioError (e) {
    print('Exception when calling EnvironmentsApi->deleteEnvironementFeatureFlagOverrides: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEnvironementFeatureFlags**
> GetEnvironmentFeatureFlagsResponse getEnvironementFeatureFlags()

List Environment Feature Flags

Get environment feature flags.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getEnvironmentsApi();

try {
    final response = api.getEnvironementFeatureFlags();
    print(response);
} catch on DioError (e) {
    print('Exception when calling EnvironmentsApi->getEnvironementFeatureFlags: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetEnvironmentFeatureFlagsResponse**](GetEnvironmentFeatureFlagsResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateEnvironementFeatureFlagOverride**
> SuccessResponse updateEnvironementFeatureFlagOverride(featureFlagKey, updateEnvironementFeatureFlagOverrideRequest)

Update Environment Feature Flag Override

Update environment feature flag override.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getEnvironmentsApi();
final String featureFlagKey = featureFlagKey_example; // String | The identifier for the feature flag.
final UpdateEnvironementFeatureFlagOverrideRequest updateEnvironementFeatureFlagOverrideRequest = ; // UpdateEnvironementFeatureFlagOverrideRequest | Flag details.

try {
    final response = api.updateEnvironementFeatureFlagOverride(featureFlagKey, updateEnvironementFeatureFlagOverrideRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling EnvironmentsApi->updateEnvironementFeatureFlagOverride: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **featureFlagKey** | **String**| The identifier for the feature flag. | 
 **updateEnvironementFeatureFlagOverrideRequest** | [**UpdateEnvironementFeatureFlagOverrideRequest**](UpdateEnvironementFeatureFlagOverrideRequest.md)| Flag details. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

