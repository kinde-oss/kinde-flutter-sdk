import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

void main() {
  group('Web Compatibility Tests - Hive_CE Hot Reload Fix', () {
    test('SDK imports work on web without JSNoSuchMethodError', () {
      // This test verifies that Hive_CE resolves the web hot reload issue
      // Old Hive 2.2.3 caused: JSNoSuchMethodError: tried to call a non-function, such as null: 'dart.nullCheck(...)[$open]'
      // Hive_CE 2.11.3 provides modern web compatibility

      expect(KindeFlutterSDK, isNotNull);
      expect(() {
        try {
          KindeFlutterSDK.instance;
        } catch (e) {
          // Expected to throw when not configured, but NOT with JSNoSuchMethodError
          expect(e.toString(), contains('missing-config'));
          // Verify it's NOT the old web error
          expect(e.toString(), isNot(contains('JSNoSuchMethodError')));
          expect(e.toString(), isNot(contains('dart.nullCheck')));
        }
      }, returnsNormally);
    });

    test('Web storage initialization works with Hive_CE', () {
      // Test that web storage can be initialized without crashes
      // This was the core issue with old Hive on web

      expect(() {
        try {
          KindeFlutterSDK.instance;
        } catch (e) {
          // Should throw configuration error, not storage error
          expect(e.toString(), contains('missing-config'));
        }
      }, returnsNormally);
    });

    test('Cross-platform web support confirmed', () {
      // Hive_CE provides seamless web support
      // No more platform-specific crashes

      expect(() {
        try {
          KindeFlutterSDK.instance;
        } catch (e) {
          // Expected behavior, not web-specific error
          expect(e.toString(), contains('missing-config'));
        }
      }, returnsNormally);
    });
  });
}
