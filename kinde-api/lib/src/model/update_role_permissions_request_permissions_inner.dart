//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_role_permissions_request_permissions_inner.g.dart';

/// UpdateRolePermissionsRequestPermissionsInner
///
/// Properties:
/// * [id] - The permission id.
/// * [operation] - Optional operation, set to 'delete' to remove the permission from the role.
@BuiltValue()
abstract class UpdateRolePermissionsRequestPermissionsInner implements Built<UpdateRolePermissionsRequestPermissionsInner, UpdateRolePermissionsRequestPermissionsInnerBuilder> {
  /// The permission id.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Optional operation, set to 'delete' to remove the permission from the role.
  @BuiltValueField(wireName: r'operation')
  String? get operation;

  UpdateRolePermissionsRequestPermissionsInner._();

  factory UpdateRolePermissionsRequestPermissionsInner([void updates(UpdateRolePermissionsRequestPermissionsInnerBuilder b)]) = _$UpdateRolePermissionsRequestPermissionsInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateRolePermissionsRequestPermissionsInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateRolePermissionsRequestPermissionsInner> get serializer => _$UpdateRolePermissionsRequestPermissionsInnerSerializer();
}

class _$UpdateRolePermissionsRequestPermissionsInnerSerializer implements PrimitiveSerializer<UpdateRolePermissionsRequestPermissionsInner> {
  @override
  final Iterable<Type> types = const [UpdateRolePermissionsRequestPermissionsInner, _$UpdateRolePermissionsRequestPermissionsInner];

  @override
  final String wireName = r'UpdateRolePermissionsRequestPermissionsInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateRolePermissionsRequestPermissionsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.operation != null) {
      yield r'operation';
      yield serializers.serialize(
        object.operation,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateRolePermissionsRequestPermissionsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateRolePermissionsRequestPermissionsInnerBuilder result,
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
        case r'operation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.operation = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateRolePermissionsRequestPermissionsInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateRolePermissionsRequestPermissionsInnerBuilder();
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

