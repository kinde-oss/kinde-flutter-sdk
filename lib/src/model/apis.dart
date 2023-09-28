//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'apis.g.dart';

/// Apis
///
/// Properties:
/// * [id] - Unique id of the API.
/// * [name] - The API's name.
/// * [audience] - The logical identifier for the API.
/// * [isManagementApi] - Whether it is the management API or not.
@BuiltValue()
abstract class Apis implements Built<Apis, ApisBuilder> {
  /// Unique id of the API.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// The API's name.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// The logical identifier for the API.
  @BuiltValueField(wireName: r'audience')
  String? get audience;

  /// Whether it is the management API or not.
  @BuiltValueField(wireName: r'is_management_api')
  bool? get isManagementApi;

  Apis._();

  factory Apis([void Function(ApisBuilder b) updates]) = _$Apis;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ApisBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Apis> get serializer => _$ApisSerializer();
}

class _$ApisSerializer implements PrimitiveSerializer<Apis> {
  @override
  final Iterable<Type> types = const [Apis, _$Apis];

  @override
  final String wireName = r'Apis';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Apis object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.audience != null) {
      yield r'audience';
      yield serializers.serialize(
        object.audience,
        specifiedType: const FullType(String),
      );
    }
    if (object.isManagementApi != null) {
      yield r'is_management_api';
      yield serializers.serialize(
        object.isManagementApi,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Apis object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ApisBuilder result,
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
        case r'is_management_api':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isManagementApi = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Apis deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ApisBuilder();
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

