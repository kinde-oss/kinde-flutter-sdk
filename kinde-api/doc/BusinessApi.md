# kinde_api.api.BusinessApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getBusiness**](BusinessApi.md#getbusiness) | **GET** /api/v1/business | List business details
[**updateBusiness**](BusinessApi.md#updatebusiness) | **PATCH** /api/v1/business | Update business details


# **getBusiness**
> SuccessResponse getBusiness(code, name, email, phone, industry, timezone, privacyUrl, termsUrl)

List business details

Get your business details.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getBusinessApi();
final String code = code_example; // String | Business code.
final String name = name_example; // String | Business name.
final String email = email_example; // String | Email associated with business.
final String phone = phone_example; // String | Phone number associated with business.
final String industry = industry_example; // String | The industry your business is in.
final String timezone = timezone_example; // String | The timezone your business is in.
final String privacyUrl = privacyUrl_example; // String | Your Privacy policy URL.
final String termsUrl = termsUrl_example; // String | Your Terms and Conditions URL.

try {
    final response = api.getBusiness(code, name, email, phone, industry, timezone, privacyUrl, termsUrl);
    print(response);
} catch on DioError (e) {
    print('Exception when calling BusinessApi->getBusiness: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| Business code. | 
 **name** | **String**| Business name. | 
 **email** | **String**| Email associated with business. | 
 **phone** | **String**| Phone number associated with business. | [optional] 
 **industry** | **String**| The industry your business is in. | [optional] 
 **timezone** | **String**| The timezone your business is in. | [optional] 
 **privacyUrl** | **String**| Your Privacy policy URL. | [optional] 
 **termsUrl** | **String**| Your Terms and Conditions URL. | [optional] 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateBusiness**
> SuccessResponse updateBusiness(businessName, primaryEmail, primaryPhone, industryKey, timezoneId, privacyUrl, termsUrl, isShowKindeBranding, isClickWrap, partnerCode)

Update business details

Update business details.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getBusinessApi();
final String businessName = businessName_example; // String | Business name.
final String primaryEmail = primaryEmail_example; // String | Email associated with business.
final String primaryPhone = primaryPhone_example; // String | Phone number associated with business.
final String industryKey = industryKey_example; // String | The key of the industry your business is in.
final String timezoneId = timezoneId_example; // String | The ID of the timezone your business is in.
final String privacyUrl = privacyUrl_example; // String | Your Privacy policy URL.
final String termsUrl = termsUrl_example; // String | Your Terms and Conditions URL.
final String isShowKindeBranding = isShowKindeBranding_example; // String | Display \"Powered by Kinde\" on your sign up, sign in, and subscription pages.
final bool isClickWrap = true; // bool | Show a policy acceptance checkbox on sign up.
final String partnerCode = partnerCode_example; // String | Your Kinde Perk code.

try {
    final response = api.updateBusiness(businessName, primaryEmail, primaryPhone, industryKey, timezoneId, privacyUrl, termsUrl, isShowKindeBranding, isClickWrap, partnerCode);
    print(response);
} catch on DioError (e) {
    print('Exception when calling BusinessApi->updateBusiness: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **businessName** | **String**| Business name. | 
 **primaryEmail** | **String**| Email associated with business. | 
 **primaryPhone** | **String**| Phone number associated with business. | [optional] 
 **industryKey** | **String**| The key of the industry your business is in. | [optional] 
 **timezoneId** | **String**| The ID of the timezone your business is in. | [optional] 
 **privacyUrl** | **String**| Your Privacy policy URL. | [optional] 
 **termsUrl** | **String**| Your Terms and Conditions URL. | [optional] 
 **isShowKindeBranding** | **String**| Display \"Powered by Kinde\" on your sign up, sign in, and subscription pages. | [optional] 
 **isClickWrap** | **bool**| Show a policy acceptance checkbox on sign up. | [optional] 
 **partnerCode** | **String**| Your Kinde Perk code. | [optional] 

### Return type

[**SuccessResponse**](SuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

