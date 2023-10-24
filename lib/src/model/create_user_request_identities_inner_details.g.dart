// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request_identities_inner_details.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateUserRequestIdentitiesInnerDetails
    extends CreateUserRequestIdentitiesInnerDetails {
  @override
  final String? email;

  factory _$CreateUserRequestIdentitiesInnerDetails(
          [void Function(CreateUserRequestIdentitiesInnerDetailsBuilder)?
              updates]) =>
      (new CreateUserRequestIdentitiesInnerDetailsBuilder()..update(updates))
          ._build();

  _$CreateUserRequestIdentitiesInnerDetails._({this.email}) : super._();

  @override
  CreateUserRequestIdentitiesInnerDetails rebuild(
          void Function(CreateUserRequestIdentitiesInnerDetailsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateUserRequestIdentitiesInnerDetailsBuilder toBuilder() =>
      new CreateUserRequestIdentitiesInnerDetailsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateUserRequestIdentitiesInnerDetails &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'CreateUserRequestIdentitiesInnerDetails')
          ..add('email', email))
        .toString();
  }
}

class CreateUserRequestIdentitiesInnerDetailsBuilder
    implements
        Builder<CreateUserRequestIdentitiesInnerDetails,
            CreateUserRequestIdentitiesInnerDetailsBuilder> {
  _$CreateUserRequestIdentitiesInnerDetails? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  CreateUserRequestIdentitiesInnerDetailsBuilder() {
    CreateUserRequestIdentitiesInnerDetails._defaults(this);
  }

  CreateUserRequestIdentitiesInnerDetailsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateUserRequestIdentitiesInnerDetails other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateUserRequestIdentitiesInnerDetails;
  }

  @override
  void update(
      void Function(CreateUserRequestIdentitiesInnerDetailsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateUserRequestIdentitiesInnerDetails build() => _build();

  _$CreateUserRequestIdentitiesInnerDetails _build() {
    final _$result =
        _$v ?? new _$CreateUserRequestIdentitiesInnerDetails._(email: email);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
