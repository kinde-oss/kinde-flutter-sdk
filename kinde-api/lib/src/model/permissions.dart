//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'permissions.g.dart';

/// Permissions
///
/// Properties:
/// * [id] - The permission identifier to use in code.
/// * [name] - The permission's name.
/// * [description] - The permission's description.
@BuiltValue()
abstract class Permissions implements Built<Permissions, PermissionsBuilder> {
  /// The permission identifier to use in code.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// The permission's name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// The permission's description.
  @BuiltValueField(wireName: r'description')
  String? get description;

  Permissions._();

  factory Permissions([void updates(PermissionsBuilder b)]) = _$Permissions;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PermissionsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Permissions> get serializer => _$PermissionsSerializer();
}

class _$PermissionsSerializer implements PrimitiveSerializer<Permissions> {
  @override
  final Iterable<Type> types = const [Permissions, _$Permissions];

  @override
  final String wireName = r'Permissions';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Permissions object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    Permissions object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PermissionsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
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
  Permissions deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PermissionsBuilder();
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

