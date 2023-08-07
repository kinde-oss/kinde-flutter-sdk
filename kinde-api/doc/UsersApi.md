# kinde_api.api.UsersApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createUser**](UsersApi.md#createuser) | **POST** /api/v1/user | Create User
[**deleteUser**](UsersApi.md#deleteuser) | **DELETE** /api/v1/user | Delete User
[**getUserData**](UsersApi.md#getuserdata) | **GET** /api/v1/user | Get User
[**getUsers**](UsersApi.md#getusers) | **GET** /api/v1/users | List Users
[**updateUser**](UsersApi.md#updateuser) | **PATCH** /api/v1/user | Update User


# **createUser**
> CreateUserResponse createUser(createUserRequest)

Create User

Creates a user record and optionally zero or more identities for the user. An example identity could be the email address of the user. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getUsersApi();
final CreateUserRequest createUserRequest = ; // CreateUserRequest | The details of the user to create.

try {
    final response = api.createUser(createUserRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling UsersApi->createUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createUserRequest** | [**CreateUserRequest**](CreateUserRequest.md)| The details of the user to create. | [optional] 

### Return type

[**CreateUserResponse**](CreateUserResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteUser**
> SuccessResponse deleteUser(id, isDeleteProfile)

Delete User

Delete a user record. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getUsersApi();
final String id = id_example; // String | The user's id.
final String isDeleteProfile = isDeleteProfile_example; // String | Delete all data and remove the user's profile from all of Kinde, including the subscriber list

try {
    final response = api.deleteUser(id, isDeleteProfile);
    print(response);
} catch on DioError (e) {
    print('Exception when calling UsersApi->deleteUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The user's id. | 
 **isDeleteProfile** | **String**| Delete all data and remove the user's profile from all of Kinde, including the subscriber list | [optional] 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserData**
> User getUserData(id)

Get User

Retrieve a user record. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getUsersApi();
final String id = id_example; // String | The user's id.

try {
    final response = api.getUserData(id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling UsersApi->getUserData: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The user's id. | 

### Return type

[**User**](User.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUsers**
> UsersResponse getUsers(sort, pageSize, userId, nextToken, email)

List Users

The returned list can be sorted by full name or email address in ascending or descending order. The number of records to return at a time can also be controlled using the `page_size` query string parameter. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getUsersApi();
final String sort = sort_example; // String | Field and order to sort the result by.
final int pageSize = 56; // int | Number of results per page. Defaults to 10 if parameter not sent.
final String userId = userId_example; // String | ID of the user to filter by.
final String nextToken = nextToken_example; // String | A string to get the next page of results if there are more results.
final String email = email_example; // String | Filter the results by email address. The query string should be comma separated and url encoded.

try {
    final response = api.getUsers(sort, pageSize, userId, nextToken, email);
    print(response);
} catch on DioError (e) {
    print('Exception when calling UsersApi->getUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sort** | **String**| Field and order to sort the result by. | [optional] 
 **pageSize** | **int**| Number of results per page. Defaults to 10 if parameter not sent. | [optional] 
 **userId** | **String**| ID of the user to filter by. | [optional] 
 **nextToken** | **String**| A string to get the next page of results if there are more results. | [optional] 
 **email** | **String**| Filter the results by email address. The query string should be comma separated and url encoded. | [optional] 

### Return type

[**UsersResponse**](UsersResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateUser**
> User updateUser(updateUserRequest, id)

Update User

Update a user record. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getUsersApi();
final UpdateUserRequest updateUserRequest = ; // UpdateUserRequest | The user to update.
final String id = id_example; // String | The user's id.

try {
    final response = api.updateUser(updateUserRequest, id);
    print(response);
} catch on DioError (e) {
    print('Exception when calling UsersApi->updateUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateUserRequest** | [**UpdateUserRequest**](UpdateUserRequest.md)| The user to update. | 
 **id** | **String**| The user's id. | [optional] 

### Return type

[**User**](User.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

