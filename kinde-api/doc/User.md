# kinde_api.model.User

## Load the model package
```dart
import 'package:kinde_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique id of the user in Kinde. | [optional] 
**providedId** | **String** | External id for user. | [optional] 
**email** | **String** | Default email address of the user in Kinde. | [optional] 
**lastName** | **String** | User's last name. | [optional] 
**firstName** | **String** | User's first name. | [optional] 
**fullName** | **String** | User's full name. | [optional] 
**isSuspended** | **bool** | Whether the user is currently suspended or not. | [optional] 
**picture** | **String** | User's profile picture URL. | [optional] 
**isPasswordResetRequested** | **bool** | Whether the user has been asked to reset their password. | [optional] 
**totalSignIns** | **int** | Total number of user sign ins. | [optional] 
**failedSignIns** | **int** | Number of consecutive failed user sign ins. | [optional] 
**lastSignedIn** | **String** | Last sign in date in ISO 8601 format. | [optional] 
**createdOn** | **String** | Date of user creation in ISO 8601 format. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


