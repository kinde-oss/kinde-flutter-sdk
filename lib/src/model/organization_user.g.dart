// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$OrganizationUser extends OrganizationUser {
  @override
  final String? id;
  @override
  final String? email;
  @override
  final String? fullName;
  @override
  final String? lastName;
  @override
  final String? firstName;
  @override
  final BuiltList<String>? roles;

  factory _$OrganizationUser(
          [void Function(OrganizationUserBuilder)? updates]) =>
      (new OrganizationUserBuilder()..update(updates))._build();

  _$OrganizationUser._(
      {this.id,
      this.email,
      this.fullName,
      this.lastName,
      this.firstName,
      this.roles})
      : super._();

  @override
  OrganizationUser rebuild(void Function(OrganizationUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationUserBuilder toBuilder() =>
      new OrganizationUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizationUser &&
        id == other.id &&
        email == other.email &&
        fullName == other.fullName &&
        lastName == other.lastName &&
        firstName == other.firstName &&
        roles == other.roles;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, lastName.hashCode);
    _$hash = $jc(_$hash, firstName.hashCode);
    _$hash = $jc(_$hash, roles.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganizationUser')
          ..add('id', id)
          ..add('email', email)
          ..add('fullName', fullName)
          ..add('lastName', lastName)
          ..add('firstName', firstName)
          ..add('roles', roles))
        .toString();
  }
}

class OrganizationUserBuilder
    implements Builder<OrganizationUser, OrganizationUserBuilder> {
  _$OrganizationUser? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  ListBuilder<String>? _roles;
  ListBuilder<String> get roles => _$this._roles ??= new ListBuilder<String>();
  set roles(ListBuilder<String>? roles) => _$this._roles = roles;

  OrganizationUserBuilder() {
    OrganizationUser._defaults(this);
  }

  OrganizationUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _email = $v.email;
      _fullName = $v.fullName;
      _lastName = $v.lastName;
      _firstName = $v.firstName;
      _roles = $v.roles?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizationUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizationUser;
  }

  @override
  void update(void Function(OrganizationUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizationUser build() => _build();

  _$OrganizationUser _build() {
    _$OrganizationUser _$result;
    try {
      _$result = _$v ??
          new _$OrganizationUser._(
              id: id,
              email: email,
              fullName: fullName,
              lastName: lastName,
              firstName: firstName,
              roles: _roles?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'roles';
        _roles?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrganizationUser', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
