//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'organization_user_role_permissions_permissions.g.dart';

/// OrganizationUserRolePermissionsPermissions
///
/// Properties:
/// * [key] 
@BuiltValue()
abstract class OrganizationUserRolePermissionsPermissions implements Built<OrganizationUserRolePermissionsPermissions, OrganizationUserRolePermissionsPermissionsBuilder> {
  @BuiltValueField(wireName: r'key')
  String? get key;

  OrganizationUserRolePermissionsPermissions._();

  factory OrganizationUserRolePermissionsPermissions([void Function(OrganizationUserRolePermissionsPermissionsBuilder b) updates]) = _$OrganizationUserRolePermissionsPermissions;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrganizationUserRolePermissionsPermissionsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrganizationUserRolePermissionsPermissions> get serializer => _$OrganizationUserRolePermissionsPermissionsSerializer();
}

class _$OrganizationUserRolePermissionsPermissionsSerializer implements PrimitiveSerializer<OrganizationUserRolePermissionsPermissions> {
  @override
  final Iterable<Type> types = const [OrganizationUserRolePermissionsPermissions, _$OrganizationUserRolePermissionsPermissions];

  @override
  final String wireName = r'OrganizationUserRolePermissionsPermissions';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrganizationUserRolePermissionsPermissions object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    OrganizationUserRolePermissionsPermissions object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrganizationUserRolePermissionsPermissionsBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrganizationUserRolePermissionsPermissions deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrganizationUserRolePermissionsPermissionsBuilder();
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

