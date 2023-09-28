//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
// ignore_for_file: unused_element
import 'package:kinde_flutter_sdk/src/model/create_organization_response_organization.dart';

part 'create_organization_response.g.dart';

/// CreateOrganizationResponse
///
/// Properties:
/// * [message]
/// * [code]
/// * [organization]
@BuiltValue()
abstract class CreateOrganizationResponse implements Built<CreateOrganizationResponse, CreateOrganizationResponseBuilder> {
  @BuiltValueField(wireName: r'message')
  String? get message;

  @BuiltValueField(wireName: r'code')
  String? get code;

  @BuiltValueField(wireName: r'organization')
  CreateOrganizationResponseOrganization? get organization;

  CreateOrganizationResponse._();

  factory CreateOrganizationResponse([void Function(CreateOrganizationResponseBuilder b) updates]) = _$CreateOrganizationResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateOrganizationResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateOrganizationResponse> get serializer => _$CreateOrganizationResponseSerializer();
}

class _$CreateOrganizationResponseSerializer implements PrimitiveSerializer<CreateOrganizationResponse> {
  @override
  final Iterable<Type> types = const [CreateOrganizationResponse, _$CreateOrganizationResponse];

  @override
  final String wireName = r'CreateOrganizationResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateOrganizationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(String),
      );
    }
    if (object.organization != null) {
      yield r'organization';
      yield serializers.serialize(
        object.organization,
        specifiedType: const FullType(CreateOrganizationResponseOrganization),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateOrganizationResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateOrganizationResponseBuilder result,
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
        case r'code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.code = valueDes;
          break;
        case r'organization':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CreateOrganizationResponseOrganization),
          ) as CreateOrganizationResponseOrganization;
          result.organization.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateOrganizationResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateOrganizationResponseBuilder();
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

