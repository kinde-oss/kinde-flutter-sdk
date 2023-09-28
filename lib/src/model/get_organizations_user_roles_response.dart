//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/organization_user_role.dart';

part 'get_organizations_user_roles_response.g.dart';

/// GetOrganizationsUserRolesResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [roles]
/// * [nextToken] - Pagination token.
@BuiltValue()
abstract class GetOrganizationsUserRolesResponse implements Built<GetOrganizationsUserRolesResponse, GetOrganizationsUserRolesResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'roles')
  BuiltList<OrganizationUserRole>? get roles;

  /// Pagination token.
  @BuiltValueField(wireName: r'next_token')
  String? get nextToken;

  GetOrganizationsUserRolesResponse._();

  factory GetOrganizationsUserRolesResponse([void Function(GetOrganizationsUserRolesResponseBuilder b) updates]) = _$GetOrganizationsUserRolesResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetOrganizationsUserRolesResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetOrganizationsUserRolesResponse> get serializer => _$GetOrganizationsUserRolesResponseSerializer();
}

class _$GetOrganizationsUserRolesResponseSerializer implements PrimitiveSerializer<GetOrganizationsUserRolesResponse> {
  @override
  final Iterable<Type> types = const [GetOrganizationsUserRolesResponse, _$GetOrganizationsUserRolesResponse];

  @override
  final String wireName = r'GetOrganizationsUserRolesResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetOrganizationsUserRolesResponse object, {
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
    if (object.roles != null) {
      yield r'roles';
      yield serializers.serialize(
        object.roles,
        specifiedType: const FullType(BuiltList, [FullType(OrganizationUserRole)]),
      );
    }
    if (object.nextToken != null) {
      yield r'next_token';
      yield serializers.serialize(
        object.nextToken,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    GetOrganizationsUserRolesResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetOrganizationsUserRolesResponseBuilder result,
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
        case r'roles':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(OrganizationUserRole)]),
          ) as BuiltList<OrganizationUserRole>;
          result.roles.replace(valueDes);
          break;
        case r'next_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nextToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetOrganizationsUserRolesResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetOrganizationsUserRolesResponseBuilder();
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

