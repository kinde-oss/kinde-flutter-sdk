import 'package:kinde_flutter_sdk/src/model/claim/claim_organization.dart';

class ClaimPermissions extends ClaimOrganization {
  final List<String> permissions;

  ClaimPermissions(String orgCode, this.permissions): super(orgCode);

  @override
  String toString() {
    return 'ClaimPermissions{permissions: $permissions, orgCode: $orgCode}';
  }
}
