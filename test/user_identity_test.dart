import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for UserIdentity
void main() {
  final instance = UserIdentityBuilder();
  // TODO add properties to the builder and call build()

  group(UserIdentity, () {
    // The type of identity object created.
    // String type
    test('to test the property `type`', () async {
      // TODO
      final type = instance.type;
      expect(type, isNull);
      instance.type = 'type';
      final result = instance.build();
      expect(result, isA<UserIdentity>());
      expect(result.type, isNotNull);
      expect(result.type, isA<String>());
      expect(result.type, equals('type'));
    });

    // UserIdentityResult result
    test('to test the property `result`', () async {
      // TODO
      final result = instance.result;
      expect(result, isA<UserIdentityResultBuilder>());
      expect(result.created, isNull);
      UserIdentityResultBuilder userIdentityResultBuilder =
          UserIdentityResultBuilder();
      userIdentityResultBuilder.created = true;
      instance.result = userIdentityResultBuilder;
      final instanceResult = instance.build();
      expect(instanceResult.result, isNotNull);
      expect(instanceResult.result, isA<UserIdentityResult?>());
      expect(instanceResult.result?.created, isTrue);
    });
  });
}
