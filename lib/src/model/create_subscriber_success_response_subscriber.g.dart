// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_subscriber_success_response_subscriber.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateSubscriberSuccessResponseSubscriber
    extends CreateSubscriberSuccessResponseSubscriber {
  @override
  final String? subscriberId;

  factory _$CreateSubscriberSuccessResponseSubscriber(
          [void Function(CreateSubscriberSuccessResponseSubscriberBuilder)?
              updates]) =>
      (new CreateSubscriberSuccessResponseSubscriberBuilder()..update(updates))
          ._build();

  _$CreateSubscriberSuccessResponseSubscriber._({this.subscriberId})
      : super._();

  @override
  CreateSubscriberSuccessResponseSubscriber rebuild(
          void Function(CreateSubscriberSuccessResponseSubscriberBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateSubscriberSuccessResponseSubscriberBuilder toBuilder() =>
      new CreateSubscriberSuccessResponseSubscriberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateSubscriberSuccessResponseSubscriber &&
        subscriberId == other.subscriberId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, subscriberId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'CreateSubscriberSuccessResponseSubscriber')
          ..add('subscriberId', subscriberId))
        .toString();
  }
}

class CreateSubscriberSuccessResponseSubscriberBuilder
    implements
        Builder<CreateSubscriberSuccessResponseSubscriber,
            CreateSubscriberSuccessResponseSubscriberBuilder> {
  _$CreateSubscriberSuccessResponseSubscriber? _$v;

  String? _subscriberId;
  String? get subscriberId => _$this._subscriberId;
  set subscriberId(String? subscriberId) => _$this._subscriberId = subscriberId;

  CreateSubscriberSuccessResponseSubscriberBuilder() {
    CreateSubscriberSuccessResponseSubscriber._defaults(this);
  }

  CreateSubscriberSuccessResponseSubscriberBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _subscriberId = $v.subscriberId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateSubscriberSuccessResponseSubscriber other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateSubscriberSuccessResponseSubscriber;
  }

  @override
  void update(
      void Function(CreateSubscriberSuccessResponseSubscriberBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateSubscriberSuccessResponseSubscriber build() => _build();

  _$CreateSubscriberSuccessResponseSubscriber _build() {
    final _$result = _$v ??
        new _$CreateSubscriberSuccessResponseSubscriber._(
            subscriberId: subscriberId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
