//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_organization_user_role_request.g.dart';

/// CreateOrganizationUserRoleRequest
///
/// Properties:
/// * [roleId] - The role id.
@BuiltValue()
abstract class CreateOrganizationUserRoleRequest implements Built<CreateOrganizationUserRoleRequest, CreateOrganizationUserRoleRequestBuilder> {
  /// The role id.
  @BuiltValueField(wireName: r'role_id')
  String? get roleId;

  CreateOrganizationUserRoleRequest._();

  factory CreateOrganizationUserRoleRequest([void updates(CreateOrganizationUserRoleRequestBuilder b)]) = _$CreateOrganizationUserRoleRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateOrganizationUserRoleRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateOrganizationUserRoleRequest> get serializer => _$CreateOrganizationUserRoleRequestSerializer();
}

class _$CreateOrganizationUserRoleRequestSerializer implements PrimitiveSerializer<CreateOrganizationUserRoleRequest> {
  @override
  final Iterable<Type> types = const [CreateOrganizationUserRoleRequest, _$CreateOrganizationUserRoleRequest];

  @override
  final String wireName = r'CreateOrganizationUserRoleRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateOrganizationUserRoleRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.roleId != null) {
      yield r'role_id';
      yield serializers.serialize(
        object.roleId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateOrganizationUserRoleRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateOrganizationUserRoleRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'role_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.roleId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateOrganizationUserRoleRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateOrganizationUserRoleRequestBuilder();
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

