// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateUserRequest extends CreateUserRequest {
  @override
  final CreateUserRequestProfile? profile;
  @override
  final BuiltList<CreateUserRequestIdentitiesInner>? identities;

  factory _$CreateUserRequest(
          [void Function(CreateUserRequestBuilder)? updates]) =>
      (new CreateUserRequestBuilder()..update(updates))._build();

  _$CreateUserRequest._({this.profile, this.identities}) : super._();

  @override
  CreateUserRequest rebuild(void Function(CreateUserRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateUserRequestBuilder toBuilder() =>
      new CreateUserRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateUserRequest &&
        profile == other.profile &&
        identities == other.identities;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, profile.hashCode);
    _$hash = $jc(_$hash, identities.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateUserRequest')
          ..add('profile', profile)
          ..add('identities', identities))
        .toString();
  }
}

class CreateUserRequestBuilder
    implements Builder<CreateUserRequest, CreateUserRequestBuilder> {
  _$CreateUserRequest? _$v;

  CreateUserRequestProfileBuilder? _profile;
  CreateUserRequestProfileBuilder get profile =>
      _$this._profile ??= new CreateUserRequestProfileBuilder();
  set profile(CreateUserRequestProfileBuilder? profile) =>
      _$this._profile = profile;

  ListBuilder<CreateUserRequestIdentitiesInner>? _identities;
  ListBuilder<CreateUserRequestIdentitiesInner> get identities =>
      _$this._identities ??=
          new ListBuilder<CreateUserRequestIdentitiesInner>();
  set identities(ListBuilder<CreateUserRequestIdentitiesInner>? identities) =>
      _$this._identities = identities;

  CreateUserRequestBuilder() {
    CreateUserRequest._defaults(this);
  }

  CreateUserRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _profile = $v.profile?.toBuilder();
      _identities = $v.identities?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateUserRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateUserRequest;
  }

  @override
  void update(void Function(CreateUserRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateUserRequest build() => _build();

  _$CreateUserRequest _build() {
    _$CreateUserRequest _$result;
    try {
      _$result = _$v ??
          new _$CreateUserRequest._(
              profile: _profile?.build(), identities: _identities?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'profile';
        _profile?.build();
        _$failedField = 'identities';
        _identities?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateUserRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
