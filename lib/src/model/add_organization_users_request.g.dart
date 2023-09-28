// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_organization_users_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AddOrganizationUsersRequest extends AddOrganizationUsersRequest {
  @override
  final BuiltList<AddOrganizationUsersRequestUsersInner>? users;

  factory _$AddOrganizationUsersRequest(
          [void Function(AddOrganizationUsersRequestBuilder)? updates]) =>
      (new AddOrganizationUsersRequestBuilder()..update(updates))._build();

  _$AddOrganizationUsersRequest._({this.users}) : super._();

  @override
  AddOrganizationUsersRequest rebuild(
          void Function(AddOrganizationUsersRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AddOrganizationUsersRequestBuilder toBuilder() =>
      new AddOrganizationUsersRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AddOrganizationUsersRequest && users == other.users;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, users.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AddOrganizationUsersRequest')
          ..add('users', users))
        .toString();
  }
}

class AddOrganizationUsersRequestBuilder
    implements
        Builder<AddOrganizationUsersRequest,
            AddOrganizationUsersRequestBuilder> {
  _$AddOrganizationUsersRequest? _$v;

  ListBuilder<AddOrganizationUsersRequestUsersInner>? _users;
  ListBuilder<AddOrganizationUsersRequestUsersInner> get users =>
      _$this._users ??=
          new ListBuilder<AddOrganizationUsersRequestUsersInner>();
  set users(ListBuilder<AddOrganizationUsersRequestUsersInner>? users) =>
      _$this._users = users;

  AddOrganizationUsersRequestBuilder() {
    AddOrganizationUsersRequest._defaults(this);
  }

  AddOrganizationUsersRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AddOrganizationUsersRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AddOrganizationUsersRequest;
  }

  @override
  void update(void Function(AddOrganizationUsersRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AddOrganizationUsersRequest build() => _build();

  _$AddOrganizationUsersRequest _build() {
    _$AddOrganizationUsersRequest _$result;
    try {
      _$result =
          _$v ?? new _$AddOrganizationUsersRequest._(users: _users?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'AddOrganizationUsersRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
