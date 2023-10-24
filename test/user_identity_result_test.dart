import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for UserIdentityResult
void main() {
  final instance = UserIdentityResultBuilder();
  // TODO add properties to the builder and call build()

  group(UserIdentityResult, () {
    // True if the user identity was successfully created.
    // bool created
    test('to test the property `created`', () async {
      // TODO
      final created = instance.created;
      expect(created, isNull);
      instance.created = true;
      final result = instance.build();
      expect(result, isA<UserIdentityResult>());
      expect(result.created, isNotNull);
      expect(result.created, isA<bool>());
      expect(result.created, isTrue);
    });
  });
}
