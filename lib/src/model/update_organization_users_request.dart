//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/update_organization_users_request_users_inner.dart';

part 'update_organization_users_request.g.dart';

/// UpdateOrganizationUsersRequest
///
/// Properties:
/// * [users] - Users to add, update or remove from the organization.
@BuiltValue()
abstract class UpdateOrganizationUsersRequest implements Built<UpdateOrganizationUsersRequest, UpdateOrganizationUsersRequestBuilder> {
  /// Users to add, update or remove from the organization.
  @BuiltValueField(wireName: r'users')
  BuiltList<UpdateOrganizationUsersRequestUsersInner>? get users;

  UpdateOrganizationUsersRequest._();

  factory UpdateOrganizationUsersRequest([void Function(UpdateOrganizationUsersRequestBuilder b) updates]) = _$UpdateOrganizationUsersRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateOrganizationUsersRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateOrganizationUsersRequest> get serializer => _$UpdateOrganizationUsersRequestSerializer();
}

class _$UpdateOrganizationUsersRequestSerializer implements PrimitiveSerializer<UpdateOrganizationUsersRequest> {
  @override
  final Iterable<Type> types = const [UpdateOrganizationUsersRequest, _$UpdateOrganizationUsersRequest];

  @override
  final String wireName = r'UpdateOrganizationUsersRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateOrganizationUsersRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.users != null) {
      yield r'users';
      yield serializers.serialize(
        object.users,
        specifiedType: const FullType(BuiltList, [FullType(UpdateOrganizationUsersRequestUsersInner)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateOrganizationUsersRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateOrganizationUsersRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'users':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UpdateOrganizationUsersRequestUsersInner)]),
          ) as BuiltList<UpdateOrganizationUsersRequestUsersInner>;
          result.users.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateOrganizationUsersRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateOrganizationUsersRequestBuilder();
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

