// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_introspect.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TokenIntrospect extends TokenIntrospect {
  @override
  final bool? active;
  @override
  final BuiltList<String>? aud;
  @override
  final String? clientId;
  @override
  final String? exp;
  @override
  final String? iat;

  factory _$TokenIntrospect([void Function(TokenIntrospectBuilder)? updates]) =>
      (new TokenIntrospectBuilder()..update(updates))._build();

  _$TokenIntrospect._(
      {this.active, this.aud, this.clientId, this.exp, this.iat})
      : super._();

  @override
  TokenIntrospect rebuild(void Function(TokenIntrospectBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TokenIntrospectBuilder toBuilder() =>
      new TokenIntrospectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TokenIntrospect &&
        active == other.active &&
        aud == other.aud &&
        clientId == other.clientId &&
        exp == other.exp &&
        iat == other.iat;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, active.hashCode);
    _$hash = $jc(_$hash, aud.hashCode);
    _$hash = $jc(_$hash, clientId.hashCode);
    _$hash = $jc(_$hash, exp.hashCode);
    _$hash = $jc(_$hash, iat.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TokenIntrospect')
          ..add('active', active)
          ..add('aud', aud)
          ..add('clientId', clientId)
          ..add('exp', exp)
          ..add('iat', iat))
        .toString();
  }
}

class TokenIntrospectBuilder
    implements Builder<TokenIntrospect, TokenIntrospectBuilder> {
  _$TokenIntrospect? _$v;

  bool? _active;
  bool? get active => _$this._active;
  set active(bool? active) => _$this._active = active;

  ListBuilder<String>? _aud;
  ListBuilder<String> get aud => _$this._aud ??= new ListBuilder<String>();
  set aud(ListBuilder<String>? aud) => _$this._aud = aud;

  String? _clientId;
  String? get clientId => _$this._clientId;
  set clientId(String? clientId) => _$this._clientId = clientId;

  String? _exp;
  String? get exp => _$this._exp;
  set exp(String? exp) => _$this._exp = exp;

  String? _iat;
  String? get iat => _$this._iat;
  set iat(String? iat) => _$this._iat = iat;

  TokenIntrospectBuilder() {
    TokenIntrospect._defaults(this);
  }

  TokenIntrospectBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _active = $v.active;
      _aud = $v.aud?.toBuilder();
      _clientId = $v.clientId;
      _exp = $v.exp;
      _iat = $v.iat;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TokenIntrospect other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TokenIntrospect;
  }

  @override
  void update(void Function(TokenIntrospectBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TokenIntrospect build() => _build();

  _$TokenIntrospect _build() {
    _$TokenIntrospect _$result;
    try {
      _$result = _$v ??
          new _$TokenIntrospect._(
              active: active,
              aud: _aud?.build(),
              clientId: clientId,
              exp: exp,
              iat: iat);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'aud';
        _aud?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TokenIntrospect', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
