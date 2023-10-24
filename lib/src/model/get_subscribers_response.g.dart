// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_subscribers_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetSubscribersResponse extends GetSubscribersResponse {
  @override
  final String? code;
  @override
  final String? message;
  @override
  final BuiltList<SubscribersSubscriber>? subscribers;
  @override
  final String? nextToken;

  factory _$GetSubscribersResponse(
          [void Function(GetSubscribersResponseBuilder)? updates]) =>
      (new GetSubscribersResponseBuilder()..update(updates))._build();

  _$GetSubscribersResponse._(
      {this.code, this.message, this.subscribers, this.nextToken})
      : super._();

  @override
  GetSubscribersResponse rebuild(
          void Function(GetSubscribersResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetSubscribersResponseBuilder toBuilder() =>
      new GetSubscribersResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetSubscribersResponse &&
        code == other.code &&
        message == other.message &&
        subscribers == other.subscribers &&
        nextToken == other.nextToken;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, subscribers.hashCode);
    _$hash = $jc(_$hash, nextToken.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GetSubscribersResponse')
          ..add('code', code)
          ..add('message', message)
          ..add('subscribers', subscribers)
          ..add('nextToken', nextToken))
        .toString();
  }
}

class GetSubscribersResponseBuilder
    implements Builder<GetSubscribersResponse, GetSubscribersResponseBuilder> {
  _$GetSubscribersResponse? _$v;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<SubscribersSubscriber>? _subscribers;
  ListBuilder<SubscribersSubscriber> get subscribers =>
      _$this._subscribers ??= new ListBuilder<SubscribersSubscriber>();
  set subscribers(ListBuilder<SubscribersSubscriber>? subscribers) =>
      _$this._subscribers = subscribers;

  String? _nextToken;
  String? get nextToken => _$this._nextToken;
  set nextToken(String? nextToken) => _$this._nextToken = nextToken;

  GetSubscribersResponseBuilder() {
    GetSubscribersResponse._defaults(this);
  }

  GetSubscribersResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _code = $v.code;
      _message = $v.message;
      _subscribers = $v.subscribers?.toBuilder();
      _nextToken = $v.nextToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetSubscribersResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetSubscribersResponse;
  }

  @override
  void update(void Function(GetSubscribersResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GetSubscribersResponse build() => _build();

  _$GetSubscribersResponse _build() {
    _$GetSubscribersResponse _$result;
    try {
      _$result = _$v ??
          new _$GetSubscribersResponse._(
              code: code,
              message: message,
              subscribers: _subscribers?.build(),
              nextToken: nextToken);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subscribers';
        _subscribers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GetSubscribersResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
