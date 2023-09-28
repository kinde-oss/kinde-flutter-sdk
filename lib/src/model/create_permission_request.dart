//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_permission_request.g.dart';

/// CreatePermissionRequest
///
/// Properties:
/// * [name] - The permission's name.
/// * [description] - The permission's description.
/// * [key] - The permission identifier to use in code.
@BuiltValue()
abstract class CreatePermissionRequest implements Built<CreatePermissionRequest, CreatePermissionRequestBuilder> {
  /// The permission's name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// The permission's description.
  @BuiltValueField(wireName: r'description')
  String? get description;

  /// The permission identifier to use in code.
  @BuiltValueField(wireName: r'key')
  String? get key;

  CreatePermissionRequest._();

  factory CreatePermissionRequest([void Function(CreatePermissionRequestBuilder b) updates]) = _$CreatePermissionRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreatePermissionRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreatePermissionRequest> get serializer => _$CreatePermissionRequestSerializer();
}

class _$CreatePermissionRequestSerializer implements PrimitiveSerializer<CreatePermissionRequest> {
  @override
  final Iterable<Type> types = const [CreatePermissionRequest, _$CreatePermissionRequest];

  @override
  final String wireName = r'CreatePermissionRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreatePermissionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.key != null) {
      yield r'key';
      yield serializers.serialize(
        object.key,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreatePermissionRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreatePermissionRequestBuilder result,
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
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreatePermissionRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreatePermissionRequestBuilder();
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

