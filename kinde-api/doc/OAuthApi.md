# kinde_api.api.OAuthApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUser**](OAuthApi.md#getuser) | **GET** /oauth2/user_profile | Get User Profile
[**getUserProfileV2**](OAuthApi.md#getuserprofilev2) | **GET** /oauth2/v2/user_profile | Returns the details of the currently logged in user


# **getUser**
> UserProfile getUser()

Get User Profile

Contains the id, names and email of the currently logged in user. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOAuthApi();

try {
    final response = api.getUser();
    print(response);
} catch on DioError (e) {
    print('Exception when calling OAuthApi->getUser: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserProfile**](UserProfile.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserProfileV2**
> UserProfileV2 getUserProfileV2()

Returns the details of the currently logged in user

Contains the id, names, profile picture URL and email of the currently logged in user. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOAuthApi();

try {
    final response = api.getUserProfileV2();
    print(response);
} catch on DioError (e) {
    print('Exception when calling OAuthApi->getUserProfileV2: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**UserProfileV2**](UserProfileV2.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

