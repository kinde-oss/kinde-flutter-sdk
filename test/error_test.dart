import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for Error
void main() {
  final instance = ErrorBuilder();
  // TODO add properties to the builder and call build()

  group(Error, () {
    // Error code.
    // String code
    test('to test the property `code`', () async {
      // TODO
      final code = instance.code;
      expect(code, isNull);
      instance.code = 'code';
      final result = instance.build();
      expect(result, isA<Error>());
      expect(result.code, isA<String>());
      expect(result.code, isNotNull);
      expect(result.code, equals('code'));
    });

    // Error message.
    // String message
    test('to test the property `message`', () async {
      // TODO
      final message = instance.message;
      expect(message, isNull);
      instance.message = 'message';
      final result = instance.build();
      expect(result, isA<Error>());
      expect(result.message, isA<String>());
      expect(result.message, isNotNull);
      expect(result.message, equals('message'));
    });
  });
}
