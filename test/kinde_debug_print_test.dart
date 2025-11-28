import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';

void main() {
  group('kindeDebugPrint', () {
    setUp(() {
      // Reset to default before each test
      kindeLoggingEnabled = true;
    });

    test('logging is enabled by default', () {
      expect(kindeLoggingEnabled, isTrue);
    });

    test('can disable logging via configuration', () {
      configureKindeLogging(enabled: false);
      expect(kindeLoggingEnabled, isFalse);
    });

    test('can re-enable logging via configuration', () {
      configureKindeLogging(enabled: false);
      configureKindeLogging(enabled: true);
      expect(kindeLoggingEnabled, isTrue);
    });

    test('basic logging works without crashing', () {
      expect(
        () => kindeDebugPrint(
          methodName: 'test',
          message: 'basic message',
        ),
        returnsNormally,
      );
    });

    test('logging with context works without crashing', () {
      expect(
        () => kindeDebugPrint(
          methodName: 'test',
          message: 'message with context',
          context: {
            'key1': 'value1',
            'key2': 42,
            'key3': true,
          },
        ),
        returnsNormally,
      );
    });

    test('logging never throws exceptions even with problematic context', () {
      expect(
        () => kindeDebugPrint(
          methodName: 'test',
          message: 'message',
          context: {
            'null_value': null,
            'empty_string': '',
          },
        ),
        returnsNormally,
      );
    });

    test('logging when disabled does not crash', () {
      configureKindeLogging(enabled: false);

      expect(
        () => kindeDebugPrint(
          methodName: 'test',
          message: 'should not log',
          context: {'key': 'value'},
        ),
        returnsNormally,
      );
    });
  });
}

