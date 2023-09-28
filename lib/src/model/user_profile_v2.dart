//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user_profile_v2.g.dart';

/// UserProfileV2
///
/// Properties:
/// * [id] - Unique id of the user in Kinde (deprecated).
/// * [sub] - Unique id of the user in Kinde.
/// * [providedId] - Value of the user's id in a third-party system when the user is imported into Kinde.
/// * [name] - Users's first and last name separated by a space.
/// * [givenName] - User's first name.
/// * [familyName] - User's last name.
/// * [updatedAt] - Date the user was last updated at (In Unix time).
/// * [email] - User's email address if available.
/// * [picture] - URL that point's to the user's picture or avatar
@BuiltValue()
abstract class UserProfileV2 implements Built<UserProfileV2, UserProfileV2Builder> {
  /// Unique id of the user in Kinde (deprecated).
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// Unique id of the user in Kinde.
  @BuiltValueField(wireName: r'sub')
  String? get sub;

  /// Value of the user's id in a third-party system when the user is imported into Kinde.
  @BuiltValueField(wireName: r'provided_id')
  String? get providedId;

  /// Users's first and last name separated by a space.
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// User's first name.
  @BuiltValueField(wireName: r'given_name')
  String? get givenName;

  /// User's last name.
  @BuiltValueField(wireName: r'family_name')
  String? get familyName;

  /// Date the user was last updated at (In Unix time).
  @BuiltValueField(wireName: r'updated_at')
  int? get updatedAt;

  /// User's email address if available.
  @BuiltValueField(wireName: r'email')
  String? get email;

  /// URL that point's to the user's picture or avatar
  @BuiltValueField(wireName: r'picture')
  String? get picture;

  UserProfileV2._();

  factory UserProfileV2([void Function(UserProfileV2Builder b) updates]) = _$UserProfileV2;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserProfileV2Builder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UserProfileV2> get serializer => _$UserProfileV2Serializer();
}

class _$UserProfileV2Serializer implements PrimitiveSerializer<UserProfileV2> {
  @override
  final Iterable<Type> types = const [UserProfileV2, _$UserProfileV2];

  @override
  final String wireName = r'UserProfileV2';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UserProfileV2 object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.sub != null) {
      yield r'sub';
      yield serializers.serialize(
        object.sub,
        specifiedType: const FullType(String),
      );
    }
    if (object.providedId != null) {
      yield r'provided_id';
      yield serializers.serialize(
        object.providedId,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.givenName != null) {
      yield r'given_name';
      yield serializers.serialize(
        object.givenName,
        specifiedType: const FullType(String),
      );
    }
    if (object.familyName != null) {
      yield r'family_name';
      yield serializers.serialize(
        object.familyName,
        specifiedType: const FullType(String),
      );
    }
    if (object.updatedAt != null) {
      yield r'updated_at';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType(int),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.picture != null) {
      yield r'picture';
      yield serializers.serialize(
        object.picture,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UserProfileV2 object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserProfileV2Builder result,
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
        case r'sub':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sub = valueDes;
          break;
        case r'provided_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.providedId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'given_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.givenName = valueDes;
          break;
        case r'family_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.familyName = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.updatedAt = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'picture':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.picture = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UserProfileV2 deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserProfileV2Builder();
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

