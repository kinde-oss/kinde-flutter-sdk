//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/organization_user_permission.dart';

part 'get_organizations_user_permissions_response.g.dart';

/// GetOrganizationsUserPermissionsResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [permissions]
@BuiltValue()
abstract class GetOrganizationsUserPermissionsResponse implements Built<GetOrganizationsUserPermissionsResponse, GetOrganizationsUserPermissionsResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'permissions')
  BuiltList<OrganizationUserPermission>? get permissions;

  GetOrganizationsUserPermissionsResponse._();

  factory GetOrganizationsUserPermissionsResponse([void Function(GetOrganizationsUserPermissionsResponseBuilder b) updates]) = _$GetOrganizationsUserPermissionsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetOrganizationsUserPermissionsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetOrganizationsUserPermissionsResponse> get serializer => _$GetOrganizationsUserPermissionsResponseSerializer();
}

class _$GetOrganizationsUserPermissionsResponseSerializer implements PrimitiveSerializer<GetOrganizationsUserPermissionsResponse> {
  @override
  final Iterable<Type> types = const [GetOrganizationsUserPermissionsResponse, _$GetOrganizationsUserPermissionsResponse];

  @override
  final String wireName = r'GetOrganizationsUserPermissionsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetOrganizationsUserPermissionsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(String),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.permissions != null) {
      yield r'permissions';
      yield serializers.serialize(
        object.permissions,
        specifiedType: const FullType(BuiltList, [FullType(OrganizationUserPermission)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetOrganizationsUserPermissionsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetOrganizationsUserPermissionsResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'permissions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(OrganizationUserPermission)]),
          ) as BuiltList<OrganizationUserPermission>;
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
  GetOrganizationsUserPermissionsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetOrganizationsUserPermissionsResponseBuilder();
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

