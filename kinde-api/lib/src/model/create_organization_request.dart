//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_organization_request.g.dart';

/// CreateOrganizationRequest
///
/// Properties:
/// * [name] - The organization's name.
/// * [featureFlags] - The organization's feature flag settings.
/// * [externalId] - The organization's ID.
/// * [backgroundColor] - The organization's brand settings - background color.
/// * [buttonColor] - The organization's brand settings - button color.
/// * [buttonTextColor] - The organization's brand settings - button text color.
/// * [linkColor] - The organization's brand settings - link color.
@BuiltValue()
abstract class CreateOrganizationRequest implements Built<CreateOrganizationRequest, CreateOrganizationRequestBuilder> {
  /// The organization's name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// The organization's feature flag settings.
  @BuiltValueField(wireName: r'feature_flags')
  BuiltMap<String, CreateOrganizationRequestFeatureFlagsEnum>? get featureFlags;
  // enum featureFlagsEnum {  str,  int,  bool,  };

  /// The organization's ID.
  @BuiltValueField(wireName: r'external_id')
  String? get externalId;

  /// The organization's brand settings - background color.
  @BuiltValueField(wireName: r'background_color')
  String? get backgroundColor;

  /// The organization's brand settings - button color.
  @BuiltValueField(wireName: r'button_color')
  String? get buttonColor;

  /// The organization's brand settings - button text color.
  @BuiltValueField(wireName: r'button_text_color')
  String? get buttonTextColor;

  /// The organization's brand settings - link color.
  @BuiltValueField(wireName: r'link_color')
  String? get linkColor;

  CreateOrganizationRequest._();

  factory CreateOrganizationRequest([void updates(CreateOrganizationRequestBuilder b)]) = _$CreateOrganizationRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateOrganizationRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateOrganizationRequest> get serializer => _$CreateOrganizationRequestSerializer();
}

class _$CreateOrganizationRequestSerializer implements PrimitiveSerializer<CreateOrganizationRequest> {
  @override
  final Iterable<Type> types = const [CreateOrganizationRequest, _$CreateOrganizationRequest];

  @override
  final String wireName = r'CreateOrganizationRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateOrganizationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.featureFlags != null) {
      yield r'feature_flags';
      yield serializers.serialize(
        object.featureFlags,
        specifiedType: const FullType(BuiltMap, [FullType(String), FullType(CreateOrganizationRequestFeatureFlagsEnum)]),
      );
    }
    if (object.externalId != null) {
      yield r'external_id';
      yield serializers.serialize(
        object.externalId,
        specifiedType: const FullType(String),
      );
    }
    if (object.backgroundColor != null) {
      yield r'background_color';
      yield serializers.serialize(
        object.backgroundColor,
        specifiedType: const FullType(String),
      );
    }
    if (object.buttonColor != null) {
      yield r'button_color';
      yield serializers.serialize(
        object.buttonColor,
        specifiedType: const FullType(String),
      );
    }
    if (object.buttonTextColor != null) {
      yield r'button_text_color';
      yield serializers.serialize(
        object.buttonTextColor,
        specifiedType: const FullType(String),
      );
    }
    if (object.linkColor != null) {
      yield r'link_color';
      yield serializers.serialize(
        object.linkColor,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateOrganizationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateOrganizationRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'feature_flags':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltMap, [FullType(String), FullType(CreateOrganizationRequestFeatureFlagsEnum)]),
          ) as BuiltMap<String, CreateOrganizationRequestFeatureFlagsEnum>;
          result.featureFlags.replace(valueDes);
          break;
        case r'external_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.externalId = valueDes;
          break;
        case r'background_color':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.backgroundColor = valueDes;
          break;
        case r'button_color':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.buttonColor = valueDes;
          break;
        case r'button_text_color':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.buttonTextColor = valueDes;
          break;
        case r'link_color':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.linkColor = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateOrganizationRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateOrganizationRequestBuilder();
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

class CreateOrganizationRequestFeatureFlagsEnum extends EnumClass {

  /// Value of the feature flag.
  @BuiltValueEnumConst(wireName: r'str')
  static const CreateOrganizationRequestFeatureFlagsEnum str = _$createOrganizationRequestFeatureFlagsEnum_str;
  /// Value of the feature flag.
  @BuiltValueEnumConst(wireName: r'int')
  static const CreateOrganizationRequestFeatureFlagsEnum int_ = _$createOrganizationRequestFeatureFlagsEnum_int_;
  /// Value of the feature flag.
  @BuiltValueEnumConst(wireName: r'bool')
  static const CreateOrganizationRequestFeatureFlagsEnum bool_ = _$createOrganizationRequestFeatureFlagsEnum_bool_;

  static Serializer<CreateOrganizationRequestFeatureFlagsEnum> get serializer => _$createOrganizationRequestFeatureFlagsEnumSerializer;

  const CreateOrganizationRequestFeatureFlagsEnum._(String name): super(name);

  static BuiltSet<CreateOrganizationRequestFeatureFlagsEnum> get values => _$createOrganizationRequestFeatureFlagsEnumValues;
  static CreateOrganizationRequestFeatureFlagsEnum valueOf(String name) => _$createOrganizationRequestFeatureFlagsEnumValueOf(name);
}

