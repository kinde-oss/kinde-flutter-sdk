// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_organization_response_organization.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateOrganizationResponseOrganization
    extends CreateOrganizationResponseOrganization {
  @override
  final String? code;

  factory _$CreateOrganizationResponseOrganization(
          [void Function(CreateOrganizationResponseOrganizationBuilder)?
              updates]) =>
      (new CreateOrganizationResponseOrganizationBuilder()..update(updates))
          ._build();

  _$CreateOrganizationResponseOrganization._({this.code}) : super._();

  @override
  CreateOrganizationResponseOrganization rebuild(
          void Function(CreateOrganizationResponseOrganizationBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateOrganizationResponseOrganizationBuilder toBuilder() =>
      new CreateOrganizationResponseOrganizationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateOrganizationResponseOrganization &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'CreateOrganizationResponseOrganization')
          ..add('code', code))
        .toString();
  }
}

class CreateOrganizationResponseOrganizationBuilder
    implements
        Builder<CreateOrganizationResponseOrganization,
            CreateOrganizationResponseOrganizationBuilder> {
  _$CreateOrganizationResponseOrganization? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  CreateOrganizationResponseOrganizationBuilder() {
    CreateOrganizationResponseOrganization._defaults(this);
  }

  CreateOrganizationResponseOrganizationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateOrganizationResponseOrganization other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateOrganizationResponseOrganization;
  }

  @override
  void update(
      void Function(CreateOrganizationResponseOrganizationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateOrganizationResponseOrganization build() => _build();

  _$CreateOrganizationResponseOrganization _build() {
    final _$result =
        _$v ?? new _$CreateOrganizationResponseOrganization._(code: code);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
