import 'package:kinde_flutter_sdk/src/model/claim/claim_organization.dart';

class ClaimPermission extends ClaimOrganization{
  final bool isGranted;

  ClaimPermission(String orgCode, this.isGranted) : super(orgCode);

  @override
  String toString() {
    return 'ClaimPermission{isGranted: $isGranted, orgCode: $orgCode}';
  }
}
