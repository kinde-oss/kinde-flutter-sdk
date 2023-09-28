// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_application_response_application.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetApplicationResponseApplication
    extends GetApplicationResponseApplication {
  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? clientId;
  @override
  final String? clientSecret;

  factory _$GetApplicationResponseApplication(
          [void Function(GetApplicationResponseApplicationBuilder)? updates]) =>
      (new GetApplicationResponseApplicationBuilder()..update(updates))
          ._build();

  _$GetApplicationResponseApplication._(
      {this.id, this.name, this.type, this.clientId, this.clientSecret})
      : super._();

  @override
  GetApplicationResponseApplication rebuild(
          void Function(GetApplicationResponseApplicationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetApplicationResponseApplicationBuilder toBuilder() =>
      new GetApplicationResponseApplicationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetApplicationResponseApplication &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        clientId == other.clientId &&
        clientSecret == other.clientSecret;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, clientSecret.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetApplicationResponseApplication')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('clientId', clientId)
          ..add('clientSecret', clientSecret))
        .toString();
  }
}

class GetApplicationResponseApplicationBuilder
    implements
        Builder<GetApplicationResponseApplication,
            GetApplicationResponseApplicationBuilder> {
  _$GetApplicationResponseApplication? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  String? _clientId;
  String? get clientId => _$this._clientId;
  set clientId(String? clientId) => _$this._clientId = clientId;

  String? _clientSecret;
  String? get clientSecret => _$this._clientSecret;
  set clientSecret(String? clientSecret) => _$this._clientSecret = clientSecret;

  GetApplicationResponseApplicationBuilder() {
    GetApplicationResponseApplication._defaults(this);
  }

  GetApplicationResponseApplicationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _clientId = $v.clientId;
      _clientSecret = $v.clientSecret;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetApplicationResponseApplication other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetApplicationResponseApplication;
  }

  @override
  void update(
      void Function(GetApplicationResponseApplicationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetApplicationResponseApplication build() => _build();

  _$GetApplicationResponseApplication _build() {
    final _$result = _$v ??
        new _$GetApplicationResponseApplication._(
            id: id,
            name: name,
            type: type,
            clientId: clientId,
            clientSecret: clientSecret);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
