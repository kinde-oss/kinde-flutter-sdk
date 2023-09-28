// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(AddAPIsRequest.serializer)
      ..add(AddOrganizationUsersRequest.serializer)
      ..add(AddOrganizationUsersRequestUsersInner.serializer)
      ..add(AddOrganizationUsersResponse.serializer)
      ..add(Api.serializer)
      ..add(ApiApplicationsInner.serializer)
      ..add(ApiResult.serializer)
      ..add(Apis.serializer)
      ..add(Applications.serializer)
      ..add(ConnectedAppsAccessToken.serializer)
      ..add(ConnectedAppsAuthUrl.serializer)
      ..add(CreateApplicationRequest.serializer)
      ..add(CreateApplicationResponse.serializer)
      ..add(CreateApplicationResponseApplication.serializer)
      ..add(CreateFeatureFlagRequest.serializer)
      ..add(CreateFeatureFlagRequestAllowOverrideLevelEnum.serializer)
      ..add(CreateFeatureFlagRequestTypeEnum.serializer)
      ..add(CreateOrganizationRequest.serializer)
      ..add(CreateOrganizationRequestFeatureFlagsEnum.serializer)
      ..add(CreateOrganizationResponse.serializer)
      ..add(CreateOrganizationResponseOrganization.serializer)
      ..add(CreateOrganizationUserPermissionRequest.serializer)
      ..add(CreateOrganizationUserRoleRequest.serializer)
      ..add(CreatePermissionRequest.serializer)
      ..add(CreateRoleRequest.serializer)
      ..add(CreateSubscriberSuccessResponse.serializer)
      ..add(CreateSubscriberSuccessResponseSubscriber.serializer)
      ..add(CreateUserRequest.serializer)
      ..add(CreateUserRequestIdentitiesInner.serializer)
      ..add(CreateUserRequestIdentitiesInnerDetails.serializer)
      ..add(CreateUserRequestIdentitiesInnerTypeEnum.serializer)
      ..add(CreateUserRequestProfile.serializer)
      ..add(CreateUserResponse.serializer)
      ..add(Error.serializer)
      ..add(ErrorResponse.serializer)
      ..add(GetApplicationResponse.serializer)
      ..add(GetApplicationResponseApplication.serializer)
      ..add(GetApplicationsResponse.serializer)
      ..add(GetEnvironmentFeatureFlagsResponse.serializer)
      ..add(GetOrganizationFeatureFlagsResponse.serializer)
      ..add(GetOrganizationFeatureFlagsResponseFeatureFlagsValue.serializer)
      ..add(GetOrganizationFeatureFlagsResponseFeatureFlagsValueTypeEnum
          .serializer)
      ..add(GetOrganizationUsersResponse.serializer)
      ..add(GetOrganizationsResponse.serializer)
      ..add(GetOrganizationsUserPermissionsResponse.serializer)
      ..add(GetOrganizationsUserRolesResponse.serializer)
      ..add(GetRedirectCallbackUrlsResponse.serializer)
      ..add(GetRolesResponse.serializer)
      ..add(GetSubscriberResponse.serializer)
      ..add(GetSubscribersResponse.serializer)
      ..add(LogoutRedirectUrls.serializer)
      ..add(Organization.serializer)
      ..add(OrganizationUser.serializer)
      ..add(OrganizationUserPermission.serializer)
      ..add(OrganizationUserPermissionRolesInner.serializer)
      ..add(OrganizationUserRole.serializer)
      ..add(OrganizationUserRolePermissions.serializer)
      ..add(OrganizationUserRolePermissionsPermissions.serializer)
      ..add(Permissions.serializer)
      ..add(RedirectCallbackUrls.serializer)
      ..add(ReplaceLogoutRedirectURLsRequest.serializer)
      ..add(ReplaceRedirectCallbackURLsRequest.serializer)
      ..add(Role.serializer)
      ..add(Roles.serializer)
      ..add(RolesPermissionResponseInner.serializer)
      ..add(Subscriber.serializer)
      ..add(SubscribersSubscriber.serializer)
      ..add(SuccessResponse.serializer)
      ..add(TokenErrorResponse.serializer)
      ..add(TokenIntrospect.serializer)
      ..add(UpdateAPIApplicationsRequest.serializer)
      ..add(UpdateAPIApplicationsRequestApplicationsInner.serializer)
      ..add(UpdateApplicationRequest.serializer)
      ..add(UpdateEnvironementFeatureFlagOverrideRequest.serializer)
      ..add(UpdateOrganizationRequest.serializer)
      ..add(UpdateOrganizationUsersRequest.serializer)
      ..add(UpdateOrganizationUsersRequestUsersInner.serializer)
      ..add(UpdateOrganizationUsersResponse.serializer)
      ..add(UpdateRolePermissionsRequest.serializer)
      ..add(UpdateRolePermissionsRequestPermissionsInner.serializer)
      ..add(UpdateRolePermissionsResponse.serializer)
      ..add(UpdateRolesRequest.serializer)
      ..add(UpdateUserRequest.serializer)
      ..add(User.serializer)
      ..add(UserIdentity.serializer)
      ..add(UserIdentityResult.serializer)
      ..add(UserProfile.serializer)
      ..add(UserProfileV2.serializer)
      ..add(UsersResponse.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(AddOrganizationUsersRequestUsersInner)]),
          () => new ListBuilder<AddOrganizationUsersRequestUsersInner>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(ApiApplicationsInner)]),
          () => new ListBuilder<ApiApplicationsInner>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Applications)]),
          () => new ListBuilder<Applications>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(CreateUserRequestIdentitiesInner)]),
          () => new ListBuilder<CreateUserRequestIdentitiesInner>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Error)]),
          () => new ListBuilder<Error>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Organization)]),
          () => new ListBuilder<Organization>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(OrganizationUser)]),
          () => new ListBuilder<OrganizationUser>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(OrganizationUserPermission)]),
          () => new ListBuilder<OrganizationUserPermission>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(OrganizationUserPermissionRolesInner)]),
          () => new ListBuilder<OrganizationUserPermissionRolesInner>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(OrganizationUserRole)]),
          () => new ListBuilder<OrganizationUserRole>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(RedirectCallbackUrls)]),
          () => new ListBuilder<RedirectCallbackUrls>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Roles)]),
          () => new ListBuilder<Roles>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Subscriber)]),
          () => new ListBuilder<Subscriber>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(SubscribersSubscriber)]),
          () => new ListBuilder<SubscribersSubscriber>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(UpdateAPIApplicationsRequestApplicationsInner)
          ]),
          () =>
              new ListBuilder<UpdateAPIApplicationsRequestApplicationsInner>())
      ..addBuilderFactory(
          const FullType(BuiltList,
              const [const FullType(UpdateOrganizationUsersRequestUsersInner)]),
          () => new ListBuilder<UpdateOrganizationUsersRequestUsersInner>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [
            const FullType(UpdateRolePermissionsRequestPermissionsInner)
          ]),
          () => new ListBuilder<UpdateRolePermissionsRequestPermissionsInner>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(User)]),
          () => new ListBuilder<User>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(UserIdentity)]),
          () => new ListBuilder<UserIdentity>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(CreateOrganizationRequestFeatureFlagsEnum)
          ]),
          () => new MapBuilder<String,
              CreateOrganizationRequestFeatureFlagsEnum>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(GetOrganizationFeatureFlagsResponseFeatureFlagsValue)
          ]),
          () => new MapBuilder<String,
              GetOrganizationFeatureFlagsResponseFeatureFlagsValue>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(GetOrganizationFeatureFlagsResponseFeatureFlagsValue)
          ]),
          () => new MapBuilder<String,
              GetOrganizationFeatureFlagsResponseFeatureFlagsValue>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
