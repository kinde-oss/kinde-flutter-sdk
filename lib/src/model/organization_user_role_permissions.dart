//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_element
import 'package:kinde_flutter_sdk/src/model/organization_user_role_permissions_permissions.dart';

part 'organization_user_role_permissions.g.dart';

/// OrganizationUserRolePermissions
///
/// Properties:
/// * [id]
/// * [role]
/// * [permissions]
@BuiltValue()
abstract class OrganizationUserRolePermissions implements Built<OrganizationUserRolePermissions, OrganizationUserRolePermissionsBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'role')
  String? get role;

  @BuiltValueField(wireName: r'permissions')
  OrganizationUserRolePermissionsPermissions? get permissions;

  OrganizationUserRolePermissions._();

  factory OrganizationUserRolePermissions([void Function(OrganizationUserRolePermissionsBuilder b) updates]) = _$OrganizationUserRolePermissions;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrganizationUserRolePermissionsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrganizationUserRolePermissions> get serializer => _$OrganizationUserRolePermissionsSerializer();
}

class _$OrganizationUserRolePermissionsSerializer implements PrimitiveSerializer<OrganizationUserRolePermissions> {
  @override
  final Iterable<Type> types = const [OrganizationUserRolePermissions, _$OrganizationUserRolePermissions];

  @override
  final String wireName = r'OrganizationUserRolePermissions';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrganizationUserRolePermissions object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(String),
      );
    }
    if (object.permissions != null) {
      yield r'permissions';
      yield serializers.serialize(
        object.permissions,
        specifiedType: const FullType(OrganizationUserRolePermissionsPermissions),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrganizationUserRolePermissions object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrganizationUserRolePermissionsBuilder result,
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
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.role = valueDes;
          break;
        case r'permissions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(OrganizationUserRolePermissionsPermissions),
          ) as OrganizationUserRolePermissionsPermissions;
          result.permissions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrganizationUserRolePermissions deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrganizationUserRolePermissionsBuilder();
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

