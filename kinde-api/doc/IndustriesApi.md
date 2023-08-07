# kinde_api.api.IndustriesApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getIndustries**](IndustriesApi.md#getindustries) | **GET** /api/v1/industries | List industries and industry keys.


# **getIndustries**
> SuccessResponse getIndustries(industryKey, name)

List industries and industry keys.

Get a list of industries and associated industry keys.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getIndustriesApi();
final String industryKey = industryKey_example; // String | Industry Key.
final String name = name_example; // String | Industry name.

try {
    final response = api.getIndustries(industryKey, name);
    print(response);
} catch on DioError (e) {
    print('Exception when calling IndustriesApi->getIndustries: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **industryKey** | **String**| Industry Key. | [optional] 
 **name** | **String**| Industry name. | [optional] 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

