import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:kinde_flutter_sdk/src/model/claim/claim.dart';
import 'package:kinde_flutter_sdk/src/model/claim/flag.dart';
import 'package:kinde_flutter_sdk/src/model/claim/claim_organization.dart';
import 'package:kinde_flutter_sdk/src/model/claim/claim_organizations.dart';
import 'package:kinde_flutter_sdk/src/model/claim/claim_permission.dart';
import 'package:kinde_flutter_sdk/src/model/claim/claim_permissions.dart';
import 'package:kinde_flutter_sdk/src/model/claim/user_details.dart';
import 'package:kinde_flutter_sdk/src/model/token_type.dart';
import 'package:kinde_flutter_sdk/src/token/auth_state.dart';

mixin TokenUtils implements ClaimApi {
  final _permissionsClaim = "permissions";
  final _orgCodeClaim = "org_code";
  final _orgCodesClaim = "org_codes";
  final _subClaim = "sub";
  final _givenNameClaim = "given_name";
  final _familyNameClaim = "family_name";
  final _emailClaim = "email";
  final _pictureClaim = "picture";
  final _featureFlagsClaim = "feature_flags";

  final _flagType = "t";
  final _flagValue = "v";

  @protected
  AuthState? authState;

  @override
  UserDetails getUserDetails() {
    return UserDetails(
      _getClaim<String>(_subClaim, tokenType: TokenType.idToken) ?? '',
      _getClaim<String>(_givenNameClaim, tokenType: TokenType.idToken) ?? '',
      _getClaim<String>(_familyNameClaim, tokenType: TokenType.idToken) ?? '',
      _getClaim<String>(_emailClaim, tokenType: TokenType.idToken) ?? '',
      _getClaim<String>(_pictureClaim, tokenType: TokenType.idToken) ?? '',
    );
  }

  @override
  Claim getClaim(
      {required String claim, TokenType tokenType = TokenType.accessToken}) {
    return Claim(claim, _getClaim(claim, tokenType: tokenType));
  }

  @override
  ClaimPermission getPermission(String permission) {
    return ClaimPermission(_getClaim<String>(_orgCodeClaim) ?? '',
        (_getClaim<List<String>>(_permissionsClaim) ?? []).contains(permission));
  }

  @override
  ClaimPermissions getPermissions() {
    return ClaimPermissions(_getClaim<String>(_orgCodeClaim) ?? '',
        _getClaim<List<String>?>(_permissionsClaim) ?? []);
  }

  @override
  ClaimOrganizations getUserOrganizations() {
    return ClaimOrganizations(_getClaim<List<String>>(_orgCodesClaim, tokenType: TokenType.idToken) ?? []);
  }

  @override
  ClaimOrganization getOrganization() {
    return ClaimOrganization(_getClaim<String>(_orgCodeClaim) ?? '');
  }

  @override
  Flag? getFlag({required String code, defaultValue, FlagType? type}) {
    final flagClaim = _getClaim(_featureFlagsClaim) as Map<String, dynamic>;
    if (!flagClaim.containsKey(code) && defaultValue != null) {
      return Flag(code, null, defaultValue, true);
    }
    if (flagClaim.containsKey(code)) {
      final flagObj = flagClaim[code];
      if (type != null && type.character != flagObj[_flagType]) {
        return null;
      }
      return Flag(code, _flagTypeFromString(flagObj[_flagType]),
          flagObj[_flagValue], false);
    }
    return null;
  }

  @override
  bool? getBooleanFlag({required String code, bool? defaultValue}) {
    return getFlag(
            code: code, defaultValue: defaultValue, type: FlagType.bool)
        ?.value as bool?;
  }

  @override
  String? getStringFlag({required String code, String? defaultValue}) {
    return getFlag(
            code: code, defaultValue: defaultValue, type: FlagType.string)
        ?.value as String?;
  }

  @override
  int? getIntegerFlag({required String code, int? defaultValue}) {
    return getFlag(
            code: code, defaultValue: defaultValue, type: FlagType.integer)
        ?.value as int?;
  }

  Map parseToken(String? token) {
    final parts = token?.split(r'.');
    return jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts![1]))));
  }

  T? _getClaim<T>(String claim, {TokenType tokenType = TokenType.accessToken}) {
    final token = authState?.getToken(tokenType);
    if (token != null) {
      final decoded = parseToken(token);
      if (decoded.containsKey(claim)) {
        if(decoded[claim] is List) {
          return decoded[claim].cast<String>() as T?;
        }
        return decoded[claim] as T?;
      }
    }
    return null;
  }

  FlagType? _flagTypeFromString(String character) {
    switch (character) {
      case 's':
        return FlagType.string;
      case 'i':
        return FlagType.integer;
      case 'b':
        return FlagType.bool;
      default:
        return null;
    }
  }
}

abstract class ClaimApi {
  UserDetails getUserDetails();

  Claim getClaim(
      {required String claim, TokenType tokenType = TokenType.accessToken});

  ClaimPermissions getPermissions();

  ClaimPermission getPermission(String permission);

  ClaimOrganizations getUserOrganizations();

  ClaimOrganization getOrganization();

  Flag? getFlag(
      {required String code, dynamic defaultValue, FlagType? type});

  bool? getBooleanFlag({required String code, bool? defaultValue});

  String? getStringFlag({required String code, String? defaultValue});

  int? getIntegerFlag({required String code, int? defaultValue});
}
