import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for CreateUserRequestIdentitiesInner
void main() {
  final instance = CreateUserRequestIdentitiesInnerBuilder();
  // TODO add properties to the builder and call build()

  group(CreateUserRequestIdentitiesInner, () {
    // The type of identity to create, for e.g. email.
    // String type
    test('to test the property `type`', () async {
      // TODO
      final type = instance.type;
      expect(type, isNull);
      instance.type = CreateUserRequestIdentitiesInnerTypeEnum.email;
      final result = instance.build();
      expect(result, isA<CreateUserRequestIdentitiesInner>());
      expect(result.type, isA<CreateUserRequestIdentitiesInnerTypeEnum?>());
      expect(result.type, isNotNull);
      expect(
          result.type, equals(CreateUserRequestIdentitiesInnerTypeEnum.email));
    });

    // CreateUserRequestIdentitiesInnerDetails details
    test('to test the property `details`', () async {
      // TODO
      final details = instance.details;
      expect(details, isA<CreateUserRequestIdentitiesInnerDetailsBuilder>());
      CreateUserRequestIdentitiesInnerDetailsBuilder details0 =
          CreateUserRequestIdentitiesInnerDetailsBuilder();
      details0.email = 'email';
      instance.details = details0;
      final result = instance.build();
      expect(result, isA<CreateUserRequestIdentitiesInner>());
      expect(result.details, isA<CreateUserRequestIdentitiesInnerDetails>());
      expect(result.details, isNotNull);
      expect(result.details?.email, equals(isA<String>()));
      expect(result.details?.email, equals('email'));
    });
  });
}
