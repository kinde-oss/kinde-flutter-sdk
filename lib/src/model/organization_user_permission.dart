//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/organization_user_permission_roles_inner.dart';

part 'organization_user_permission.g.dart';

/// OrganizationUserPermission
///
/// Properties:
/// * [id]
/// * [key]
/// * [name]
/// * [description]
/// * [roles]
@BuiltValue()
abstract class OrganizationUserPermission implements Built<OrganizationUserPermission, OrganizationUserPermissionBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'key')
  String? get key;

  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'roles')
  BuiltList<OrganizationUserPermissionRolesInner>? get roles;

  OrganizationUserPermission._();

  factory OrganizationUserPermission([void Function(OrganizationUserPermissionBuilder b) updates]) = _$OrganizationUserPermission;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(OrganizationUserPermissionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<OrganizationUserPermission> get serializer => _$OrganizationUserPermissionSerializer();
}

class _$OrganizationUserPermissionSerializer implements PrimitiveSerializer<OrganizationUserPermission> {
  @override
  final Iterable<Type> types = const [OrganizationUserPermission, _$OrganizationUserPermission];

  @override
  final String wireName = r'OrganizationUserPermission';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    OrganizationUserPermission object, {
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
    if (object.roles != null) {
      yield r'roles';
      yield serializers.serialize(
        object.roles,
        specifiedType: const FullType(BuiltList, [FullType(OrganizationUserPermissionRolesInner)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    OrganizationUserPermission object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required OrganizationUserPermissionBuilder result,
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
        case r'roles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(OrganizationUserPermissionRolesInner)]),
          ) as BuiltList<OrganizationUserPermissionRolesInner>;
          result.roles.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  OrganizationUserPermission deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = OrganizationUserPermissionBuilder();
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

