//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

/// User
///
/// Properties:
/// * [id] - Unique id of the user in Kinde.
/// * [providedId] - External id for user.
/// * [email] - Default email address of the user in Kinde.
/// * [lastName] - User's last name.
/// * [firstName] - User's first name.
/// * [fullName] - User's full name.
/// * [isSuspended] - Whether the user is currently suspended or not.
/// * [picture] - User's profile picture URL.
/// * [isPasswordResetRequested] - Whether the user has been asked to reset their password.
/// * [totalSignIns] - Total number of user sign ins.
/// * [failedSignIns] - Number of consecutive failed user sign ins.
/// * [lastSignedIn] - Last sign in date in ISO 8601 format.
/// * [createdOn] - Date of user creation in ISO 8601 format.
@BuiltValue()
abstract class User implements Built<User, UserBuilder> {
  /// Unique id of the user in Kinde.
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// External id for user.
  @BuiltValueField(wireName: r'provided_id')
  String? get providedId;

  /// Default email address of the user in Kinde.
  @BuiltValueField(wireName: r'email')
  String? get email;

  /// User's last name.
  @BuiltValueField(wireName: r'last_name')
  String? get lastName;

  /// User's first name.
  @BuiltValueField(wireName: r'first_name')
  String? get firstName;

  /// User's full name.
  @BuiltValueField(wireName: r'full_name')
  String? get fullName;

  /// Whether the user is currently suspended or not.
  @BuiltValueField(wireName: r'is_suspended')
  bool? get isSuspended;

  /// User's profile picture URL.
  @BuiltValueField(wireName: r'picture')
  String? get picture;

  /// Whether the user has been asked to reset their password.
  @BuiltValueField(wireName: r'is_password_reset_requested')
  bool? get isPasswordResetRequested;

  /// Total number of user sign ins.
  @BuiltValueField(wireName: r'total_sign_ins')
  int? get totalSignIns;

  /// Number of consecutive failed user sign ins.
  @BuiltValueField(wireName: r'failed_sign_ins')
  int? get failedSignIns;

  /// Last sign in date in ISO 8601 format.
  @BuiltValueField(wireName: r'last_signed_in')
  String? get lastSignedIn;

  /// Date of user creation in ISO 8601 format.
  @BuiltValueField(wireName: r'created_on')
  String? get createdOn;

  User._();

  factory User([void updates(UserBuilder b)]) = _$User;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UserBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<User> get serializer => _$UserSerializer();
}

class _$UserSerializer implements PrimitiveSerializer<User> {
  @override
  final Iterable<Type> types = const [User, _$User];

  @override
  final String wireName = r'User';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    User object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.providedId != null) {
      yield r'provided_id';
      yield serializers.serialize(
        object.providedId,
        specifiedType: const FullType(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.lastName != null) {
      yield r'last_name';
      yield serializers.serialize(
        object.lastName,
        specifiedType: const FullType(String),
      );
    }
    if (object.firstName != null) {
      yield r'first_name';
      yield serializers.serialize(
        object.firstName,
        specifiedType: const FullType(String),
      );
    }
    if (object.fullName != null) {
      yield r'full_name';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType(String),
      );
    }
    if (object.isSuspended != null) {
      yield r'is_suspended';
      yield serializers.serialize(
        object.isSuspended,
        specifiedType: const FullType(bool),
      );
    }
    if (object.picture != null) {
      yield r'picture';
      yield serializers.serialize(
        object.picture,
        specifiedType: const FullType(String),
      );
    }
    if (object.isPasswordResetRequested != null) {
      yield r'is_password_reset_requested';
      yield serializers.serialize(
        object.isPasswordResetRequested,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.totalSignIns != null) {
      yield r'total_sign_ins';
      yield serializers.serialize(
        object.totalSignIns,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.failedSignIns != null) {
      yield r'failed_sign_ins';
      yield serializers.serialize(
        object.failedSignIns,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.lastSignedIn != null) {
      yield r'last_signed_in';
      yield serializers.serialize(
        object.lastSignedIn,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.createdOn != null) {
      yield r'created_on';
      yield serializers.serialize(
        object.createdOn,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    User object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UserBuilder result,
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
        case r'provided_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.providedId = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'last_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.lastName = valueDes;
          break;
        case r'first_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.firstName = valueDes;
          break;
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'is_suspended':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isSuspended = valueDes;
          break;
        case r'picture':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.picture = valueDes;
          break;
        case r'is_password_reset_requested':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.isPasswordResetRequested = valueDes;
          break;
        case r'total_sign_ins':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.totalSignIns = valueDes;
          break;
        case r'failed_sign_ins':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.failedSignIns = valueDes;
          break;
        case r'last_signed_in':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.lastSignedIn = valueDes;
          break;
        case r'created_on':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.createdOn = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  User deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UserBuilder();
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

