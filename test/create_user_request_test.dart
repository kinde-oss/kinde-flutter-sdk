import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for CreateUserRequest
void main() {
  final instance = CreateUserRequestBuilder();
  // TODO add properties to the builder and call build()

  group(CreateUserRequest, () {
    // CreateUserRequestProfile profile
    test('to test the property `profile`', () async {
      // TODO
      final profile = instance.profile;
      expect(profile, isA<CreateUserRequestProfileBuilder>());
      CreateUserRequestProfileBuilder profileBuilder =
          CreateUserRequestProfileBuilder();
      profileBuilder.familyName = 'familyName';
      profileBuilder.givenName = 'givenName';
      instance.profile = profileBuilder;
      final result = instance.build();
      expect(result, isA<CreateUserRequest>());
      expect(result.profile, isA<CreateUserRequestProfile?>());
      expect(result.profile, isNotNull);
      expect(result.profile?.familyName, equals('familyName'));
      expect(result.profile?.givenName, equals('givenName'));
    });

    // Array of identities to assign to the created user
    // BuiltList<CreateUserRequestIdentitiesInner> identities
    test('to test the property `identities`', () async {
      // TODO
      final identities = instance.identities;
      expect(identities, isA<ListBuilder<CreateUserRequestIdentitiesInner>>());
      CreateUserRequestIdentitiesInner identitiesInner =
          CreateUserRequestIdentitiesInner();
      instance.identities.add(identitiesInner);
      final result = instance.build();
      expect(result, isA<CreateUserRequest>());
      expect(result.identities,
          isA<BuiltList<CreateUserRequestIdentitiesInner>?>());
      expect(result.identities?.length, isNonZero);
    });
  });
}
