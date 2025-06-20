//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_role_request.g.dart';

/// CreateRoleRequest
///
/// Properties:
/// * [name] - The role's name.
/// * [description] - The role's description.
/// * [key] - The role identifier to use in code.
/// * [isDefaultRole] - Set role as default for new users.
@BuiltValue()
abstract class CreateRoleRequest
    implements Built<CreateRoleRequest, CreateRoleRequestBuilder> {
  /// The role's name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// The role's description.
  @BuiltValueField(wireName: r'description')
  String? get description;

  /// The role identifier to use in code.
  @BuiltValueField(wireName: r'key')
  String? get key;

  /// Set role as default for new users.
  @BuiltValueField(wireName: r'is_default_role')
  bool? get isDefaultRole;

  CreateRoleRequest._();

  factory CreateRoleRequest([
    void Function(CreateRoleRequestBuilder b) updates,
  ]) = _$CreateRoleRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateRoleRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateRoleRequest> get serializer =>
      _$CreateRoleRequestSerializer();
}

class _$CreateRoleRequestSerializer
    implements PrimitiveSerializer<CreateRoleRequest> {
  @override
  final Iterable<Type> types = const [CreateRoleRequest, _$CreateRoleRequest];

  @override
  final String wireName = r'CreateRoleRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateRoleRequest object, {
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
    if (object.isDefaultRole != null) {
      yield r'is_default_role';
      yield serializers.serialize(
        object.isDefaultRole,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateRoleRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(
      serializers,
      object,
      specifiedType: specifiedType,
    ).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateRoleRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.description = valueDes;
          break;
        case r'key':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.key = valueDes;
          break;
        case r'is_default_role':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.isDefaultRole = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateRoleRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateRoleRequestBuilder();
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
