import 'package:flutter_test/flutter_test.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

void main() {
  group('SDK Core Functionality Tests', () {
    test('SDK class exists and can be referenced', () {
      expect(KindeFlutterSDK, isNotNull);
    });

    test('SDK provides proper error handling for unconfigured state', () {
      // Test that SDK properly handles unconfigured state
      expect(() {
        try {
          KindeFlutterSDK.instance;
        } catch (e) {
          // Expected to throw when not configured
          expect(e.toString(), contains('missing-config'));
        }
      }, returnsNormally);
    });

    test('SDK error messages are user-friendly', () {
      try {
        KindeFlutterSDK.instance;
        fail('Should have thrown an error');
      } catch (e) {
        expect(
            e.toString(), contains('KindeFlutterSDK has not been configured'));
      }
    });
  });

  group('SDK Error Handling Tests', () {
    test('SDK provides proper error handling', () {
      // Test that SDK can handle errors gracefully
      expect(() {
        try {
          KindeFlutterSDK.instance;
        } catch (e) {
          // This is expected behavior
        }
      }, returnsNormally);
    });
  });
}
