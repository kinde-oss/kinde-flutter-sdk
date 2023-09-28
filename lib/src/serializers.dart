//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:kinde_flutter_sdk/src/date_serializer.dart';
import 'package:kinde_flutter_sdk/src/model/add_apis_request.dart';
import 'package:kinde_flutter_sdk/src/model/add_organization_users_request.dart';
import 'package:kinde_flutter_sdk/src/model/add_organization_users_request_users_inner.dart';
import 'package:kinde_flutter_sdk/src/model/add_organization_users_response.dart';
import 'package:kinde_flutter_sdk/src/model/api.dart';
import 'package:kinde_flutter_sdk/src/model/api_applications_inner.dart';
import 'package:kinde_flutter_sdk/src/model/api_result.dart';
import 'package:kinde_flutter_sdk/src/model/apis.dart';
import 'package:kinde_flutter_sdk/src/model/applications.dart';
import 'package:kinde_flutter_sdk/src/model/connected_apps_access_token.dart';
import 'package:kinde_flutter_sdk/src/model/connected_apps_auth_url.dart';
import 'package:kinde_flutter_sdk/src/model/create_application_request.dart';
import 'package:kinde_flutter_sdk/src/model/create_application_response.dart';
import 'package:kinde_flutter_sdk/src/model/create_application_response_application.dart';
import 'package:kinde_flutter_sdk/src/model/create_feature_flag_request.dart';
import 'package:kinde_flutter_sdk/src/model/create_organization_request.dart';
import 'package:kinde_flutter_sdk/src/model/create_organization_response.dart';
import 'package:kinde_flutter_sdk/src/model/create_organization_response_organization.dart';
import 'package:kinde_flutter_sdk/src/model/create_organization_user_permission_request.dart';
import 'package:kinde_flutter_sdk/src/model/create_organization_user_role_request.dart';
import 'package:kinde_flutter_sdk/src/model/create_permission_request.dart';
import 'package:kinde_flutter_sdk/src/model/create_role_request.dart';
import 'package:kinde_flutter_sdk/src/model/create_subscriber_success_response.dart';
import 'package:kinde_flutter_sdk/src/model/create_subscriber_success_response_subscriber.dart';
import 'package:kinde_flutter_sdk/src/model/create_user_request.dart';
import 'package:kinde_flutter_sdk/src/model/create_user_request_identities_inner.dart';
import 'package:kinde_flutter_sdk/src/model/create_user_request_identities_inner_details.dart';
import 'package:kinde_flutter_sdk/src/model/create_user_request_profile.dart';
import 'package:kinde_flutter_sdk/src/model/create_user_response.dart';
import 'package:kinde_flutter_sdk/src/model/date.dart';
import 'package:kinde_flutter_sdk/src/model/error.dart';
import 'package:kinde_flutter_sdk/src/model/error_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_application_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_application_response_application.dart';
import 'package:kinde_flutter_sdk/src/model/get_applications_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_environment_feature_flags_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_organization_feature_flags_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_organization_feature_flags_response_feature_flags_value.dart';
import 'package:kinde_flutter_sdk/src/model/get_organization_users_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_organizations_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_organizations_user_permissions_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_organizations_user_roles_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_redirect_callback_urls_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_roles_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_subscriber_response.dart';
import 'package:kinde_flutter_sdk/src/model/get_subscribers_response.dart';
import 'package:kinde_flutter_sdk/src/model/logout_redirect_urls.dart';
import 'package:kinde_flutter_sdk/src/model/organization.dart';
import 'package:kinde_flutter_sdk/src/model/organization_user.dart';
import 'package:kinde_flutter_sdk/src/model/organization_user_permission.dart';
import 'package:kinde_flutter_sdk/src/model/organization_user_permission_roles_inner.dart';
import 'package:kinde_flutter_sdk/src/model/organization_user_role.dart';
import 'package:kinde_flutter_sdk/src/model/organization_user_role_permissions.dart';
import 'package:kinde_flutter_sdk/src/model/organization_user_role_permissions_permissions.dart';
import 'package:kinde_flutter_sdk/src/model/permissions.dart';
import 'package:kinde_flutter_sdk/src/model/redirect_callback_urls.dart';
import 'package:kinde_flutter_sdk/src/model/replace_logout_redirect_urls_request.dart';
import 'package:kinde_flutter_sdk/src/model/replace_redirect_callback_urls_request.dart';
import 'package:kinde_flutter_sdk/src/model/role.dart';
import 'package:kinde_flutter_sdk/src/model/roles.dart';
import 'package:kinde_flutter_sdk/src/model/roles_permission_response_inner.dart';
import 'package:kinde_flutter_sdk/src/model/subscriber.dart';
import 'package:kinde_flutter_sdk/src/model/subscribers_subscriber.dart';
import 'package:kinde_flutter_sdk/src/model/success_response.dart';
import 'package:kinde_flutter_sdk/src/model/token_error_response.dart';
import 'package:kinde_flutter_sdk/src/model/token_introspect.dart';
import 'package:kinde_flutter_sdk/src/model/update_api_applications_request.dart';
import 'package:kinde_flutter_sdk/src/model/update_api_applications_request_applications_inner.dart';
import 'package:kinde_flutter_sdk/src/model/update_application_request.dart';
import 'package:kinde_flutter_sdk/src/model/update_environement_feature_flag_override_request.dart';
import 'package:kinde_flutter_sdk/src/model/update_organization_request.dart';
import 'package:kinde_flutter_sdk/src/model/update_organization_users_request.dart';
import 'package:kinde_flutter_sdk/src/model/update_organization_users_request_users_inner.dart';
import 'package:kinde_flutter_sdk/src/model/update_organization_users_response.dart';
import 'package:kinde_flutter_sdk/src/model/update_role_permissions_request.dart';
import 'package:kinde_flutter_sdk/src/model/update_role_permissions_request_permissions_inner.dart';
import 'package:kinde_flutter_sdk/src/model/update_role_permissions_response.dart';
import 'package:kinde_flutter_sdk/src/model/update_roles_request.dart';
import 'package:kinde_flutter_sdk/src/model/update_user_request.dart';
import 'package:kinde_flutter_sdk/src/model/user.dart';
import 'package:kinde_flutter_sdk/src/model/user_identity.dart';
import 'package:kinde_flutter_sdk/src/model/user_identity_result.dart';
import 'package:kinde_flutter_sdk/src/model/user_profile.dart';
import 'package:kinde_flutter_sdk/src/model/user_profile_v2.dart';
import 'package:kinde_flutter_sdk/src/model/users_response.dart';
// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';

part 'serializers.g.dart';

@SerializersFor([
  AddAPIsRequest,
  AddOrganizationUsersRequest,
  AddOrganizationUsersRequestUsersInner,
  AddOrganizationUsersResponse,
  Api,
  ApiApplicationsInner,
  ApiResult,
  Apis,
  Applications,
  ConnectedAppsAccessToken,
  ConnectedAppsAuthUrl,
  CreateApplicationRequest,
  CreateApplicationResponse,
  CreateApplicationResponseApplication,
  CreateFeatureFlagRequest,
  CreateOrganizationRequest,
  CreateOrganizationResponse,
  CreateOrganizationResponseOrganization,
  CreateOrganizationUserPermissionRequest,
  CreateOrganizationUserRoleRequest,
  CreatePermissionRequest,
  CreateRoleRequest,
  CreateSubscriberSuccessResponse,
  CreateSubscriberSuccessResponseSubscriber,
  CreateUserRequest,
  CreateUserRequestIdentitiesInner,
  CreateUserRequestIdentitiesInnerDetails,
  CreateUserRequestProfile,
  CreateUserResponse,
  Error,
  ErrorResponse,
  GetApplicationResponse,
  GetApplicationResponseApplication,
  GetApplicationsResponse,
  GetEnvironmentFeatureFlagsResponse,
  GetOrganizationFeatureFlagsResponse,
  GetOrganizationFeatureFlagsResponseFeatureFlagsValue,
  GetOrganizationUsersResponse,
  GetOrganizationsResponse,
  GetOrganizationsUserPermissionsResponse,
  GetOrganizationsUserRolesResponse,
  GetRedirectCallbackUrlsResponse,
  GetRolesResponse,
  GetSubscriberResponse,
  GetSubscribersResponse,
  LogoutRedirectUrls,
  Organization,
  OrganizationUser,
  OrganizationUserPermission,
  OrganizationUserPermissionRolesInner,
  OrganizationUserRole,
  OrganizationUserRolePermissions,
  OrganizationUserRolePermissionsPermissions,
  Permissions,
  RedirectCallbackUrls,
  ReplaceLogoutRedirectURLsRequest,
  ReplaceRedirectCallbackURLsRequest,
  Role,
  Roles,
  RolesPermissionResponseInner,
  Subscriber,
  SubscribersSubscriber,
  SuccessResponse,
  TokenErrorResponse,
  TokenIntrospect,
  UpdateAPIApplicationsRequest,
  UpdateAPIApplicationsRequestApplicationsInner,
  UpdateApplicationRequest,
  UpdateEnvironementFeatureFlagOverrideRequest,
  UpdateOrganizationRequest,
  UpdateOrganizationUsersRequest,
  UpdateOrganizationUsersRequestUsersInner,
  UpdateOrganizationUsersResponse,
  UpdateRolePermissionsRequest,
  UpdateRolePermissionsRequestPermissionsInner,
  UpdateRolePermissionsResponse,
  UpdateRolesRequest,
  UpdateUserRequest,
  User,
  UserIdentity,
  UserIdentityResult,
  UserProfile,
  UserProfileV2,
  UsersResponse,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(RolesPermissionResponseInner)]),
        () => ListBuilder<RolesPermissionResponseInner>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
