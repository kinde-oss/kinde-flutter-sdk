# kinde_api.model.UserProfileV2

## Load the model package
```dart
import 'package:kinde_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique id of the user in Kinde (deprecated). | [optional] 
**sub** | **String** | Unique id of the user in Kinde. | [optional] 
**providedId** | **String** | Value of the user's id in a third-party system when the user is imported into Kinde. | [optional] 
**name** | **String** | Users's first and last name separated by a space. | [optional] 
**givenName** | **String** | User's first name. | [optional] 
**familyName** | **String** | User's last name. | [optional] 
**updatedAt** | **int** | Date the user was last updated at (In Unix time). | [optional] 
**email** | **String** | User's email address if available. | [optional] 
**picture** | **String** | URL that point's to the user's picture or avatar | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


