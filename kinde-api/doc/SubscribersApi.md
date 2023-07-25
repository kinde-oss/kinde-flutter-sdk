# kinde_api.api.SubscribersApi

## Load the API package
```dart
import 'package:kinde_api/api.dart';
```

All URIs are relative to *https://app.kinde.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createSubscriber**](SubscribersApi.md#createsubscriber) | **POST** /api/v1/subscribers | Create Subscriber
[**getSubscriber**](SubscribersApi.md#getsubscriber) | **GET** /api/v1/subscribers/{subscriber_id} | Get Subscriber
[**getSubscribers**](SubscribersApi.md#getsubscribers) | **GET** /api/v1/subscribers | List Subscribers


# **createSubscriber**
> CreateSubscriberSuccessResponse createSubscriber(firstName, lastName, email)

Create Subscriber

Create subscriber.

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getSubscribersApi();
final String firstName = firstName_example; // String | Subscriber's first name.
final String lastName = lastName_example; // String | Subscriber's last name.
final String email = email_example; // String | The email address of the subscriber.

try {
    final response = api.createSubscriber(firstName, lastName, email);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SubscribersApi->createSubscriber: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **firstName** | **String**| Subscriber's first name. | 
 **lastName** | **String**| Subscriber's last name. | 
 **email** | **String**| The email address of the subscriber. | 

### Return type

[**CreateSubscriberSuccessResponse**](CreateSubscriberSuccessResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSubscriber**
> GetSubscriberResponse getSubscriber(subscriberId)

Get Subscriber

Retrieve a subscriber record. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getSubscribersApi();
final String subscriberId = subscriberId_example; // String | The subscriber's id.

try {
    final response = api.getSubscriber(subscriberId);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SubscribersApi->getSubscriber: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscriberId** | **String**| The subscriber's id. | 

### Return type

[**GetSubscriberResponse**](GetSubscriberResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSubscribers**
> GetSubscribersResponse getSubscribers(sort, pageSize, nextToken)

List Subscribers

The returned list can be sorted by full name or email address in ascending or descending order. The number of records to return at a time can also be controlled using the `page_size` query string parameter. 

### Example
```dart
import 'package:kinde_api/api.dart';
// TODO Configure HTTP basic authorization: kindeBearerAuth
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('kindeBearerAuth').password = 'YOUR_PASSWORD';

final api = KindeApi().getSubscribersApi();
final String sort = sort_example; // String | Field and order to sort the result by.
final int pageSize = 56; // int | Number of results per page. Defaults to 10 if parameter not sent.
final String nextToken = nextToken_example; // String | A string to get the next page of results if there are more results.

try {
    final response = api.getSubscribers(sort, pageSize, nextToken);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SubscribersApi->getSubscribers: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sort** | **String**| Field and order to sort the result by. | [optional] 
 **pageSize** | **int**| Number of results per page. Defaults to 10 if parameter not sent. | [optional] 
 **nextToken** | **String**| A string to get the next page of results if there are more results. | [optional] 

### Return type

[**GetSubscribersResponse**](GetSubscribersResponse.md)

### Authorization

[kindeBearerAuth](../README.md#kindeBearerAuth)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json; charset=utf-8

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

