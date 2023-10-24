// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_application_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const CreateApplicationRequestTypeEnum _$createApplicationRequestTypeEnum_reg =
    const CreateApplicationRequestTypeEnum._('reg');
const CreateApplicationRequestTypeEnum _$createApplicationRequestTypeEnum_spa =
    const CreateApplicationRequestTypeEnum._('spa');
const CreateApplicationRequestTypeEnum _$createApplicationRequestTypeEnum_m2m =
    const CreateApplicationRequestTypeEnum._('m2m');

CreateApplicationRequestTypeEnum _$createApplicationRequestTypeEnumValueOf(
    String name) {
  switch (name) {
    case 'reg':
      return _$createApplicationRequestTypeEnum_reg;
    case 'spa':
      return _$createApplicationRequestTypeEnum_spa;
    case 'm2m':
      return _$createApplicationRequestTypeEnum_m2m;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<CreateApplicationRequestTypeEnum>
    _$createApplicationRequestTypeEnumValues = new BuiltSet<
        CreateApplicationRequestTypeEnum>(const <CreateApplicationRequestTypeEnum>[
  _$createApplicationRequestTypeEnum_reg,
  _$createApplicationRequestTypeEnum_spa,
  _$createApplicationRequestTypeEnum_m2m,
]);

Serializer<CreateApplicationRequestTypeEnum>
    _$createApplicationRequestTypeEnumSerializer =
    new _$CreateApplicationRequestTypeEnumSerializer();

class _$CreateApplicationRequestTypeEnumSerializer
    implements PrimitiveSerializer<CreateApplicationRequestTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'reg': 'reg',
    'spa': 'spa',
    'm2m': 'm2m',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'reg': 'reg',
    'spa': 'spa',
    'm2m': 'm2m',
  };

  @override
  final Iterable<Type> types = const <Type>[CreateApplicationRequestTypeEnum];
  @override
  final String wireName = 'CreateApplicationRequestTypeEnum';

  @override
  Object serialize(
          Serializers serializers, CreateApplicationRequestTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  CreateApplicationRequestTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      CreateApplicationRequestTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$CreateApplicationRequest extends CreateApplicationRequest {
  @override
  final String? name;
  @override
  final CreateApplicationRequestTypeEnum? type;

  factory _$CreateApplicationRequest(
          [void Function(CreateApplicationRequestBuilder)? updates]) =>
      (new CreateApplicationRequestBuilder()..update(updates))._build();

  _$CreateApplicationRequest._({this.name, this.type}) : super._();

  @override
  CreateApplicationRequest rebuild(
          void Function(CreateApplicationRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CreateApplicationRequestBuilder toBuilder() =>
      new CreateApplicationRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CreateApplicationRequest &&
        name == other.name &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CreateApplicationRequest')
          ..add('name', name)
          ..add('type', type))
        .toString();
  }
}

class CreateApplicationRequestBuilder
    implements
        Builder<CreateApplicationRequest, CreateApplicationRequestBuilder> {
  _$CreateApplicationRequest? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  CreateApplicationRequestTypeEnum? _type;
  CreateApplicationRequestTypeEnum? get type => _$this._type;
  set type(CreateApplicationRequestTypeEnum? type) => _$this._type = type;

  CreateApplicationRequestBuilder() {
    CreateApplicationRequest._defaults(this);
  }

  CreateApplicationRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CreateApplicationRequest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CreateApplicationRequest;
  }

  @override
  void update(void Function(CreateApplicationRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CreateApplicationRequest build() => _build();

  _$CreateApplicationRequest _build() {
    final _$result =
        _$v ?? new _$CreateApplicationRequest._(name: name, type: type);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
