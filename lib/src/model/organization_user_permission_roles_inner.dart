//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organization_user_permission_roles_inner.g.dart';

/// OrganizationUserPermissionRolesInner
///
/// Properties:
/// * [id] 
/// * [key] 
@BuiltValue()
abstract class OrganizationUserPermissionRolesInner implements Built<OrganizationUserPermissionRolesInner, OrganizationUserPermissionRolesInnerBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'key')
  String? get key;

  OrganizationUserPermissionRolesInner._();

  factory OrganizationUserPermissionRolesInner([void Function(OrganizationUserPermissionRolesInnerBuilder b) updates]) = _$OrganizationUserPermissionRolesInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrganizationUserPermissionRolesInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrganizationUserPermissionRolesInner> get serializer => _$OrganizationUserPermissionRolesInnerSerializer();
}

class _$OrganizationUserPermissionRolesInnerSerializer implements PrimitiveSerializer<OrganizationUserPermissionRolesInner> {
  @override
  final Iterable<Type> types = const [OrganizationUserPermissionRolesInner, _$OrganizationUserPermissionRolesInner];

  @override
  final String wireName = r'OrganizationUserPermissionRolesInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrganizationUserPermissionRolesInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.key != null) {
      yield r'key';
      yield serializers.serialize(
        object.key,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrganizationUserPermissionRolesInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrganizationUserPermissionRolesInnerBuilder result,
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
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrganizationUserPermissionRolesInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrganizationUserPermissionRolesInnerBuilder();
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

