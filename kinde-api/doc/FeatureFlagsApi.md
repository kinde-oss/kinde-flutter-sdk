# kinde_api.api.FeatureFlagsApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createFeatureFlag**](FeatureFlagsApi.md#createfeatureflag) | **POST** /api/v1/feature_flags | Create Feature Flag
[**deleteFeatureFlag**](FeatureFlagsApi.md#deletefeatureflag) | **DELETE** /api/v1/feature_flags/{feature_flag_key} | Delete Feature Flag
[**updateFeatureFlag**](FeatureFlagsApi.md#updatefeatureflag) | **PUT** /api/v1/feature_flags/{feature_flag_key} | Replace Feature Flag


# **createFeatureFlag**
> SuccessResponse createFeatureFlag(createFeatureFlagRequest)

Create Feature Flag

Create feature flag.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getFeatureFlagsApi();
final CreateFeatureFlagRequest createFeatureFlagRequest = ; // CreateFeatureFlagRequest | Flag details.

try {
    final response = api.createFeatureFlag(createFeatureFlagRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling FeatureFlagsApi->createFeatureFlag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createFeatureFlagRequest** | [**CreateFeatureFlagRequest**](CreateFeatureFlagRequest.md)| Flag details. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteFeatureFlag**
> SuccessResponse deleteFeatureFlag(featureFlagKey)

Delete Feature Flag

Delete feature flag

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getFeatureFlagsApi();
final String featureFlagKey = featureFlagKey_example; // String | The identifier for the feature flag.

try {
    final response = api.deleteFeatureFlag(featureFlagKey);
    print(response);
} catch on DioError (e) {
    print('Exception when calling FeatureFlagsApi->deleteFeatureFlag: $e\n');
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

# **updateFeatureFlag**
> SuccessResponse updateFeatureFlag(featureFlagKey, name, description, type, allowOverrideLevel, defaultValue)

Replace Feature Flag

Update feature flag.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getFeatureFlagsApi();
final String featureFlagKey = featureFlagKey_example; // String | The key identifier for the feature flag.
final String name = name_example; // String | The name of the flag.
final String description = description_example; // String | Description of the flag purpose.
final String type = type_example; // String | The variable type
final String allowOverrideLevel = allowOverrideLevel_example; // String | Allow the flag to be overridden at a different level.
final String defaultValue = defaultValue_example; // String | Default value for the flag used by environments and organizations.

try {
    final response = api.updateFeatureFlag(featureFlagKey, name, description, type, allowOverrideLevel, defaultValue);
    print(response);
} catch on DioError (e) {
    print('Exception when calling FeatureFlagsApi->updateFeatureFlag: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **featureFlagKey** | **String**| The key identifier for the feature flag. | 
 **name** | **String**| The name of the flag. | 
 **description** | **String**| Description of the flag purpose. | 
 **type** | **String**| The variable type | 
 **allowOverrideLevel** | **String**| Allow the flag to be overridden at a different level. | 
 **defaultValue** | **String**| Default value for the flag used by environments and organizations. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

