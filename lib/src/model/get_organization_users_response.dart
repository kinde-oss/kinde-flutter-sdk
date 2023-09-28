//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/organization_user.dart';

part 'get_organization_users_response.g.dart';

/// GetOrganizationUsersResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [organizationUsers]
/// * [nextToken] - Pagination token.
@BuiltValue()
abstract class GetOrganizationUsersResponse implements Built<GetOrganizationUsersResponse, GetOrganizationUsersResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'organization_users')
  BuiltList<OrganizationUser>? get organizationUsers;

  /// Pagination token.
  @BuiltValueField(wireName: r'next_token')
  String? get nextToken;

  GetOrganizationUsersResponse._();

  factory GetOrganizationUsersResponse([void Function(GetOrganizationUsersResponseBuilder b) updates]) = _$GetOrganizationUsersResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetOrganizationUsersResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetOrganizationUsersResponse> get serializer => _$GetOrganizationUsersResponseSerializer();
}

class _$GetOrganizationUsersResponseSerializer implements PrimitiveSerializer<GetOrganizationUsersResponse> {
  @override
  final Iterable<Type> types = const [GetOrganizationUsersResponse, _$GetOrganizationUsersResponse];

  @override
  final String wireName = r'GetOrganizationUsersResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetOrganizationUsersResponse object, {
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
    if (object.organizationUsers != null) {
      yield r'organization_users';
      yield serializers.serialize(
        object.organizationUsers,
        specifiedType: const FullType(BuiltList, [FullType(OrganizationUser)]),
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
    GetOrganizationUsersResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetOrganizationUsersResponseBuilder result,
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
        case r'organization_users':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(OrganizationUser)]),
          ) as BuiltList<OrganizationUser>;
          result.organizationUsers.replace(valueDes);
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
  GetOrganizationUsersResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetOrganizationUsersResponseBuilder();
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

