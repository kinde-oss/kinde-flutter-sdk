// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_subscriber_success_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateSubscriberSuccessResponse
    extends CreateSubscriberSuccessResponse {
  @override
  final CreateSubscriberSuccessResponseSubscriber? subscriber;

  factory _$CreateSubscriberSuccessResponse(
          [void Function(CreateSubscriberSuccessResponseBuilder)? updates]) =>
      (new CreateSubscriberSuccessResponseBuilder()..update(updates))._build();

  _$CreateSubscriberSuccessResponse._({this.subscriber}) : super._();

  @override
  CreateSubscriberSuccessResponse rebuild(
          void Function(CreateSubscriberSuccessResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateSubscriberSuccessResponseBuilder toBuilder() =>
      new CreateSubscriberSuccessResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateSubscriberSuccessResponse &&
        subscriber == other.subscriber;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, subscriber.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateSubscriberSuccessResponse')
          ..add('subscriber', subscriber))
        .toString();
  }
}

class CreateSubscriberSuccessResponseBuilder
    implements
        Builder<CreateSubscriberSuccessResponse,
            CreateSubscriberSuccessResponseBuilder> {
  _$CreateSubscriberSuccessResponse? _$v;

  CreateSubscriberSuccessResponseSubscriberBuilder? _subscriber;
  CreateSubscriberSuccessResponseSubscriberBuilder get subscriber =>
      _$this._subscriber ??=
          new CreateSubscriberSuccessResponseSubscriberBuilder();
  set subscriber(
          CreateSubscriberSuccessResponseSubscriberBuilder? subscriber) =>
      _$this._subscriber = subscriber;

  CreateSubscriberSuccessResponseBuilder() {
    CreateSubscriberSuccessResponse._defaults(this);
  }

  CreateSubscriberSuccessResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _subscriber = $v.subscriber?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateSubscriberSuccessResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateSubscriberSuccessResponse;
  }

  @override
  void update(void Function(CreateSubscriberSuccessResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateSubscriberSuccessResponse build() => _build();

  _$CreateSubscriberSuccessResponse _build() {
    _$CreateSubscriberSuccessResponse _$result;
    try {
      _$result = _$v ??
          new _$CreateSubscriberSuccessResponse._(
              subscriber: _subscriber?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'subscriber';
        _subscriber?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateSubscriberSuccessResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
