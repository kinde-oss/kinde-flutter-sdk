import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import '../test/test_helpers/dio_mock.dart';
import 'package:dio/dio.dart';

/// tests for OrganizationsApi
void main() {
  //final instance = KindeApi().getOrganizationsApi();
  Dio dio = DioAdapterMock();
  final instance = KindeApi(dio: dio).getOrganizationsApi();

  group(OrganizationsApi, () {
    // Add Organization Users
    //
    // Add existing users to an organization.
    //
    //Future<AddOrganizationUsersResponse> addOrganizationUsers(String orgCode, { AddOrganizationUsersRequest addOrganizationUsersRequest }) async
    test('test addOrganizationUsers', () async {
      // TODO
      final responseData = await instance.addOrganizationUsers(
          orgCode: 'test_org_code',
          addOrganizationUsersRequest: AddOrganizationUsersRequest());
      expect(responseData, isNotNull);
    });

    // Create Organization
    //
    // Create an organization.
    //
    //Future<CreateOrganizationResponse> createOrganization({ CreateOrganizationRequest createOrganizationRequest }) async
    test('test createOrganization', () async {
      // TODO
      final responseData = await instance.createOrganization(
          createOrganizationRequest: CreateOrganizationRequest());
      expect(responseData, isNotNull);
    });

    // Add Organization User Role
    //
    // Add role to an organization user.
    //
    //Future<SuccessResponse> createOrganizationUserRole(String orgCode, String userId, CreateOrganizationUserRoleRequest createOrganizationUserRoleRequest) async
    test('test createOrganizationUserRole', () async {
      // TODO
      final responseData = await instance.createOrganizationUserRole(
          orgCode: 'test_org_code',
          userId: 'test_user_id',
          createOrganizationUserRoleRequest:
              CreateOrganizationUserRoleRequest());
      expect(responseData, isNotNull);
    });

    // Delete Organization
    //
    // Delete an organization.
    //
    //Future deleteOrganization(String orgCode) async
    test('test deleteOrganization', () async {
      // TODO
      final responseData =
          await instance.deleteOrganization(orgCode: 'test_org_code');
      expect(responseData, isNotNull);
    });

    // Delete Organization Feature Flag Override
    //
    // Delete organization feature flag override.
    //
    //Future<SuccessResponse> deleteOrganizationFeatureFlagOverride(String orgCode, String featureFlagKey) async
    test('test deleteOrganizationFeatureFlagOverride', () async {
      // TODO
      final responseData = await instance.deleteOrganizationFeatureFlagOverride(
          orgCode: 'test_org_code', featureFlagKey: 'test_key');
      expect(responseData, isNotNull);
    });

    // Delete Organization Feature Flag Overrides
    //
    // Delete all organization feature flag overrides.
    //
    //Future<SuccessResponse> deleteOrganizationFeatureFlagOverrides(String orgCode) async
    test('test deleteOrganizationFeatureFlagOverrides', () async {
      // TODO
      final responseData = await instance
          .deleteOrganizationFeatureFlagOverrides(orgCode: 'test_org_code');
      expect(responseData, isNotNull);
    });

    // Delete Organization User Role
    //
    // Delete role for an organization user.
    //
    //Future<SuccessResponse> deleteOrganizationUserRole(String orgCode, String userId, String roleId) async
    test('test deleteOrganizationUserRole', () async {
      // TODO
      final responseData = await instance.deleteOrganizationUserRole(
          orgCode: 'test_org_code',
          userId: 'test_user_id',
          roleId: 'test_role_id');
      expect(responseData, isNotNull);
    });

    // Get Organization
    //
    // Gets an organization given the organization's code.
    //
    //Future<Organization> getOrganization({ String code }) async
    test('test getOrganization', () async {
      // TODO
      final responseData =
          await instance.getOrganization(code: 'test_org_code');
      expect(responseData, isNotNull);
    });

    // List Organization Feature Flags
    //
    // Get all organization feature flags.
    //
    //Future<GetOrganizationFeatureFlagsResponse> getOrganizationFeatureFlags(String orgCode) async
    test('test getOrganizationFeatureFlags', () async {
      // TODO
      final responseData =
          await instance.getOrganizationFeatureFlags(orgCode: 'test_org_code');
      expect(responseData, isNotNull);
    });

    // List Organization User Roles
    //
    // Get roles for an organization user.
    //
    //Future<GetOrganizationsUserRolesResponse> getOrganizationUserRoles(String orgCode, String userId) async
    test('test getOrganizationUserRoles', () async {
      // TODO
      final responseData = await instance.getOrganizationUserRoles(
          orgCode: 'test_org_code', userId: 'test_user_id');
      expect(responseData, isNotNull);
    });

    // List Organization Users
    //
    // Get users in an organization.
    //
    //Future<GetOrganizationUsersResponse> getOrganizationUsers(String orgCode, { String sort, int pageSize, String nextToken, String permissions }) async
    test('test getOrganizationUsers', () async {
      // TODO
      final responseData =
          await instance.getOrganizationUsers(orgCode: 'test_org_code');
      expect(responseData, isNotNull);
    });

    // List Organizations
    //
    // Get a list of organizations.
    //
    //Future<GetOrganizationsResponse> getOrganizations({ String sort, int pageSize, String nextToken }) async
    test('test getOrganizations', () async {
      // TODO
      final responseData = await instance.getOrganizations();
      expect(responseData, isNotNull);
    });

    // Remove Organization User
    //
    // Remove user from an organization.
    //
    //Future<SuccessResponse> removeOrganizationUser(String orgCode, String userId) async
    test('test removeOrganizationUser', () async {
      // TODO
      final responseData = await instance.removeOrganizationUser(
          orgCode: 'test_org_code', userId: 'test_user_id');
      expect(responseData, isNotNull);
    });

    // Update Organization
    //
    // Update an organization.
    //
    //Future updateOrganization(String orgCode, { UpdateOrganizationRequest updateOrganizationRequest }) async
    test('test updateOrganization', () async {
      // TODO
      final responseData = await instance.updateOrganization(
          orgCode: 'test_org_code',
          updateOrganizationRequest: UpdateOrganizationRequest());
      expect(responseData, isNotNull);
    });

    // Update Organization Feature Flag Override
    //
    // Update organization feature flag override.
    //
    //Future<SuccessResponse> updateOrganizationFeatureFlagOverride(String orgCode, String featureFlagKey, String value) async
    test('test updateOrganizationFeatureFlagOverride', () async {
      // TODO
      final responseData = await instance.updateOrganizationFeatureFlagOverride(
          orgCode: 'test_org_code',
          featureFlagKey: 'test_key',
          value: 'test_value');
      expect(responseData, isNotNull);
    });

    // Update Organization Users
    //
    // Update users that belong to an organization.
    //
    //Future<UpdateOrganizationUsersResponse> updateOrganizationUsers(String orgCode, { UpdateOrganizationUsersRequest updateOrganizationUsersRequest }) async
    test('test updateOrganizationUsers', () async {
      // TODO
      final responseData = await instance.updateOrganizationUsers(
          orgCode: 'test_org_code',
          updateOrganizationUsersRequest: UpdateOrganizationUsersRequest());
      expect(responseData, isNotNull);
    });
  });
}
