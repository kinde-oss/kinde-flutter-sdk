// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_roles_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateRolesRequest extends UpdateRolesRequest {
  @override
  final String name;
  @override
  final String? description;
  @override
  final String key;
  @override
  final bool? isDefaultRole;

  factory _$UpdateRolesRequest(
          [void Function(UpdateRolesRequestBuilder)? updates]) =>
      (new UpdateRolesRequestBuilder()..update(updates))._build();

  _$UpdateRolesRequest._(
      {required this.name,
      this.description,
      required this.key,
      this.isDefaultRole})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'UpdateRolesRequest', 'name');
    BuiltValueNullFieldError.checkNotNull(key, r'UpdateRolesRequest', 'key');
  }

  @override
  UpdateRolesRequest rebuild(
          void Function(UpdateRolesRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateRolesRequestBuilder toBuilder() =>
      new UpdateRolesRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateRolesRequest &&
        name == other.name &&
        description == other.description &&
        key == other.key &&
        isDefaultRole == other.isDefaultRole;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, description.hashCode);
    _$hash = $jc(_$hash, key.hashCode);
    _$hash = $jc(_$hash, isDefaultRole.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateRolesRequest')
          ..add('name', name)
          ..add('description', description)
          ..add('key', key)
          ..add('isDefaultRole', isDefaultRole))
        .toString();
  }
}

class UpdateRolesRequestBuilder
    implements Builder<UpdateRolesRequest, UpdateRolesRequestBuilder> {
  _$UpdateRolesRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _key;
  String? get key => _$this._key;
  set key(String? key) => _$this._key = key;

  bool? _isDefaultRole;
  bool? get isDefaultRole => _$this._isDefaultRole;
  set isDefaultRole(bool? isDefaultRole) =>
      _$this._isDefaultRole = isDefaultRole;

  UpdateRolesRequestBuilder() {
    UpdateRolesRequest._defaults(this);
  }

  UpdateRolesRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _description = $v.description;
      _key = $v.key;
      _isDefaultRole = $v.isDefaultRole;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateRolesRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateRolesRequest;
  }

  @override
  void update(void Function(UpdateRolesRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateRolesRequest build() => _build();

  _$UpdateRolesRequest _build() {
    final _$result = _$v ??
        new _$UpdateRolesRequest._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'UpdateRolesRequest', 'name'),
            description: description,
            key: BuiltValueNullFieldError.checkNotNull(
                key, r'UpdateRolesRequest', 'key'),
            isDefaultRole: isDefaultRole);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
