// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_subscriber_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetSubscriberResponse extends GetSubscriberResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<Subscriber>? subscribers;

  factory _$GetSubscriberResponse(
          [void Function(GetSubscriberResponseBuilder)? updates]) =>
      (new GetSubscriberResponseBuilder()..update(updates))._build();

  _$GetSubscriberResponse._({this.code, this.message, this.subscribers})
      : super._();

  @override
  GetSubscriberResponse rebuild(
          void Function(GetSubscriberResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetSubscriberResponseBuilder toBuilder() =>
      new GetSubscriberResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetSubscriberResponse &&
        code == other.code &&
        message == other.message &&
        subscribers == other.subscribers;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, subscribers.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetSubscriberResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('subscribers', subscribers))
        .toString();
  }
}

class GetSubscriberResponseBuilder
    implements Builder<GetSubscriberResponse, GetSubscriberResponseBuilder> {
  _$GetSubscriberResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<Subscriber>? _subscribers;
  ListBuilder<Subscriber> get subscribers =>
      _$this._subscribers ??= new ListBuilder<Subscriber>();
  set subscribers(ListBuilder<Subscriber>? subscribers) =>
      _$this._subscribers = subscribers;

  GetSubscriberResponseBuilder() {
    GetSubscriberResponse._defaults(this);
  }

  GetSubscriberResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _subscribers = $v.subscribers?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetSubscriberResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetSubscriberResponse;
  }

  @override
  void update(void Function(GetSubscriberResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetSubscriberResponse build() => _build();

  _$GetSubscriberResponse _build() {
    _$GetSubscriberResponse _$result;
    try {
      _$result = _$v ??
          new _$GetSubscriberResponse._(
              code: code, message: message, subscribers: _subscribers?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subscribers';
        _subscribers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetSubscriberResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
