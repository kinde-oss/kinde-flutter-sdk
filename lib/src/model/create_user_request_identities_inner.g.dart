// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request_identities_inner.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateUserRequestIdentitiesInnerTypeEnum
    _$createUserRequestIdentitiesInnerTypeEnum_email =
    const CreateUserRequestIdentitiesInnerTypeEnum._('email');

CreateUserRequestIdentitiesInnerTypeEnum
    _$createUserRequestIdentitiesInnerTypeEnumValueOf(String name) {
  switch (name) {
    case 'email':
      return _$createUserRequestIdentitiesInnerTypeEnum_email;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CreateUserRequestIdentitiesInnerTypeEnum>
    _$createUserRequestIdentitiesInnerTypeEnumValues = new BuiltSet<
        CreateUserRequestIdentitiesInnerTypeEnum>(const <CreateUserRequestIdentitiesInnerTypeEnum>[
  _$createUserRequestIdentitiesInnerTypeEnum_email,
]);

Serializer<CreateUserRequestIdentitiesInnerTypeEnum>
    _$createUserRequestIdentitiesInnerTypeEnumSerializer =
    new _$CreateUserRequestIdentitiesInnerTypeEnumSerializer();

class _$CreateUserRequestIdentitiesInnerTypeEnumSerializer
    implements PrimitiveSerializer<CreateUserRequestIdentitiesInnerTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'email': 'email',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'email': 'email',
  };

  @override
  final Iterable<Type> types = const <Type>[
    CreateUserRequestIdentitiesInnerTypeEnum
  ];
  @override
  final String wireName = 'CreateUserRequestIdentitiesInnerTypeEnum';

  @override
  Object serialize(Serializers serializers,
          CreateUserRequestIdentitiesInnerTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateUserRequestIdentitiesInnerTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateUserRequestIdentitiesInnerTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateUserRequestIdentitiesInner
    extends CreateUserRequestIdentitiesInner {
  @override
  final CreateUserRequestIdentitiesInnerTypeEnum? type;
  @override
  final CreateUserRequestIdentitiesInnerDetails? details;

  factory _$CreateUserRequestIdentitiesInner(
          [void Function(CreateUserRequestIdentitiesInnerBuilder)? updates]) =>
      (new CreateUserRequestIdentitiesInnerBuilder()..update(updates))._build();

  _$CreateUserRequestIdentitiesInner._({this.type, this.details}) : super._();

  @override
  CreateUserRequestIdentitiesInner rebuild(
          void Function(CreateUserRequestIdentitiesInnerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateUserRequestIdentitiesInnerBuilder toBuilder() =>
      new CreateUserRequestIdentitiesInnerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateUserRequestIdentitiesInner &&
        type == other.type &&
        details == other.details;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, details.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateUserRequestIdentitiesInner')
          ..add('type', type)
          ..add('details', details))
        .toString();
  }
}

class CreateUserRequestIdentitiesInnerBuilder
    implements
        Builder<CreateUserRequestIdentitiesInner,
            CreateUserRequestIdentitiesInnerBuilder> {
  _$CreateUserRequestIdentitiesInner? _$v;

  CreateUserRequestIdentitiesInnerTypeEnum? _type;
  CreateUserRequestIdentitiesInnerTypeEnum? get type => _$this._type;
  set type(CreateUserRequestIdentitiesInnerTypeEnum? type) =>
      _$this._type = type;

  CreateUserRequestIdentitiesInnerDetailsBuilder? _details;
  CreateUserRequestIdentitiesInnerDetailsBuilder get details =>
      _$this._details ??= new CreateUserRequestIdentitiesInnerDetailsBuilder();
  set details(CreateUserRequestIdentitiesInnerDetailsBuilder? details) =>
      _$this._details = details;

  CreateUserRequestIdentitiesInnerBuilder() {
    CreateUserRequestIdentitiesInner._defaults(this);
  }

  CreateUserRequestIdentitiesInnerBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _details = $v.details?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateUserRequestIdentitiesInner other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateUserRequestIdentitiesInner;
  }

  @override
  void update(void Function(CreateUserRequestIdentitiesInnerBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateUserRequestIdentitiesInner build() => _build();

  _$CreateUserRequestIdentitiesInner _build() {
    _$CreateUserRequestIdentitiesInner _$result;
    try {
      _$result = _$v ??
          new _$CreateUserRequestIdentitiesInner._(
              type: type, details: _details?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'details';
        _details?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CreateUserRequestIdentitiesInner', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
