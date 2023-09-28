//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_element
import 'package:kinde_flutter_sdk/src/model/update_role_permissions_request_permissions_inner.dart';

part 'update_role_permissions_request.g.dart';

/// UpdateRolePermissionsRequest
///
/// Properties:
/// * [permissions] - Permissions to add or remove from the role.
@BuiltValue()
abstract class UpdateRolePermissionsRequest implements Built<UpdateRolePermissionsRequest, UpdateRolePermissionsRequestBuilder> {
  /// Permissions to add or remove from the role.
  @BuiltValueField(wireName: r'permissions')
  BuiltList<UpdateRolePermissionsRequestPermissionsInner>? get permissions;

  UpdateRolePermissionsRequest._();

  factory UpdateRolePermissionsRequest([void Function(UpdateRolePermissionsRequestBuilder b) updates]) = _$UpdateRolePermissionsRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateRolePermissionsRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateRolePermissionsRequest> get serializer => _$UpdateRolePermissionsRequestSerializer();
}

class _$UpdateRolePermissionsRequestSerializer implements PrimitiveSerializer<UpdateRolePermissionsRequest> {
  @override
  final Iterable<Type> types = const [UpdateRolePermissionsRequest, _$UpdateRolePermissionsRequest];

  @override
  final String wireName = r'UpdateRolePermissionsRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateRolePermissionsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.permissions != null) {
      yield r'permissions';
      yield serializers.serialize(
        object.permissions,
        specifiedType: const FullType(BuiltList, [FullType(UpdateRolePermissionsRequestPermissionsInner)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateRolePermissionsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateRolePermissionsRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'permissions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(UpdateRolePermissionsRequestPermissionsInner)]),
          ) as BuiltList<UpdateRolePermissionsRequestPermissionsInner>;
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
  UpdateRolePermissionsRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateRolePermissionsRequestBuilder();
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

