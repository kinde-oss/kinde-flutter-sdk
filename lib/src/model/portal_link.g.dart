// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portal_link.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$PortalLink extends PortalLink {
  @override
  final String? url;

  factory _$PortalLink([void Function(PortalLinkBuilder)? updates]) =>
      (PortalLinkBuilder()..update(updates))._build();

  _$PortalLink._({this.url}) : super._();
  @override
  PortalLink rebuild(void Function(PortalLinkBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PortalLinkBuilder toBuilder() => PortalLinkBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PortalLink && url == other.url;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PortalLink')..add('url', url))
        .toString();
  }
}

class PortalLinkBuilder implements Builder<PortalLink, PortalLinkBuilder> {
  _$PortalLink? _$v;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  PortalLinkBuilder() {
    PortalLink._defaults(this);
  }

  PortalLinkBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _url = $v.url;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PortalLink other) {
    _$v = other as _$PortalLink;
  }

  @override
  void update(void Function(PortalLinkBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PortalLink build() => _build();

  _$PortalLink _build() {
    final _$result = _$v ??
        _$PortalLink._(
          url: url,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
