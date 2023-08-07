// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscriber.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Subscriber extends Subscriber {
  @override
  final String? id;
  @override
  final String? preferredEmail;
  @override
  final String? firstName;
  @override
  final String? lastName;

  factory _$Subscriber([void Function(SubscriberBuilder)? updates]) =>
      (new SubscriberBuilder()..update(updates))._build();

  _$Subscriber._({this.id, this.preferredEmail, this.firstName, this.lastName})
      : super._();

  @override
  Subscriber rebuild(void Function(SubscriberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriberBuilder toBuilder() => new SubscriberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Subscriber &&
        id == other.id &&
        preferredEmail == other.preferredEmail &&
        firstName == other.firstName &&
        lastName == other.lastName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, preferredEmail.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Subscriber')
          ..add('id', id)
          ..add('preferredEmail', preferredEmail)
          ..add('firstName', firstName)
          ..add('lastName', lastName))
        .toString();
  }
}

class SubscriberBuilder implements Builder<Subscriber, SubscriberBuilder> {
  _$Subscriber? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _preferredEmail;
  String? get preferredEmail => _$this._preferredEmail;
  set preferredEmail(String? preferredEmail) =>
      _$this._preferredEmail = preferredEmail;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  SubscriberBuilder() {
    Subscriber._defaults(this);
  }

  SubscriberBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _preferredEmail = $v.preferredEmail;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Subscriber other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Subscriber;
  }

  @override
  void update(void Function(SubscriberBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Subscriber build() => _build();

  _$Subscriber _build() {
    final _$result = _$v ??
        new _$Subscriber._(
            id: id,
            preferredEmail: preferredEmail,
            firstName: firstName,
            lastName: lastName);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
