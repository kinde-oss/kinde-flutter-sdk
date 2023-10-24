// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response_users_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UsersResponseUsersInner extends UsersResponseUsersInner {
  @override
  final String? id;
  @override
  final String? providedId;
  @override
  final String? email;
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
  @override
  final BuiltList<String>? organizations;
  @override
  final BuiltList<UserIdentitiesInner>? identities;

  factory _$UsersResponseUsersInner(
          [void Function(UsersResponseUsersInnerBuilder)? updates]) =>
      (new UsersResponseUsersInnerBuilder()..update(updates))._build();

  _$UsersResponseUsersInner._(
      {this.id,
      this.providedId,
      this.email,
      this.lastName,
      this.firstName,
      this.isSuspended,
      this.picture,
      this.totalSignIns,
      this.failedSignIns,
      this.lastSignedIn,
      this.createdOn,
      this.organizations,
      this.identities})
      : super._();

  @override
  UsersResponseUsersInner rebuild(
          void Function(UsersResponseUsersInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersResponseUsersInnerBuilder toBuilder() =>
      new UsersResponseUsersInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersResponseUsersInner &&
        id == other.id &&
        providedId == other.providedId &&
        email == other.email &&
        lastName == other.lastName &&
        firstName == other.firstName &&
        isSuspended == other.isSuspended &&
        picture == other.picture &&
        totalSignIns == other.totalSignIns &&
        failedSignIns == other.failedSignIns &&
        lastSignedIn == other.lastSignedIn &&
        createdOn == other.createdOn &&
        organizations == other.organizations &&
        identities == other.identities;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, providedId.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, isSuspended.hashCode);
    _$hash = $jc(_$hash, picture.hashCode);
    _$hash = $jc(_$hash, totalSignIns.hashCode);
    _$hash = $jc(_$hash, failedSignIns.hashCode);
    _$hash = $jc(_$hash, lastSignedIn.hashCode);
    _$hash = $jc(_$hash, createdOn.hashCode);
    _$hash = $jc(_$hash, organizations.hashCode);
    _$hash = $jc(_$hash, identities.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersResponseUsersInner')
          ..add('id', id)
          ..add('providedId', providedId)
          ..add('email', email)
          ..add('lastName', lastName)
          ..add('firstName', firstName)
          ..add('isSuspended', isSuspended)
          ..add('picture', picture)
          ..add('totalSignIns', totalSignIns)
          ..add('failedSignIns', failedSignIns)
          ..add('lastSignedIn', lastSignedIn)
          ..add('createdOn', createdOn)
          ..add('organizations', organizations)
          ..add('identities', identities))
        .toString();
  }
}

class UsersResponseUsersInnerBuilder
    implements
        Builder<UsersResponseUsersInner, UsersResponseUsersInnerBuilder> {
  _$UsersResponseUsersInner? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _providedId;
  String? get providedId => _$this._providedId;
  set providedId(String? providedId) => _$this._providedId = providedId;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

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

  ListBuilder<String>? _organizations;
  ListBuilder<String> get organizations =>
      _$this._organizations ??= new ListBuilder<String>();
  set organizations(ListBuilder<String>? organizations) =>
      _$this._organizations = organizations;

  ListBuilder<UserIdentitiesInner>? _identities;
  ListBuilder<UserIdentitiesInner> get identities =>
      _$this._identities ??= new ListBuilder<UserIdentitiesInner>();
  set identities(ListBuilder<UserIdentitiesInner>? identities) =>
      _$this._identities = identities;

  UsersResponseUsersInnerBuilder() {
    UsersResponseUsersInner._defaults(this);
  }

  UsersResponseUsersInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _providedId = $v.providedId;
      _email = $v.email;
      _lastName = $v.lastName;
      _firstName = $v.firstName;
      _isSuspended = $v.isSuspended;
      _picture = $v.picture;
      _totalSignIns = $v.totalSignIns;
      _failedSignIns = $v.failedSignIns;
      _lastSignedIn = $v.lastSignedIn;
      _createdOn = $v.createdOn;
      _organizations = $v.organizations?.toBuilder();
      _identities = $v.identities?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersResponseUsersInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersResponseUsersInner;
  }

  @override
  void update(void Function(UsersResponseUsersInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersResponseUsersInner build() => _build();

  _$UsersResponseUsersInner _build() {
    _$UsersResponseUsersInner _$result;
    try {
      _$result = _$v ??
          new _$UsersResponseUsersInner._(
              id: id,
              providedId: providedId,
              email: email,
              lastName: lastName,
              firstName: firstName,
              isSuspended: isSuspended,
              picture: picture,
              totalSignIns: totalSignIns,
              failedSignIns: failedSignIns,
              lastSignedIn: lastSignedIn,
              createdOn: createdOn,
              organizations: _organizations?.build(),
              identities: _identities?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'organizations';
        _organizations?.build();
        _$failedField = 'identities';
        _identities?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersResponseUsersInner', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
