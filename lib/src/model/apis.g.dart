// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apis.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Apis extends Apis {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? audience;
  @override
  final bool? isManagementApi;

  factory _$Apis([void Function(ApisBuilder)? updates]) =>
      (new ApisBuilder()..update(updates))._build();

  _$Apis._({this.id, this.name, this.audience, this.isManagementApi})
      : super._();

  @override
  Apis rebuild(void Function(ApisBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ApisBuilder toBuilder() => new ApisBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Apis &&
        id == other.id &&
        name == other.name &&
        audience == other.audience &&
        isManagementApi == other.isManagementApi;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, audience.hashCode);
    _$hash = $jc(_$hash, isManagementApi.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Apis')
          ..add('id', id)
          ..add('name', name)
          ..add('audience', audience)
          ..add('isManagementApi', isManagementApi))
        .toString();
  }
}

class ApisBuilder implements Builder<Apis, ApisBuilder> {
  _$Apis? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _audience;
  String? get audience => _$this._audience;
  set audience(String? audience) => _$this._audience = audience;

  bool? _isManagementApi;
  bool? get isManagementApi => _$this._isManagementApi;
  set isManagementApi(bool? isManagementApi) =>
      _$this._isManagementApi = isManagementApi;

  ApisBuilder() {
    Apis._defaults(this);
  }

  ApisBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _audience = $v.audience;
      _isManagementApi = $v.isManagementApi;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Apis other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Apis;
  }

  @override
  void update(void Function(ApisBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Apis build() => _build();

  _$Apis _build() {
    final _$result = _$v ??
        new _$Apis._(
            id: id,
            name: name,
            audience: audience,
            isManagementApi: isManagementApi);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
