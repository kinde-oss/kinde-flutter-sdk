import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for CreateUserResponse
void main() {
  final instance = CreateUserResponseBuilder();
  // TODO add properties to the builder and call build()

  group(CreateUserResponse, () {
    // Unique id of the user in Kinde.
    // String id
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<CreateUserResponse>());
      expect(result.id, isA<String>());
      expect(result.id, isNotNull);
      expect(result.id, equals('id'));
    });

    // True if the user was successfully created.
    // bool created
    test('to test the property `created`', () async {
      // TODO
      final created = instance.created;
      expect(created, isNull);
      instance.created = true;
      final result = instance.build();
      expect(result, isA<CreateUserResponse>());
      expect(result.created, isA<bool>());
      expect(result.created, isNotNull);
      expect(result.created, isTrue);
    });

    // BuiltList<UserIdentity> identities
    test('to test the property `identities`', () async {
      // TODO
      final identities = instance.identities;
      expect(identities, isA<ListBuilder<UserIdentity>>());
      expect(identities.length, isZero);
      UserIdentity userIdentity = UserIdentity();
      instance.identities.add(userIdentity);
      final result = instance.build();
      expect(result, isA<CreateUserResponse>());
      expect(result.identities, isA<BuiltList<UserIdentity>?>());
      expect(result.identities, isNotNull);
      expect(result.identities?.length, isNonZero);
    });
  });
}
