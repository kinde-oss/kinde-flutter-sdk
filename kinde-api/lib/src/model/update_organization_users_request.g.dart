// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_organization_users_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateOrganizationUsersRequest extends UpdateOrganizationUsersRequest {
  @override
  final BuiltList<UpdateOrganizationUsersRequestUsersInner>? users;

  factory _$UpdateOrganizationUsersRequest(
          [void Function(UpdateOrganizationUsersRequestBuilder)? updates]) =>
      (new UpdateOrganizationUsersRequestBuilder()..update(updates))._build();

  _$UpdateOrganizationUsersRequest._({this.users}) : super._();

  @override
  UpdateOrganizationUsersRequest rebuild(
          void Function(UpdateOrganizationUsersRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateOrganizationUsersRequestBuilder toBuilder() =>
      new UpdateOrganizationUsersRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateOrganizationUsersRequest && users == other.users;
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
    return (newBuiltValueToStringHelper(r'UpdateOrganizationUsersRequest')
          ..add('users', users))
        .toString();
  }
}

class UpdateOrganizationUsersRequestBuilder
    implements
        Builder<UpdateOrganizationUsersRequest,
            UpdateOrganizationUsersRequestBuilder> {
  _$UpdateOrganizationUsersRequest? _$v;

  ListBuilder<UpdateOrganizationUsersRequestUsersInner>? _users;
  ListBuilder<UpdateOrganizationUsersRequestUsersInner> get users =>
      _$this._users ??=
          new ListBuilder<UpdateOrganizationUsersRequestUsersInner>();
  set users(ListBuilder<UpdateOrganizationUsersRequestUsersInner>? users) =>
      _$this._users = users;

  UpdateOrganizationUsersRequestBuilder() {
    UpdateOrganizationUsersRequest._defaults(this);
  }

  UpdateOrganizationUsersRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _users = $v.users?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateOrganizationUsersRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateOrganizationUsersRequest;
  }

  @override
  void update(void Function(UpdateOrganizationUsersRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateOrganizationUsersRequest build() => _build();

  _$UpdateOrganizationUsersRequest _build() {
    _$UpdateOrganizationUsersRequest _$result;
    try {
      _$result =
          _$v ?? new _$UpdateOrganizationUsersRequest._(users: _users?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateOrganizationUsersRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
