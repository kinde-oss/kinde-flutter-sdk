// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_organization_users_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateOrganizationUsersResponse
    extends UpdateOrganizationUsersResponse {
  @override
  final String? message;
  @override
  final BuiltList<String>? usersAdded;
  @override
  final BuiltList<String>? usersUpdated;
  @override
  final BuiltList<String>? usersRemoved;

  factory _$UpdateOrganizationUsersResponse(
          [void Function(UpdateOrganizationUsersResponseBuilder)? updates]) =>
      (new UpdateOrganizationUsersResponseBuilder()..update(updates))._build();

  _$UpdateOrganizationUsersResponse._(
      {this.message, this.usersAdded, this.usersUpdated, this.usersRemoved})
      : super._();

  @override
  UpdateOrganizationUsersResponse rebuild(
          void Function(UpdateOrganizationUsersResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateOrganizationUsersResponseBuilder toBuilder() =>
      new UpdateOrganizationUsersResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateOrganizationUsersResponse &&
        message == other.message &&
        usersAdded == other.usersAdded &&
        usersUpdated == other.usersUpdated &&
        usersRemoved == other.usersRemoved;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, usersAdded.hashCode);
    _$hash = $jc(_$hash, usersUpdated.hashCode);
    _$hash = $jc(_$hash, usersRemoved.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateOrganizationUsersResponse')
          ..add('message', message)
          ..add('usersAdded', usersAdded)
          ..add('usersUpdated', usersUpdated)
          ..add('usersRemoved', usersRemoved))
        .toString();
  }
}

class UpdateOrganizationUsersResponseBuilder
    implements
        Builder<UpdateOrganizationUsersResponse,
            UpdateOrganizationUsersResponseBuilder> {
  _$UpdateOrganizationUsersResponse? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ListBuilder<String>? _usersAdded;
  ListBuilder<String> get usersAdded =>
      _$this._usersAdded ??= new ListBuilder<String>();
  set usersAdded(ListBuilder<String>? usersAdded) =>
      _$this._usersAdded = usersAdded;

  ListBuilder<String>? _usersUpdated;
  ListBuilder<String> get usersUpdated =>
      _$this._usersUpdated ??= new ListBuilder<String>();
  set usersUpdated(ListBuilder<String>? usersUpdated) =>
      _$this._usersUpdated = usersUpdated;

  ListBuilder<String>? _usersRemoved;
  ListBuilder<String> get usersRemoved =>
      _$this._usersRemoved ??= new ListBuilder<String>();
  set usersRemoved(ListBuilder<String>? usersRemoved) =>
      _$this._usersRemoved = usersRemoved;

  UpdateOrganizationUsersResponseBuilder() {
    UpdateOrganizationUsersResponse._defaults(this);
  }

  UpdateOrganizationUsersResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _usersAdded = $v.usersAdded?.toBuilder();
      _usersUpdated = $v.usersUpdated?.toBuilder();
      _usersRemoved = $v.usersRemoved?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateOrganizationUsersResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UpdateOrganizationUsersResponse;
  }

  @override
  void update(void Function(UpdateOrganizationUsersResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateOrganizationUsersResponse build() => _build();

  _$UpdateOrganizationUsersResponse _build() {
    _$UpdateOrganizationUsersResponse _$result;
    try {
      _$result = _$v ??
          new _$UpdateOrganizationUsersResponse._(
              message: message,
              usersAdded: _usersAdded?.build(),
              usersUpdated: _usersUpdated?.build(),
              usersRemoved: _usersRemoved?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'usersAdded';
        _usersAdded?.build();
        _$failedField = 'usersUpdated';
        _usersUpdated?.build();
        _$failedField = 'usersRemoved';
        _usersRemoved?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UpdateOrganizationUsersResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
