import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';


/// tests for OrganizationsApi
void main() {
  final instance = KindeApi().getOrganizationsApi();

  group(OrganizationsApi, () {
    // Add Organization Users
    //
    // Add existing users to an organization.
    //
    //Future<AddOrganizationUsersResponse> addOrganizationUsers(String orgCode, { AddOrganizationUsersRequest addOrganizationUsersRequest }) async
    test('test addOrganizationUsers', () async {
      // TODO
    });

    // Create Organization
    //
    // Create an organization.
    //
    //Future<CreateOrganizationResponse> createOrganization({ CreateOrganizationRequest createOrganizationRequest }) async
    test('test createOrganization', () async {
      // TODO
    });

    // Add Organization User Role
    //
    // Add role to an organization user.
    //
    //Future<SuccessResponse> createOrganizationUserRole(String orgCode, String userId, CreateOrganizationUserRoleRequest createOrganizationUserRoleRequest) async
    test('test createOrganizationUserRole', () async {
      // TODO
    });

    // Delete Organization
    //
    // Delete an organization.
    //
    //Future deleteOrganization(String orgCode) async
    test('test deleteOrganization', () async {
      // TODO
    });

    // Delete Organization Feature Flag Override
    //
    // Delete organization feature flag override.
    //
    //Future<SuccessResponse> deleteOrganizationFeatureFlagOverride(String orgCode, String featureFlagKey) async
    test('test deleteOrganizationFeatureFlagOverride', () async {
      // TODO
    });

    // Delete Organization Feature Flag Overrides
    //
    // Delete all organization feature flag overrides.
    //
    //Future<SuccessResponse> deleteOrganizationFeatureFlagOverrides(String orgCode) async
    test('test deleteOrganizationFeatureFlagOverrides', () async {
      // TODO
    });

    // Delete Organization User Role
    //
    // Delete role for an organization user.
    //
    //Future<SuccessResponse> deleteOrganizationUserRole(String orgCode, String userId, String roleId) async
    test('test deleteOrganizationUserRole', () async {
      // TODO
    });

    // Get Organization
    //
    // Gets an organization given the organization's code. 
    //
    //Future<Organization> getOrganization({ String code }) async
    test('test getOrganization', () async {
      // TODO
    });

    // List Organization Feature Flags
    //
    // Get all organization feature flags.
    //
    //Future<GetOrganizationFeatureFlagsResponse> getOrganizationFeatureFlags(String orgCode) async
    test('test getOrganizationFeatureFlags', () async {
      // TODO
    });

    // List Organization User Roles
    //
    // Get roles for an organization user.
    //
    //Future<GetOrganizationsUserRolesResponse> getOrganizationUserRoles(String orgCode, String userId) async
    test('test getOrganizationUserRoles', () async {
      // TODO
    });

    // List Organization Users
    //
    // Get users in an organization.
    //
    //Future<GetOrganizationUsersResponse> getOrganizationUsers(String orgCode, { String sort, int pageSize, String nextToken, String permissions }) async
    test('test getOrganizationUsers', () async {
      // TODO
    });

    // List Organizations
    //
    // Get a list of organizations. 
    //
    //Future<GetOrganizationsResponse> getOrganizations({ String sort, int pageSize, String nextToken }) async
    test('test getOrganizations', () async {
      // TODO
    });

    // Remove Organization User
    //
    // Remove user from an organization.
    //
    //Future<SuccessResponse> removeOrganizationUser(String orgCode, String userId) async
    test('test removeOrganizationUser', () async {
      // TODO
    });

    // Update Organization
    //
    // Update an organization.
    //
    //Future updateOrganization(String orgCode, { UpdateOrganizationRequest updateOrganizationRequest }) async
    test('test updateOrganization', () async {
      // TODO
    });

    // Update Organization Feature Flag Override
    //
    // Update organization feature flag override.
    //
    //Future<SuccessResponse> updateOrganizationFeatureFlagOverride(String orgCode, String featureFlagKey, String value) async
    test('test updateOrganizationFeatureFlagOverride', () async {
      // TODO
    });

    // Update Organization Users
    //
    // Update users that belong to an organization.
    //
    //Future<UpdateOrganizationUsersResponse> updateOrganizationUsers(String orgCode, { UpdateOrganizationUsersRequest updateOrganizationUsersRequest }) async
    test('test updateOrganizationUsers', () async {
      // TODO
    });

  });
}
