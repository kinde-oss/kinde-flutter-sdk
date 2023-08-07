//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'roles.g.dart';

/// Roles
///
/// Properties:
/// * [key] - The role identifier to use in code.
/// * [name] - The role's name.
/// * [description] - The role's description.
@BuiltValue()
abstract class Roles implements Built<Roles, RolesBuilder> {
  /// The role identifier to use in code.
  @BuiltValueField(wireName: r'key')
  String? get key;

  /// The role's name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// The role's description.
  @BuiltValueField(wireName: r'description')
  String? get description;

  Roles._();

  factory Roles([void updates(RolesBuilder b)]) = _$Roles;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RolesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Roles> get serializer => _$RolesSerializer();
}

class _$RolesSerializer implements PrimitiveSerializer<Roles> {
  @override
  final Iterable<Type> types = const [Roles, _$Roles];

  @override
  final String wireName = r'Roles';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Roles object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.key != null) {
      yield r'key';
      yield serializers.serialize(
        object.key,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Roles object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RolesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Roles deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RolesBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

