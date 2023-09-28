// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$User extends User {
  @override
  final String? id;
  @override
  final String? providedId;
  @override
  final String? preferredEmail;
  @override
  final String? lastName;
  @override
  final String? firstName;
  @override
  final bool? isSuspended;
  @override
  final String? picture;
  @override
  final int? totalSignIns;
  @override
  final int? failedSignIns;
  @override
  final String? lastSignedIn;
  @override
  final String? createdOn;

  factory _$User([void Function(UserBuilder)? updates]) =>
      (new UserBuilder()..update(updates))._build();

  _$User._(
      {this.id,
      this.providedId,
      this.preferredEmail,
      this.lastName,
      this.firstName,
      this.isSuspended,
      this.picture,
      this.totalSignIns,
      this.failedSignIns,
      this.lastSignedIn,
      this.createdOn})
      : super._();

  @override
  User rebuild(void Function(UserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserBuilder toBuilder() => new UserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
        id == other.id &&
        providedId == other.providedId &&
        preferredEmail == other.preferredEmail &&
        lastName == other.lastName &&
        firstName == other.firstName &&
        isSuspended == other.isSuspended &&
        picture == other.picture &&
        totalSignIns == other.totalSignIns &&
        failedSignIns == other.failedSignIns &&
        lastSignedIn == other.lastSignedIn &&
        createdOn == other.createdOn;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, providedId.hashCode);
    _$hash = $jc(_$hash, preferredEmail.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, isSuspended.hashCode);
    _$hash = $jc(_$hash, picture.hashCode);
    _$hash = $jc(_$hash, totalSignIns.hashCode);
    _$hash = $jc(_$hash, failedSignIns.hashCode);
    _$hash = $jc(_$hash, lastSignedIn.hashCode);
    _$hash = $jc(_$hash, createdOn.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'User')
          ..add('id', id)
          ..add('providedId', providedId)
          ..add('preferredEmail', preferredEmail)
          ..add('lastName', lastName)
          ..add('firstName', firstName)
          ..add('isSuspended', isSuspended)
          ..add('picture', picture)
          ..add('totalSignIns', totalSignIns)
          ..add('failedSignIns', failedSignIns)
          ..add('lastSignedIn', lastSignedIn)
          ..add('createdOn', createdOn))
        .toString();
  }
}

class UserBuilder implements Builder<User, UserBuilder> {
  _$User? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _providedId;
  String? get providedId => _$this._providedId;
  set providedId(String? providedId) => _$this._providedId = providedId;

  String? _preferredEmail;
  String? get preferredEmail => _$this._preferredEmail;
  set preferredEmail(String? preferredEmail) =>
      _$this._preferredEmail = preferredEmail;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  bool? _isSuspended;
  bool? get isSuspended => _$this._isSuspended;
  set isSuspended(bool? isSuspended) => _$this._isSuspended = isSuspended;

  String? _picture;
  String? get picture => _$this._picture;
  set picture(String? picture) => _$this._picture = picture;

  int? _totalSignIns;
  int? get totalSignIns => _$this._totalSignIns;
  set totalSignIns(int? totalSignIns) => _$this._totalSignIns = totalSignIns;

  int? _failedSignIns;
  int? get failedSignIns => _$this._failedSignIns;
  set failedSignIns(int? failedSignIns) =>
      _$this._failedSignIns = failedSignIns;

  String? _lastSignedIn;
  String? get lastSignedIn => _$this._lastSignedIn;
  set lastSignedIn(String? lastSignedIn) => _$this._lastSignedIn = lastSignedIn;

  String? _createdOn;
  String? get createdOn => _$this._createdOn;
  set createdOn(String? createdOn) => _$this._createdOn = createdOn;

  UserBuilder() {
    User._defaults(this);
  }

  UserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _providedId = $v.providedId;
      _preferredEmail = $v.preferredEmail;
      _lastName = $v.lastName;
      _firstName = $v.firstName;
      _isSuspended = $v.isSuspended;
      _picture = $v.picture;
      _totalSignIns = $v.totalSignIns;
      _failedSignIns = $v.failedSignIns;
      _lastSignedIn = $v.lastSignedIn;
      _createdOn = $v.createdOn;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(User other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$User;
  }

  @override
  void update(void Function(UserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  User build() => _build();

  _$User _build() {
    final _$result = _$v ??
        new _$User._(
            id: id,
            providedId: providedId,
            preferredEmail: preferredEmail,
            lastName: lastName,
            firstName: firstName,
            isSuspended: isSuspended,
            picture: picture,
            totalSignIns: totalSignIns,
            failedSignIns: failedSignIns,
            lastSignedIn: lastSignedIn,
            createdOn: createdOn);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
