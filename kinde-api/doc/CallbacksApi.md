# kinde_api.api.CallbacksApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addRedirectCallbackURLs**](CallbacksApi.md#addredirectcallbackurls) | **POST** /api/v1/applications/{app_id}/auth_redirect_urls | Add Redirect Callback URLs
[**deleteCallbackURLs**](CallbacksApi.md#deletecallbackurls) | **DELETE** /api/v1/applications/{app_id}/auth_redirect_urls | Delete Callback URLs
[**getCallbackURLs**](CallbacksApi.md#getcallbackurls) | **GET** /api/v1/applications/{app_id}/auth_redirect_urls | List Callback URLs
[**replaceRedirectCallbackURLs**](CallbacksApi.md#replaceredirectcallbackurls) | **PUT** /api/v1/applications/{app_id}/auth_redirect_urls | Replace Redirect Callback URLs


# **addRedirectCallbackURLs**
> SuccessResponse addRedirectCallbackURLs(appId, replaceRedirectCallbackURLsRequest)

Add Redirect Callback URLs

Add additional redirect callback URLs. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getCallbacksApi();
final String appId = appId_example; // String | The identifier for the application.
final ReplaceRedirectCallbackURLsRequest replaceRedirectCallbackURLsRequest = ; // ReplaceRedirectCallbackURLsRequest | Callback details.

try {
    final response = api.addRedirectCallbackURLs(appId, replaceRedirectCallbackURLsRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling CallbacksApi->addRedirectCallbackURLs: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appId** | **String**| The identifier for the application. | 
 **replaceRedirectCallbackURLsRequest** | [**ReplaceRedirectCallbackURLsRequest**](ReplaceRedirectCallbackURLsRequest.md)| Callback details. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCallbackURLs**
> SuccessResponse deleteCallbackURLs(appId, urls)

Delete Callback URLs

Delete callback URLs. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getCallbacksApi();
final String appId = appId_example; // String | The identifier for the application.
final String urls = urls_example; // String | Urls to delete, comma separated and url encoded.

try {
    final response = api.deleteCallbackURLs(appId, urls);
    print(response);
} catch on DioError (e) {
    print('Exception when calling CallbacksApi->deleteCallbackURLs: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appId** | **String**| The identifier for the application. | 
 **urls** | **String**| Urls to delete, comma separated and url encoded. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCallbackURLs**
> RedirectCallbackUrls getCallbackURLs(appId)

List Callback URLs

Returns an application's redirect callback URLs. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getCallbacksApi();
final String appId = appId_example; // String | The identifier for the application.

try {
    final response = api.getCallbackURLs(appId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling CallbacksApi->getCallbackURLs: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appId** | **String**| The identifier for the application. | 

### Return type

[**RedirectCallbackUrls**](RedirectCallbackUrls.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **replaceRedirectCallbackURLs**
> SuccessResponse replaceRedirectCallbackURLs(appId, replaceRedirectCallbackURLsRequest)

Replace Redirect Callback URLs

Replace all redirect callback URLs. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getCallbacksApi();
final String appId = appId_example; // String | The identifier for the application.
final ReplaceRedirectCallbackURLsRequest replaceRedirectCallbackURLsRequest = ; // ReplaceRedirectCallbackURLsRequest | Callback details.

try {
    final response = api.replaceRedirectCallbackURLs(appId, replaceRedirectCallbackURLsRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling CallbacksApi->replaceRedirectCallbackURLs: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **appId** | **String**| The identifier for the application. | 
 **replaceRedirectCallbackURLsRequest** | [**ReplaceRedirectCallbackURLsRequest**](ReplaceRedirectCallbackURLsRequest.md)| Callback details. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

