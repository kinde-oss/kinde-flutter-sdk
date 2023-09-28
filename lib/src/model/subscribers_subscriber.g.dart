// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribers_subscriber.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SubscribersSubscriber extends SubscribersSubscriber {
  @override
  final String? id;
  @override
  final String? email;
  @override
  final String? fullName;
  @override
  final String? firstName;
  @override
  final String? lastName;

  factory _$SubscribersSubscriber(
          [void Function(SubscribersSubscriberBuilder)? updates]) =>
      (new SubscribersSubscriberBuilder()..update(updates))._build();

  _$SubscribersSubscriber._(
      {this.id, this.email, this.fullName, this.firstName, this.lastName})
      : super._();

  @override
  SubscribersSubscriber rebuild(
          void Function(SubscribersSubscriberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscribersSubscriberBuilder toBuilder() =>
      new SubscribersSubscriberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscribersSubscriber &&
        id == other.id &&
        email == other.email &&
        fullName == other.fullName &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubscribersSubscriber')
          ..add('id', id)
          ..add('email', email)
          ..add('fullName', fullName)
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class SubscribersSubscriberBuilder
    implements Builder<SubscribersSubscriber, SubscribersSubscriberBuilder> {
  _$SubscribersSubscriber? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  SubscribersSubscriberBuilder() {
    SubscribersSubscriber._defaults(this);
  }

  SubscribersSubscriberBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _fullName = $v.fullName;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscribersSubscriber other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubscribersSubscriber;
  }

  @override
  void update(void Function(SubscribersSubscriberBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SubscribersSubscriber build() => _build();

  _$SubscribersSubscriber _build() {
    final _$result = _$v ??
        new _$SubscribersSubscriber._(
            id: id,
            email: email,
            fullName: fullName,
            firstName: firstName,
            lastName: lastName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
