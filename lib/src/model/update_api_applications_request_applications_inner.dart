//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_api_applications_request_applications_inner.g.dart';

/// UpdateAPIApplicationsRequestApplicationsInner
///
/// Properties:
/// * [id] - The application's id.
/// * [operation] - Optional operation, set to 'delete' to remove the user from the organization.
@BuiltValue()
abstract class UpdateAPIApplicationsRequestApplicationsInner implements Built<UpdateAPIApplicationsRequestApplicationsInner, UpdateAPIApplicationsRequestApplicationsInnerBuilder> {
  /// The application's id.
  @BuiltValueField(wireName: r'id')
  String get id;

  /// Optional operation, set to 'delete' to remove the user from the organization.
  @BuiltValueField(wireName: r'operation')
  String? get operation;

  UpdateAPIApplicationsRequestApplicationsInner._();

  factory UpdateAPIApplicationsRequestApplicationsInner([void Function(UpdateAPIApplicationsRequestApplicationsInnerBuilder b) updates]) = _$UpdateAPIApplicationsRequestApplicationsInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateAPIApplicationsRequestApplicationsInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateAPIApplicationsRequestApplicationsInner> get serializer => _$UpdateAPIApplicationsRequestApplicationsInnerSerializer();
}

class _$UpdateAPIApplicationsRequestApplicationsInnerSerializer implements PrimitiveSerializer<UpdateAPIApplicationsRequestApplicationsInner> {
  @override
  final Iterable<Type> types = const [UpdateAPIApplicationsRequestApplicationsInner, _$UpdateAPIApplicationsRequestApplicationsInner];

  @override
  final String wireName = r'UpdateAPIApplicationsRequestApplicationsInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateAPIApplicationsRequestApplicationsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    if (object.operation != null) {
      yield r'operation';
      yield serializers.serialize(
        object.operation,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateAPIApplicationsRequestApplicationsInner object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateAPIApplicationsRequestApplicationsInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'operation':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.operation = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateAPIApplicationsRequestApplicationsInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateAPIApplicationsRequestApplicationsInnerBuilder();
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

