// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_organization_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateOrganizationResponse extends CreateOrganizationResponse {
  @override
  final String? message;
  @override
  final String? code;
  @override
  final CreateOrganizationResponseOrganization? organization;

  factory _$CreateOrganizationResponse(
          [void Function(CreateOrganizationResponseBuilder)? updates]) =>
      (new CreateOrganizationResponseBuilder()..update(updates))._build();

  _$CreateOrganizationResponse._({this.message, this.code, this.organization})
      : super._();

  @override
  CreateOrganizationResponse rebuild(
          void Function(CreateOrganizationResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateOrganizationResponseBuilder toBuilder() =>
      new CreateOrganizationResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateOrganizationResponse &&
        message == other.message &&
        code == other.code &&
        organization == other.organization;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, organization.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateOrganizationResponse')
          ..add('message', message)
          ..add('code', code)
          ..add('organization', organization))
        .toString();
  }
}

class CreateOrganizationResponseBuilder
    implements
        Builder<CreateOrganizationResponse, CreateOrganizationResponseBuilder> {
  _$CreateOrganizationResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  CreateOrganizationResponseOrganizationBuilder? _organization;
  CreateOrganizationResponseOrganizationBuilder get organization =>
      _$this._organization ??=
          new CreateOrganizationResponseOrganizationBuilder();
  set organization(
          CreateOrganizationResponseOrganizationBuilder? organization) =>
      _$this._organization = organization;

  CreateOrganizationResponseBuilder() {
    CreateOrganizationResponse._defaults(this);
  }

  CreateOrganizationResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _code = $v.code;
      _organization = $v.organization?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateOrganizationResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateOrganizationResponse;
  }

  @override
  void update(void Function(CreateOrganizationResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateOrganizationResponse build() => _build();

  _$CreateOrganizationResponse _build() {
    _$CreateOrganizationResponse _$result;
    try {
      _$result = _$v ??
          new _$CreateOrganizationResponse._(
              message: message,
              code: code,
              organization: _organization?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'organization';
        _organization?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateOrganizationResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
