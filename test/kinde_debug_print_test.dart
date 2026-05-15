import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';

void main() {
  group('configureKindeLogging', () {
    test('logging is enabled by default', () {
      expect(kindeLoggingEnabled, isTrue);
    });

    group('toggling logging on and off', () {
      setUp(() {
        // Reset to 'true' before each test
        configureKindeLogging(enabled: true);
      });

      tearDownAll(() {
        // Reset to 'true' after all tests
        configureKindeLogging(enabled: true);
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
    });
  });

  group('kindeDebugPrint', () {
    test('basic logging works without crashing', () {
      expect(
        () => kindeDebugPrint(methodName: 'test', message: 'basic message'),
        returnsNormally,
      );
    });

    test('logging with context works without crashing', () {
      expect(
        () => kindeDebugPrint(
          methodName: 'test',
          message: 'message with context',
          context: {'key1': 'value1', 'key2': 42, 'key3': true},
        ),
        returnsNormally,
      );
    });

    test('logging never throws exceptions even with problematic context', () {
      expect(
        () => kindeDebugPrint(
          methodName: 'test',
          message: 'message',
          context: {'null_value': null, 'empty_string': ''},
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

    test('logging when disabled does not print anything', () {
      configureKindeLogging(enabled: false);
      expect(
        () => kindeDebugPrint(
          methodName: 'test',
          message: 'should not log',
          context: {'key': 'value'},
        ),
        prints(''),
      );
    });

    test('logging when enabled prints to console', () {
      configureKindeLogging(enabled: true);
      expect(
        () => kindeDebugPrint(
          methodName: 'test',
          message: 'should log',
          context: {'key': 'value'},
        ),
        prints('KINDE: test - should log | key=value\n'),
      );
    });
  });
}
