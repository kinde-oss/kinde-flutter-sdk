//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_organization_users_response.g.dart';

/// UpdateOrganizationUsersResponse
///
/// Properties:
/// * [message] 
/// * [usersAdded] 
/// * [usersUpdated] 
/// * [usersRemoved] 
@BuiltValue()
abstract class UpdateOrganizationUsersResponse implements Built<UpdateOrganizationUsersResponse, UpdateOrganizationUsersResponseBuilder> {
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'users_added')
  BuiltList<String>? get usersAdded;

  @BuiltValueField(wireName: r'users_updated')
  BuiltList<String>? get usersUpdated;

  @BuiltValueField(wireName: r'users_removed')
  BuiltList<String>? get usersRemoved;

  UpdateOrganizationUsersResponse._();

  factory UpdateOrganizationUsersResponse([void Function(UpdateOrganizationUsersResponseBuilder b) updates]) = _$UpdateOrganizationUsersResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateOrganizationUsersResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateOrganizationUsersResponse> get serializer => _$UpdateOrganizationUsersResponseSerializer();
}

class _$UpdateOrganizationUsersResponseSerializer implements PrimitiveSerializer<UpdateOrganizationUsersResponse> {
  @override
  final Iterable<Type> types = const [UpdateOrganizationUsersResponse, _$UpdateOrganizationUsersResponse];

  @override
  final String wireName = r'UpdateOrganizationUsersResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateOrganizationUsersResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.usersAdded != null) {
      yield r'users_added';
      yield serializers.serialize(
        object.usersAdded,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.usersUpdated != null) {
      yield r'users_updated';
      yield serializers.serialize(
        object.usersUpdated,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.usersRemoved != null) {
      yield r'users_removed';
      yield serializers.serialize(
        object.usersRemoved,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateOrganizationUsersResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateOrganizationUsersResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        case r'users_added':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.usersAdded.replace(valueDes);
          break;
        case r'users_updated':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.usersUpdated.replace(valueDes);
          break;
        case r'users_removed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.usersRemoved.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateOrganizationUsersResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateOrganizationUsersResponseBuilder();
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

