# kinde_api.api.ConnectedAppsApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getConnectedAppAuthUrl**](ConnectedAppsApi.md#getconnectedappauthurl) | **GET** /api/v1/connected_apps/auth_url | Get Connected App URL
[**getConnectedAppToken**](ConnectedAppsApi.md#getconnectedapptoken) | **GET** /api/v1/connected_apps/token | Get Connected App Token
[**revokeConnectedAppToken**](ConnectedAppsApi.md#revokeconnectedapptoken) | **POST** /api/v1/connected_apps/revoke | Revoke Connected App Token


# **getConnectedAppAuthUrl**
> ConnectedAppsAuthUrl getConnectedAppAuthUrl(keyCodeRef, userId)

Get Connected App URL

Get a URL that authenticates and authorizes a user to a third-party connected app.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getConnectedAppsApi();
final String keyCodeRef = keyCodeRef_example; // String | The unique key code reference of the connected app to authenticate against.
final String userId = userId_example; // String | The id of the user that needs to authenticate to the third-party connected app.

try {
    final response = api.getConnectedAppAuthUrl(keyCodeRef, userId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ConnectedAppsApi->getConnectedAppAuthUrl: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **keyCodeRef** | **String**| The unique key code reference of the connected app to authenticate against. | 
 **userId** | **String**| The id of the user that needs to authenticate to the third-party connected app. | 

### Return type

[**ConnectedAppsAuthUrl**](ConnectedAppsAuthUrl.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getConnectedAppToken**
> ConnectedAppsAccessToken getConnectedAppToken(sessionId)

Get Connected App Token

Get an access token that can be used to call the third-party provider linked to the connected app.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getConnectedAppsApi();
final String sessionId = sessionId_example; // String | The unique sesssion id reprensenting the login session of a user.

try {
    final response = api.getConnectedAppToken(sessionId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ConnectedAppsApi->getConnectedAppToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**| The unique sesssion id reprensenting the login session of a user. | 

### Return type

[**ConnectedAppsAccessToken**](ConnectedAppsAccessToken.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **revokeConnectedAppToken**
> SuccessResponse revokeConnectedAppToken(sessionId)

Revoke Connected App Token

Revoke the tokens linked to the connected app session.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getConnectedAppsApi();
final String sessionId = sessionId_example; // String | The unique sesssion id reprensenting the login session of a user.

try {
    final response = api.revokeConnectedAppToken(sessionId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ConnectedAppsApi->revokeConnectedAppToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sessionId** | **String**| The unique sesssion id reprensenting the login session of a user. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

