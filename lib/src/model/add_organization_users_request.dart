//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_element
import 'package:kinde_flutter_sdk/src/model/add_organization_users_request_users_inner.dart';

part 'add_organization_users_request.g.dart';

/// AddOrganizationUsersRequest
///
/// Properties:
/// * [users] - Users to be added to the organization.
@BuiltValue()
abstract class AddOrganizationUsersRequest implements Built<AddOrganizationUsersRequest, AddOrganizationUsersRequestBuilder> {
  /// Users to be added to the organization.
  @BuiltValueField(wireName: r'users')
  BuiltList<AddOrganizationUsersRequestUsersInner>? get users;

  AddOrganizationUsersRequest._();

  factory AddOrganizationUsersRequest([void Function(AddOrganizationUsersRequestBuilder b) updates]) = _$AddOrganizationUsersRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddOrganizationUsersRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddOrganizationUsersRequest> get serializer => _$AddOrganizationUsersRequestSerializer();
}

class _$AddOrganizationUsersRequestSerializer implements PrimitiveSerializer<AddOrganizationUsersRequest> {
  @override
  final Iterable<Type> types = const [AddOrganizationUsersRequest, _$AddOrganizationUsersRequest];

  @override
  final String wireName = r'AddOrganizationUsersRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddOrganizationUsersRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.users != null) {
      yield r'users';
      yield serializers.serialize(
        object.users,
        specifiedType: const FullType(BuiltList, [FullType(AddOrganizationUsersRequestUsersInner)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AddOrganizationUsersRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddOrganizationUsersRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'users':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(AddOrganizationUsersRequestUsersInner)]),
          ) as BuiltList<AddOrganizationUsersRequestUsersInner>;
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
  AddOrganizationUsersRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddOrganizationUsersRequestBuilder();
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

