//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:kinde_flutter_sdk/src/model/organization.dart';

part 'get_organizations_response.g.dart';

/// GetOrganizationsResponse
///
/// Properties:
/// * [code] - Response code.
/// * [message] - Response message.
/// * [organizations]
/// * [nextToken] - Pagination token.
@BuiltValue()
abstract class GetOrganizationsResponse implements Built<GetOrganizationsResponse, GetOrganizationsResponseBuilder> {
  /// Response code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  /// Response message.
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'organizations')
  BuiltList<Organization>? get organizations;

  /// Pagination token.
  @BuiltValueField(wireName: r'next_token')
  String? get nextToken;

  GetOrganizationsResponse._();

  factory GetOrganizationsResponse([void Function(GetOrganizationsResponseBuilder b) updates]) = _$GetOrganizationsResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetOrganizationsResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetOrganizationsResponse> get serializer => _$GetOrganizationsResponseSerializer();
}

class _$GetOrganizationsResponseSerializer implements PrimitiveSerializer<GetOrganizationsResponse> {
  @override
  final Iterable<Type> types = const [GetOrganizationsResponse, _$GetOrganizationsResponse];

  @override
  final String wireName = r'GetOrganizationsResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetOrganizationsResponse object, {
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
    if (object.organizations != null) {
      yield r'organizations';
      yield serializers.serialize(
        object.organizations,
        specifiedType: const FullType(BuiltList, [FullType(Organization)]),
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
    GetOrganizationsResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetOrganizationsResponseBuilder result,
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
        case r'organizations':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Organization)]),
          ) as BuiltList<Organization>;
          result.organizations.replace(valueDes);
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
  GetOrganizationsResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetOrganizationsResponseBuilder();
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

