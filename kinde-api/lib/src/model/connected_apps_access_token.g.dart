// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connected_apps_access_token.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectedAppsAccessToken extends ConnectedAppsAccessToken {
  @override
  final String? accessToken;
  @override
  final String? accessTokenExpiry;

  factory _$ConnectedAppsAccessToken(
          [void Function(ConnectedAppsAccessTokenBuilder)? updates]) =>
      (new ConnectedAppsAccessTokenBuilder()..update(updates))._build();

  _$ConnectedAppsAccessToken._({this.accessToken, this.accessTokenExpiry})
      : super._();

  @override
  ConnectedAppsAccessToken rebuild(
          void Function(ConnectedAppsAccessTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectedAppsAccessTokenBuilder toBuilder() =>
      new ConnectedAppsAccessTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectedAppsAccessToken &&
        accessToken == other.accessToken &&
        accessTokenExpiry == other.accessTokenExpiry;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, accessTokenExpiry.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectedAppsAccessToken')
          ..add('accessToken', accessToken)
          ..add('accessTokenExpiry', accessTokenExpiry))
        .toString();
  }
}

class ConnectedAppsAccessTokenBuilder
    implements
        Builder<ConnectedAppsAccessToken, ConnectedAppsAccessTokenBuilder> {
  _$ConnectedAppsAccessToken? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _accessTokenExpiry;
  String? get accessTokenExpiry => _$this._accessTokenExpiry;
  set accessTokenExpiry(String? accessTokenExpiry) =>
      _$this._accessTokenExpiry = accessTokenExpiry;

  ConnectedAppsAccessTokenBuilder() {
    ConnectedAppsAccessToken._defaults(this);
  }

  ConnectedAppsAccessTokenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _accessTokenExpiry = $v.accessTokenExpiry;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectedAppsAccessToken other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectedAppsAccessToken;
  }

  @override
  void update(void Function(ConnectedAppsAccessTokenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectedAppsAccessToken build() => _build();

  _$ConnectedAppsAccessToken _build() {
    final _$result = _$v ??
        new _$ConnectedAppsAccessToken._(
            accessToken: accessToken, accessTokenExpiry: accessTokenExpiry);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
