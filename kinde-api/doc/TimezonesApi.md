# kinde_api.api.TimezonesApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getTimezones**](TimezonesApi.md#gettimezones) | **GET** /api/v1/timezones | List timezones and timezone IDs.


# **getTimezones**
> SuccessResponse getTimezones(timezoneKey, name)

List timezones and timezone IDs.

Get a list of timezones and associated timezone keys.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getTimezonesApi();
final String timezoneKey = timezoneKey_example; // String | Timezone Key.
final String name = name_example; // String | Timezone.

try {
    final response = api.getTimezones(timezoneKey, name);
    print(response);
} catch on DioError (e) {
    print('Exception when calling TimezonesApi->getTimezones: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **timezoneKey** | **String**| Timezone Key. | [optional] 
 **name** | **String**| Timezone. | [optional] 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

