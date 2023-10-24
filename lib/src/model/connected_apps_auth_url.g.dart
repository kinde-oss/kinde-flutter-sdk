// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connected_apps_auth_url.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConnectedAppsAuthUrl extends ConnectedAppsAuthUrl {
  @override
  final String? url;
  @override
  final String? sessionId;

  factory _$ConnectedAppsAuthUrl(
          [void Function(ConnectedAppsAuthUrlBuilder)? updates]) =>
      (new ConnectedAppsAuthUrlBuilder()..update(updates))._build();

  _$ConnectedAppsAuthUrl._({this.url, this.sessionId}) : super._();

  @override
  ConnectedAppsAuthUrl rebuild(
          void Function(ConnectedAppsAuthUrlBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConnectedAppsAuthUrlBuilder toBuilder() =>
      new ConnectedAppsAuthUrlBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConnectedAppsAuthUrl &&
        url == other.url &&
        sessionId == other.sessionId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, sessionId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConnectedAppsAuthUrl')
          ..add('url', url)
          ..add('sessionId', sessionId))
        .toString();
  }
}

class ConnectedAppsAuthUrlBuilder
    implements Builder<ConnectedAppsAuthUrl, ConnectedAppsAuthUrlBuilder> {
  _$ConnectedAppsAuthUrl? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  String? _sessionId;
  String? get sessionId => _$this._sessionId;
  set sessionId(String? sessionId) => _$this._sessionId = sessionId;

  ConnectedAppsAuthUrlBuilder() {
    ConnectedAppsAuthUrl._defaults(this);
  }

  ConnectedAppsAuthUrlBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _sessionId = $v.sessionId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConnectedAppsAuthUrl other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConnectedAppsAuthUrl;
  }

  @override
  void update(void Function(ConnectedAppsAuthUrlBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConnectedAppsAuthUrl build() => _build();

  _$ConnectedAppsAuthUrl _build() {
    final _$result =
        _$v ?? new _$ConnectedAppsAuthUrl._(url: url, sessionId: sessionId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
