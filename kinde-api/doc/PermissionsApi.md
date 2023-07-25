# kinde_api.api.PermissionsApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createPermission**](PermissionsApi.md#createpermission) | **POST** /api/v1/permissions | Create Permission
[**getPermissions**](PermissionsApi.md#getpermissions) | **GET** /api/v1/permissions | List Permissions
[**updatePermissions**](PermissionsApi.md#updatepermissions) | **PATCH** /api/v1/permissions/{permission_id} | Update Permission


# **createPermission**
> SuccessResponse createPermission(createPermissionRequest)

Create Permission

Create a new permission.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getPermissionsApi();
final CreatePermissionRequest createPermissionRequest = ; // CreatePermissionRequest | Permission details.

try {
    final response = api.createPermission(createPermissionRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PermissionsApi->createPermission: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createPermissionRequest** | [**CreatePermissionRequest**](CreatePermissionRequest.md)| Permission details. | [optional] 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPermissions**
> SuccessResponse getPermissions(sort, pageSize, nextToken)

List Permissions

The returned list can be sorted by permission name or permission ID in ascending or descending order. The number of records to return at a time can also be controlled using the `page_size` query string parameter. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getPermissionsApi();
final String sort = sort_example; // String | Field and order to sort the result by.
final int pageSize = 56; // int | Number of results per page. Defaults to 10 if parameter not sent.
final String nextToken = nextToken_example; // String | A string to get the next page of results if there are more results.

try {
    final response = api.getPermissions(sort, pageSize, nextToken);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PermissionsApi->getPermissions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sort** | **String**| Field and order to sort the result by. | [optional] 
 **pageSize** | **int**| Number of results per page. Defaults to 10 if parameter not sent. | [optional] 
 **nextToken** | **String**| A string to get the next page of results if there are more results. | [optional] 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updatePermissions**
> SuccessResponse updatePermissions(permissionId, createPermissionRequest)

Update Permission

Update permission

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getPermissionsApi();
final int permissionId = 56; // int | The identifier for the permission.
final CreatePermissionRequest createPermissionRequest = ; // CreatePermissionRequest | Permission details.

try {
    final response = api.updatePermissions(permissionId, createPermissionRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling PermissionsApi->updatePermissions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **permissionId** | **int**| The identifier for the permission. | 
 **createPermissionRequest** | [**CreatePermissionRequest**](CreatePermissionRequest.md)| Permission details. | [optional] 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

