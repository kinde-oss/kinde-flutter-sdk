//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_organization_user_permission_request.g.dart';

/// CreateOrganizationUserPermissionRequest
///
/// Properties:
/// * [permissionId] - The permission id.
@BuiltValue()
abstract class CreateOrganizationUserPermissionRequest implements Built<CreateOrganizationUserPermissionRequest, CreateOrganizationUserPermissionRequestBuilder> {
  /// The permission id.
  @BuiltValueField(wireName: r'permission_id')
  String? get permissionId;

  CreateOrganizationUserPermissionRequest._();

  factory CreateOrganizationUserPermissionRequest([void Function(CreateOrganizationUserPermissionRequestBuilder b) updates]) = _$CreateOrganizationUserPermissionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateOrganizationUserPermissionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateOrganizationUserPermissionRequest> get serializer => _$CreateOrganizationUserPermissionRequestSerializer();
}

class _$CreateOrganizationUserPermissionRequestSerializer implements PrimitiveSerializer<CreateOrganizationUserPermissionRequest> {
  @override
  final Iterable<Type> types = const [CreateOrganizationUserPermissionRequest, _$CreateOrganizationUserPermissionRequest];

  @override
  final String wireName = r'CreateOrganizationUserPermissionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateOrganizationUserPermissionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.permissionId != null) {
      yield r'permission_id';
      yield serializers.serialize(
        object.permissionId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateOrganizationUserPermissionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateOrganizationUserPermissionRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'permission_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.permissionId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateOrganizationUserPermissionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateOrganizationUserPermissionRequestBuilder();
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

