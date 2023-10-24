//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_role_permissions_response.g.dart';

/// UpdateRolePermissionsResponse
///
/// Properties:
/// * [code] 
/// * [message] 
/// * [permissionsAdded] 
/// * [permissionsRemoved] 
@BuiltValue()
abstract class UpdateRolePermissionsResponse implements Built<UpdateRolePermissionsResponse, UpdateRolePermissionsResponseBuilder> {
  @BuiltValueField(wireName: r'code')
  String? get code;

  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'permissions_added')
  BuiltList<String>? get permissionsAdded;

  @BuiltValueField(wireName: r'permissions_removed')
  BuiltList<String>? get permissionsRemoved;

  UpdateRolePermissionsResponse._();

  factory UpdateRolePermissionsResponse([void Function(UpdateRolePermissionsResponseBuilder b) updates]) = _$UpdateRolePermissionsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateRolePermissionsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateRolePermissionsResponse> get serializer => _$UpdateRolePermissionsResponseSerializer();
}

class _$UpdateRolePermissionsResponseSerializer implements PrimitiveSerializer<UpdateRolePermissionsResponse> {
  @override
  final Iterable<Type> types = const [UpdateRolePermissionsResponse, _$UpdateRolePermissionsResponse];

  @override
  final String wireName = r'UpdateRolePermissionsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateRolePermissionsResponse object, {
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
    if (object.permissionsAdded != null) {
      yield r'permissions_added';
      yield serializers.serialize(
        object.permissionsAdded,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.permissionsRemoved != null) {
      yield r'permissions_removed';
      yield serializers.serialize(
        object.permissionsRemoved,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateRolePermissionsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateRolePermissionsResponseBuilder result,
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
        case r'permissions_added':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.permissionsAdded.replace(valueDes);
          break;
        case r'permissions_removed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.permissionsRemoved.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateRolePermissionsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateRolePermissionsResponseBuilder();
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

