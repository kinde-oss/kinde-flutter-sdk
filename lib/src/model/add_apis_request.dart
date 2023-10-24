//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_apis_request.g.dart';

/// AddAPIsRequest
///
/// Properties:
/// * [name] 
/// * [audience] 
@BuiltValue()
abstract class AddAPIsRequest implements Built<AddAPIsRequest, AddAPIsRequestBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'audience')
  String get audience;

  AddAPIsRequest._();

  factory AddAPIsRequest([void Function(AddAPIsRequestBuilder b) updates]) = _$AddAPIsRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddAPIsRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddAPIsRequest> get serializer => _$AddAPIsRequestSerializer();
}

class _$AddAPIsRequestSerializer implements PrimitiveSerializer<AddAPIsRequest> {
  @override
  final Iterable<Type> types = const [AddAPIsRequest, _$AddAPIsRequest];

  @override
  final String wireName = r'AddAPIsRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddAPIsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'audience';
    yield serializers.serialize(
      object.audience,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddAPIsRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddAPIsRequestBuilder result,
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
        case r'audience':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.audience = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddAPIsRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddAPIsRequestBuilder();
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

