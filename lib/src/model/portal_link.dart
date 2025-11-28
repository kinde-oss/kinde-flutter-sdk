//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'portal_link.g.dart';

/// PortalLink
///
/// Properties:
/// * [url] - Unique URL to redirect the user to.
@BuiltValue()
abstract class PortalLink implements Built<PortalLink, PortalLinkBuilder> {
  /// Unique URL to redirect the user to.
  @BuiltValueField(wireName: r'url')
  String? get url;

  PortalLink._();

  factory PortalLink([void updates(PortalLinkBuilder b)]) = _$PortalLink;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PortalLinkBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PortalLink> get serializer => _$PortalLinkSerializer();
}

class _$PortalLinkSerializer implements PrimitiveSerializer<PortalLink> {
  @override
  final Iterable<Type> types = const [PortalLink, _$PortalLink];

  @override
  final String wireName = r'PortalLink';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PortalLink object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.url != null) {
      yield r'url';
      yield serializers.serialize(
        object.url,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PortalLink object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PortalLinkBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.url = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PortalLink deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PortalLinkBuilder();
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

