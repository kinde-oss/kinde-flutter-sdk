// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replace_redirect_callback_urls_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ReplaceRedirectCallbackURLsRequest
    extends ReplaceRedirectCallbackURLsRequest {
  @override
  final BuiltList<String>? urls;

  factory _$ReplaceRedirectCallbackURLsRequest(
          [void Function(ReplaceRedirectCallbackURLsRequestBuilder)?
              updates]) =>
      (new ReplaceRedirectCallbackURLsRequestBuilder()..update(updates))
          ._build();

  _$ReplaceRedirectCallbackURLsRequest._({this.urls}) : super._();

  @override
  ReplaceRedirectCallbackURLsRequest rebuild(
          void Function(ReplaceRedirectCallbackURLsRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReplaceRedirectCallbackURLsRequestBuilder toBuilder() =>
      new ReplaceRedirectCallbackURLsRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReplaceRedirectCallbackURLsRequest && urls == other.urls;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, urls.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReplaceRedirectCallbackURLsRequest')
          ..add('urls', urls))
        .toString();
  }
}

class ReplaceRedirectCallbackURLsRequestBuilder
    implements
        Builder<ReplaceRedirectCallbackURLsRequest,
            ReplaceRedirectCallbackURLsRequestBuilder> {
  _$ReplaceRedirectCallbackURLsRequest? _$v;

  ListBuilder<String>? _urls;
  ListBuilder<String> get urls => _$this._urls ??= new ListBuilder<String>();
  set urls(ListBuilder<String>? urls) => _$this._urls = urls;

  ReplaceRedirectCallbackURLsRequestBuilder() {
    ReplaceRedirectCallbackURLsRequest._defaults(this);
  }

  ReplaceRedirectCallbackURLsRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _urls = $v.urls?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReplaceRedirectCallbackURLsRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReplaceRedirectCallbackURLsRequest;
  }

  @override
  void update(
      void Function(ReplaceRedirectCallbackURLsRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReplaceRedirectCallbackURLsRequest build() => _build();

  _$ReplaceRedirectCallbackURLsRequest _build() {
    _$ReplaceRedirectCallbackURLsRequest _$result;
    try {
      _$result = _$v ??
          new _$ReplaceRedirectCallbackURLsRequest._(urls: _urls?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'urls';
        _urls?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReplaceRedirectCallbackURLsRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
