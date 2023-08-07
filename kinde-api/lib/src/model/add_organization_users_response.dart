//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_organization_users_response.g.dart';

/// AddOrganizationUsersResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [usersAdded] 
@BuiltValue()
abstract class AddOrganizationUsersResponse implements Built<AddOrganizationUsersResponse, AddOrganizationUsersResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'users_added')
  BuiltList<String>? get usersAdded;

  AddOrganizationUsersResponse._();

  factory AddOrganizationUsersResponse([void updates(AddOrganizationUsersResponseBuilder b)]) = _$AddOrganizationUsersResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddOrganizationUsersResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddOrganizationUsersResponse> get serializer => _$AddOrganizationUsersResponseSerializer();
}

class _$AddOrganizationUsersResponseSerializer implements PrimitiveSerializer<AddOrganizationUsersResponse> {
  @override
  final Iterable<Type> types = const [AddOrganizationUsersResponse, _$AddOrganizationUsersResponse];

  @override
  final String wireName = r'AddOrganizationUsersResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddOrganizationUsersResponse object, {
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
    if (object.usersAdded != null) {
      yield r'users_added';
      yield serializers.serialize(
        object.usersAdded,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AddOrganizationUsersResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddOrganizationUsersResponseBuilder result,
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
        case r'users_added':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.usersAdded.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddOrganizationUsersResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddOrganizationUsersResponseBuilder();
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

