# kinde_api.api.OrganizationsApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addOrganizationUsers**](OrganizationsApi.md#addorganizationusers) | **POST** /api/v1/organizations/{org_code}/users | Add Organization Users
[**createOrganization**](OrganizationsApi.md#createorganization) | **POST** /api/v1/organization | Create Organization
[**createOrganizationUserRole**](OrganizationsApi.md#createorganizationuserrole) | **POST** /api/v1/organizations/{org_code}/users/{user_id}/roles | Add Organization User Role
[**deleteOrganization**](OrganizationsApi.md#deleteorganization) | **DELETE** /api/v1/organization/{org_code} | Delete Organization
[**deleteOrganizationFeatureFlagOverride**](OrganizationsApi.md#deleteorganizationfeatureflagoverride) | **DELETE** /api/v1/organizations/{org_code}/feature_flags/{feature_flag_key} | Delete Organization Feature Flag Override
[**deleteOrganizationFeatureFlagOverrides**](OrganizationsApi.md#deleteorganizationfeatureflagoverrides) | **DELETE** /api/v1/organizations/{org_code}/feature_flags | Delete Organization Feature Flag Overrides
[**deleteOrganizationUserRole**](OrganizationsApi.md#deleteorganizationuserrole) | **DELETE** /api/v1/organizations/{org_code}/users/{user_id}/roles/{role_id} | Delete Organization User Role
[**getOrganization**](OrganizationsApi.md#getorganization) | **GET** /api/v1/organization | Get Organization
[**getOrganizationFeatureFlags**](OrganizationsApi.md#getorganizationfeatureflags) | **GET** /api/v1/organizations/{org_code}/feature_flags | List Organization Feature Flags
[**getOrganizationUserRoles**](OrganizationsApi.md#getorganizationuserroles) | **GET** /api/v1/organizations/{org_code}/users/{user_id}/roles | List Organization User Roles
[**getOrganizationUsers**](OrganizationsApi.md#getorganizationusers) | **GET** /api/v1/organizations/{org_code}/users | List Organization Users
[**getOrganizations**](OrganizationsApi.md#getorganizations) | **GET** /api/v1/organizations | List Organizations
[**removeOrganizationUser**](OrganizationsApi.md#removeorganizationuser) | **DELETE** /api/v1/organizations/{org_code}/users/{user_id} | Remove Organization User
[**updateOrganization**](OrganizationsApi.md#updateorganization) | **PATCH** /api/v1/organization/{org_code} | Update Organization
[**updateOrganizationFeatureFlagOverride**](OrganizationsApi.md#updateorganizationfeatureflagoverride) | **PATCH** /api/v1/organizations/{org_code}/feature_flags/{feature_flag_key} | Update Organization Feature Flag Override
[**updateOrganizationUsers**](OrganizationsApi.md#updateorganizationusers) | **PATCH** /api/v1/organizations/{org_code}/users | Update Organization Users


# **addOrganizationUsers**
> AddOrganizationUsersResponse addOrganizationUsers(orgCode, addOrganizationUsersRequest)

Add Organization Users

Add existing users to an organization.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The organization's code.
final AddOrganizationUsersRequest addOrganizationUsersRequest = ; // AddOrganizationUsersRequest | 

try {
    final response = api.addOrganizationUsers(orgCode, addOrganizationUsersRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->addOrganizationUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The organization's code. | 
 **addOrganizationUsersRequest** | [**AddOrganizationUsersRequest**](AddOrganizationUsersRequest.md)|  | [optional] 

### Return type

[**AddOrganizationUsersResponse**](AddOrganizationUsersResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrganization**
> CreateOrganizationResponse createOrganization(createOrganizationRequest)

Create Organization

Create an organization.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final CreateOrganizationRequest createOrganizationRequest = ; // CreateOrganizationRequest | Organization details.

try {
    final response = api.createOrganization(createOrganizationRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->createOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createOrganizationRequest** | [**CreateOrganizationRequest**](CreateOrganizationRequest.md)| Organization details. | [optional] 

### Return type

[**CreateOrganizationResponse**](CreateOrganizationResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **createOrganizationUserRole**
> SuccessResponse createOrganizationUserRole(orgCode, userId, createOrganizationUserRoleRequest)

Add Organization User Role

Add role to an organization user.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The organization's code.
final String userId = userId_example; // String | The user's id.
final CreateOrganizationUserRoleRequest createOrganizationUserRoleRequest = ; // CreateOrganizationUserRoleRequest | Role details.

try {
    final response = api.createOrganizationUserRole(orgCode, userId, createOrganizationUserRoleRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->createOrganizationUserRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The organization's code. | 
 **userId** | **String**| The user's id. | 
 **createOrganizationUserRoleRequest** | [**CreateOrganizationUserRoleRequest**](CreateOrganizationUserRoleRequest.md)| Role details. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganization**
> deleteOrganization(orgCode)

Delete Organization

Delete an organization.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The identifier for the organization.

try {
    api.deleteOrganization(orgCode);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->deleteOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The identifier for the organization. | 

### Return type

void (empty response body)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganizationFeatureFlagOverride**
> SuccessResponse deleteOrganizationFeatureFlagOverride(orgCode, featureFlagKey)

Delete Organization Feature Flag Override

Delete organization feature flag override.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The identifier for the organization.
final String featureFlagKey = featureFlagKey_example; // String | The identifier for the feature flag.

try {
    final response = api.deleteOrganizationFeatureFlagOverride(orgCode, featureFlagKey);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->deleteOrganizationFeatureFlagOverride: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The identifier for the organization. | 
 **featureFlagKey** | **String**| The identifier for the feature flag. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganizationFeatureFlagOverrides**
> SuccessResponse deleteOrganizationFeatureFlagOverrides(orgCode)

Delete Organization Feature Flag Overrides

Delete all organization feature flag overrides.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The identifier for the organization.

try {
    final response = api.deleteOrganizationFeatureFlagOverrides(orgCode);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->deleteOrganizationFeatureFlagOverrides: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The identifier for the organization. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteOrganizationUserRole**
> SuccessResponse deleteOrganizationUserRole(orgCode, userId, roleId)

Delete Organization User Role

Delete role for an organization user.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The organization's code.
final String userId = userId_example; // String | The user's id.
final String roleId = roleId_example; // String | The role id.

try {
    final response = api.deleteOrganizationUserRole(orgCode, userId, roleId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->deleteOrganizationUserRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The organization's code. | 
 **userId** | **String**| The user's id. | 
 **roleId** | **String**| The role id. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganization**
> Organization getOrganization(code)

Get Organization

Gets an organization given the organization's code. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String code = code_example; // String | The organization's code.

try {
    final response = api.getOrganization(code);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->getOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| The organization's code. | [optional] 

### Return type

[**Organization**](Organization.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganizationFeatureFlags**
> GetOrganizationFeatureFlagsResponse getOrganizationFeatureFlags(orgCode)

List Organization Feature Flags

Get all organization feature flags.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The identifier for the organization.

try {
    final response = api.getOrganizationFeatureFlags(orgCode);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->getOrganizationFeatureFlags: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The identifier for the organization. | 

### Return type

[**GetOrganizationFeatureFlagsResponse**](GetOrganizationFeatureFlagsResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganizationUserRoles**
> GetOrganizationsUserRolesResponse getOrganizationUserRoles(orgCode, userId)

List Organization User Roles

Get roles for an organization user.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The organization's code.
final String userId = userId_example; // String | The user's id.

try {
    final response = api.getOrganizationUserRoles(orgCode, userId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->getOrganizationUserRoles: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The organization's code. | 
 **userId** | **String**| The user's id. | 

### Return type

[**GetOrganizationsUserRolesResponse**](GetOrganizationsUserRolesResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganizationUsers**
> GetOrganizationUsersResponse getOrganizationUsers(orgCode, sort, pageSize, nextToken, permissions)

List Organization Users

Get users in an organization.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The organization's code.
final String sort = sort_example; // String | Field and order to sort the result by.
final int pageSize = 56; // int | Number of results per page. Defaults to 10 if parameter not sent.
final String nextToken = nextToken_example; // String | A string to get the next page of results if there are more results.
final String permissions = permissions_example; // String | Filter by user permissions

try {
    final response = api.getOrganizationUsers(orgCode, sort, pageSize, nextToken, permissions);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->getOrganizationUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The organization's code. | 
 **sort** | **String**| Field and order to sort the result by. | [optional] 
 **pageSize** | **int**| Number of results per page. Defaults to 10 if parameter not sent. | [optional] 
 **nextToken** | **String**| A string to get the next page of results if there are more results. | [optional] 
 **permissions** | **String**| Filter by user permissions | [optional] 

### Return type

[**GetOrganizationUsersResponse**](GetOrganizationUsersResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getOrganizations**
> GetOrganizationsResponse getOrganizations(sort, pageSize, nextToken)

List Organizations

Get a list of organizations. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String sort = sort_example; // String | Field and order to sort the result by.
final int pageSize = 56; // int | Number of results per page. Defaults to 10 if parameter not sent.
final String nextToken = nextToken_example; // String | A string to get the next page of results if there are more results.

try {
    final response = api.getOrganizations(sort, pageSize, nextToken);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->getOrganizations: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sort** | **String**| Field and order to sort the result by. | [optional] 
 **pageSize** | **int**| Number of results per page. Defaults to 10 if parameter not sent. | [optional] 
 **nextToken** | **String**| A string to get the next page of results if there are more results. | [optional] 

### Return type

[**GetOrganizationsResponse**](GetOrganizationsResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **removeOrganizationUser**
> SuccessResponse removeOrganizationUser(orgCode, userId)

Remove Organization User

Remove user from an organization.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The organization's code.
final String userId = userId_example; // String | The user's id.

try {
    final response = api.removeOrganizationUser(orgCode, userId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->removeOrganizationUser: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The organization's code. | 
 **userId** | **String**| The user's id. | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganization**
> updateOrganization(orgCode, updateOrganizationRequest)

Update Organization

Update an organization.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The identifier for the organization.
final UpdateOrganizationRequest updateOrganizationRequest = ; // UpdateOrganizationRequest | Organization details.

try {
    api.updateOrganization(orgCode, updateOrganizationRequest);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->updateOrganization: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The identifier for the organization. | 
 **updateOrganizationRequest** | [**UpdateOrganizationRequest**](UpdateOrganizationRequest.md)| Organization details. | [optional] 

### Return type

void (empty response body)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganizationFeatureFlagOverride**
> SuccessResponse updateOrganizationFeatureFlagOverride(orgCode, featureFlagKey, value)

Update Organization Feature Flag Override

Update organization feature flag override.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The identifier for the organization
final String featureFlagKey = featureFlagKey_example; // String | The identifier for the feature flag
final String value = value_example; // String | Override value

try {
    final response = api.updateOrganizationFeatureFlagOverride(orgCode, featureFlagKey, value);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->updateOrganizationFeatureFlagOverride: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The identifier for the organization | 
 **featureFlagKey** | **String**| The identifier for the feature flag | 
 **value** | **String**| Override value | 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateOrganizationUsers**
> UpdateOrganizationUsersResponse updateOrganizationUsers(orgCode, updateOrganizationUsersRequest)

Update Organization Users

Update users that belong to an organization.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getOrganizationsApi();
final String orgCode = orgCode_example; // String | The organization's code.
final UpdateOrganizationUsersRequest updateOrganizationUsersRequest = ; // UpdateOrganizationUsersRequest | 

try {
    final response = api.updateOrganizationUsers(orgCode, updateOrganizationUsersRequest);
    print(response);
} catch on DioError (e) {
    print('Exception when calling OrganizationsApi->updateOrganizationUsers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **orgCode** | **String**| The organization's code. | 
 **updateOrganizationUsersRequest** | [**UpdateOrganizationUsersRequest**](UpdateOrganizationUsersRequest.md)|  | [optional] 

### Return type

[**UpdateOrganizationUsersResponse**](UpdateOrganizationUsersResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json, application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

