# kinde_api.api.RolesApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createRole**](RolesApi.md#createrole) | **POST** /api/v1/role | Create Role
[**getRoles**](RolesApi.md#getroles) | **GET** /api/v1/roles | List Roles
[**updateRolePermissions**](RolesApi.md#updaterolepermissions) | **PATCH** /api/v1/roles/{role_id}/permissions | Update Role Permissions
[**updateRoles**](RolesApi.md#updateroles) | **PATCH** /api/v1/roles/{role_id} | Update Role


# **createRole**
> SuccessResponse createRole(createRoleRequest)

Create Role

Create role.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getRolesApi();
final CreateRoleRequest createRoleRequest = ; // CreateRoleRequest | Role details.

try {
    final response = api.createRole(createRoleRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling RolesApi->createRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createRoleRequest** | [**CreateRoleRequest**](CreateRoleRequest.md)| Role details. | [optional] 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRoles**
> GetRolesResponse getRoles(sort, pageSize, nextToken)

List Roles

The returned list can be sorted by role name or role ID in ascending or descending order. The number of records to return at a time can also be controlled using the `page_size` query string parameter. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getRolesApi();
final String sort = sort_example; // String | Field and order to sort the result by.
final int pageSize = 56; // int | Number of results per page. Defaults to 10 if parameter not sent.
final String nextToken = nextToken_example; // String | A string to get the next page of results if there are more results.

try {
    final response = api.getRoles(sort, pageSize, nextToken);
    print(response);
} catch on DioError (e) {
    print('Exception when calling RolesApi->getRoles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sort** | **String**| Field and order to sort the result by. | [optional] 
 **pageSize** | **int**| Number of results per page. Defaults to 10 if parameter not sent. | [optional] 
 **nextToken** | **String**| A string to get the next page of results if there are more results. | [optional] 

### Return type

[**GetRolesResponse**](GetRolesResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateRolePermissions**
> UpdateRolePermissionsResponse updateRolePermissions(roleId, updateRolePermissionsRequest)

Update Role Permissions

Update role permissions. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getRolesApi();
final String roleId = roleId_example; // String | The identifier for the role.
final UpdateRolePermissionsRequest updateRolePermissionsRequest = ; // UpdateRolePermissionsRequest | 

try {
    final response = api.updateRolePermissions(roleId, updateRolePermissionsRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling RolesApi->updateRolePermissions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleId** | **String**| The identifier for the role. | 
 **updateRolePermissionsRequest** | [**UpdateRolePermissionsRequest**](UpdateRolePermissionsRequest.md)|  | 

### Return type

[**UpdateRolePermissionsResponse**](UpdateRolePermissionsResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateRoles**
> SuccessResponse updateRoles(roleId, updateRolesRequest)

Update Role

Update a role

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getRolesApi();
final String roleId = roleId_example; // String | The identifier for the role.
final UpdateRolesRequest updateRolesRequest = ; // UpdateRolesRequest | Role details.

try {
    final response = api.updateRoles(roleId, updateRolesRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling RolesApi->updateRoles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **roleId** | **String**| The identifier for the role. | 
 **updateRolesRequest** | [**UpdateRolesRequest**](UpdateRolesRequest.md)| Role details. | [optional] 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

