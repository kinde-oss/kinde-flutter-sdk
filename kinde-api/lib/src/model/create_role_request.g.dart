// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_role_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateRoleRequest extends CreateRoleRequest {
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? key;
  @override
  final bool? isDefaultRole;

  factory _$CreateRoleRequest(
          [void Function(CreateRoleRequestBuilder)? updates]) =>
      (new CreateRoleRequestBuilder()..update(updates))._build();

  _$CreateRoleRequest._(
      {this.name, this.description, this.key, this.isDefaultRole})
      : super._();

  @override
  CreateRoleRequest rebuild(void Function(CreateRoleRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateRoleRequestBuilder toBuilder() =>
      new CreateRoleRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateRoleRequest &&
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
    return (newBuiltValueToStringHelper(r'CreateRoleRequest')
          ..add('name', name)
          ..add('description', description)
          ..add('key', key)
          ..add('isDefaultRole', isDefaultRole))
        .toString();
  }
}

class CreateRoleRequestBuilder
    implements Builder<CreateRoleRequest, CreateRoleRequestBuilder> {
  _$CreateRoleRequest? _$v;

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

  CreateRoleRequestBuilder() {
    CreateRoleRequest._defaults(this);
  }

  CreateRoleRequestBuilder get _$this {
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
  void replace(CreateRoleRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateRoleRequest;
  }

  @override
  void update(void Function(CreateRoleRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateRoleRequest build() => _build();

  _$CreateRoleRequest _build() {
    final _$result = _$v ??
        new _$CreateRoleRequest._(
            name: name,
            description: description,
            key: key,
            isDefaultRole: isDefaultRole);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
