// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_application_response_application.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateApplicationResponseApplication
    extends CreateApplicationResponseApplication {
  @override
  final String? id;
  @override
  final String? clientId;
  @override
  final String? clientSecret;

  factory _$CreateApplicationResponseApplication(
          [void Function(CreateApplicationResponseApplicationBuilder)?
              updates]) =>
      (new CreateApplicationResponseApplicationBuilder()..update(updates))
          ._build();

  _$CreateApplicationResponseApplication._(
      {this.id, this.clientId, this.clientSecret})
      : super._();

  @override
  CreateApplicationResponseApplication rebuild(
          void Function(CreateApplicationResponseApplicationBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateApplicationResponseApplicationBuilder toBuilder() =>
      new CreateApplicationResponseApplicationBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateApplicationResponseApplication &&
        id == other.id &&
        clientId == other.clientId &&
        clientSecret == other.clientSecret;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, clientSecret.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateApplicationResponseApplication')
          ..add('id', id)
          ..add('clientId', clientId)
          ..add('clientSecret', clientSecret))
        .toString();
  }
}

class CreateApplicationResponseApplicationBuilder
    implements
        Builder<CreateApplicationResponseApplication,
            CreateApplicationResponseApplicationBuilder> {
  _$CreateApplicationResponseApplication? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _clientId;
  String? get clientId => _$this._clientId;
  set clientId(String? clientId) => _$this._clientId = clientId;

  String? _clientSecret;
  String? get clientSecret => _$this._clientSecret;
  set clientSecret(String? clientSecret) => _$this._clientSecret = clientSecret;

  CreateApplicationResponseApplicationBuilder() {
    CreateApplicationResponseApplication._defaults(this);
  }

  CreateApplicationResponseApplicationBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _clientId = $v.clientId;
      _clientSecret = $v.clientSecret;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateApplicationResponseApplication other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateApplicationResponseApplication;
  }

  @override
  void update(
      void Function(CreateApplicationResponseApplicationBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateApplicationResponseApplication build() => _build();

  _$CreateApplicationResponseApplication _build() {
    final _$result = _$v ??
        new _$CreateApplicationResponseApplication._(
            id: id, clientId: clientId, clientSecret: clientSecret);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
