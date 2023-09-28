//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_organization_response_organization.g.dart';

/// CreateOrganizationResponseOrganization
///
/// Properties:
/// * [code] - The organization's code.
@BuiltValue()
abstract class CreateOrganizationResponseOrganization implements Built<CreateOrganizationResponseOrganization, CreateOrganizationResponseOrganizationBuilder> {
  /// The organization's code.
  @BuiltValueField(wireName: r'code')
  String? get code;

  CreateOrganizationResponseOrganization._();

  factory CreateOrganizationResponseOrganization([void Function(CreateOrganizationResponseOrganizationBuilder b) updates]) = _$CreateOrganizationResponseOrganization;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateOrganizationResponseOrganizationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateOrganizationResponseOrganization> get serializer => _$CreateOrganizationResponseOrganizationSerializer();
}

class _$CreateOrganizationResponseOrganizationSerializer implements PrimitiveSerializer<CreateOrganizationResponseOrganization> {
  @override
  final Iterable<Type> types = const [CreateOrganizationResponseOrganization, _$CreateOrganizationResponseOrganization];

  @override
  final String wireName = r'CreateOrganizationResponseOrganization';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateOrganizationResponseOrganization object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.code != null) {
      yield r'code';
      yield serializers.serialize(
        object.code,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateOrganizationResponseOrganization object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateOrganizationResponseOrganizationBuilder result,
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateOrganizationResponseOrganization deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateOrganizationResponseOrganizationBuilder();
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

