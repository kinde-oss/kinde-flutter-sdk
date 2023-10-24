// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_apis_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddAPIsRequest extends AddAPIsRequest {
  @override
  final String name;
  @override
  final String audience;

  factory _$AddAPIsRequest([void Function(AddAPIsRequestBuilder)? updates]) =>
      (new AddAPIsRequestBuilder()..update(updates))._build();

  _$AddAPIsRequest._({required this.name, required this.audience}) : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'AddAPIsRequest', 'name');
    BuiltValueNullFieldError.checkNotNull(
        audience, r'AddAPIsRequest', 'audience');
  }

  @override
  AddAPIsRequest rebuild(void Function(AddAPIsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddAPIsRequestBuilder toBuilder() =>
      new AddAPIsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddAPIsRequest &&
        name == other.name &&
        audience == other.audience;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, audience.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddAPIsRequest')
          ..add('name', name)
          ..add('audience', audience))
        .toString();
  }
}

class AddAPIsRequestBuilder
    implements Builder<AddAPIsRequest, AddAPIsRequestBuilder> {
  _$AddAPIsRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _audience;
  String? get audience => _$this._audience;
  set audience(String? audience) => _$this._audience = audience;

  AddAPIsRequestBuilder() {
    AddAPIsRequest._defaults(this);
  }

  AddAPIsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _audience = $v.audience;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddAPIsRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddAPIsRequest;
  }

  @override
  void update(void Function(AddAPIsRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddAPIsRequest build() => _build();

  _$AddAPIsRequest _build() {
    final _$result = _$v ??
        new _$AddAPIsRequest._(
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'AddAPIsRequest', 'name'),
            audience: BuiltValueNullFieldError.checkNotNull(
                audience, r'AddAPIsRequest', 'audience'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
