// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$CreateUserResponse extends CreateUserResponse {
  @override
  final String? id;
  @override
  final bool? created;
  @override
  final BuiltList<UserIdentity>? identities;

  factory _$CreateUserResponse(
          [void Function(CreateUserResponseBuilder)? updates]) =>
      (new CreateUserResponseBuilder()..update(updates))._build();

  _$CreateUserResponse._({this.id, this.created, this.identities}) : super._();

  @override
  CreateUserResponse rebuild(
          void Function(CreateUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateUserResponseBuilder toBuilder() =>
      new CreateUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateUserResponse &&
        id == other.id &&
        created == other.created &&
        identities == other.identities;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jc(_$hash, identities.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateUserResponse')
          ..add('id', id)
          ..add('created', created)
          ..add('identities', identities))
        .toString();
  }
}

class CreateUserResponseBuilder
    implements Builder<CreateUserResponse, CreateUserResponseBuilder> {
  _$CreateUserResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  bool? _created;
  bool? get created => _$this._created;
  set created(bool? created) => _$this._created = created;

  ListBuilder<UserIdentity>? _identities;
  ListBuilder<UserIdentity> get identities =>
      _$this._identities ??= new ListBuilder<UserIdentity>();
  set identities(ListBuilder<UserIdentity>? identities) =>
      _$this._identities = identities;

  CreateUserResponseBuilder() {
    CreateUserResponse._defaults(this);
  }

  CreateUserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _created = $v.created;
      _identities = $v.identities?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateUserResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateUserResponse;
  }

  @override
  void update(void Function(CreateUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateUserResponse build() => _build();

  _$CreateUserResponse _build() {
    _$CreateUserResponse _$result;
    try {
      _$result = _$v ??
          new _$CreateUserResponse._(
              id: id, created: created, identities: _identities?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'identities';
        _identities?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateUserResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
