//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/roles.dart';

part 'get_roles_response.g.dart';

/// GetRolesResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [roles]
/// * [nextToken] - Pagination token.
@BuiltValue()
abstract class GetRolesResponse implements Built<GetRolesResponse, GetRolesResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'roles')
  BuiltList<Roles>? get roles;

  /// Pagination token.
  @BuiltValueField(wireName: r'next_token')
  String? get nextToken;

  GetRolesResponse._();

  factory GetRolesResponse([void Function(GetRolesResponseBuilder b) updates]) = _$GetRolesResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetRolesResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetRolesResponse> get serializer => _$GetRolesResponseSerializer();
}

class _$GetRolesResponseSerializer implements PrimitiveSerializer<GetRolesResponse> {
  @override
  final Iterable<Type> types = const [GetRolesResponse, _$GetRolesResponse];

  @override
  final String wireName = r'GetRolesResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetRolesResponse object, {
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
        specifiedType: const FullType(BuiltList, [FullType(Roles)]),
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
    GetRolesResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetRolesResponseBuilder result,
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
            specifiedType: const FullType(BuiltList, [FullType(Roles)]),
          ) as BuiltList<Roles>;
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
  GetRolesResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetRolesResponseBuilder();
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

