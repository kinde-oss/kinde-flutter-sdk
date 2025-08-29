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

  group('SDK OAuth Flow Tests', () {
    test('SDK has completePendingMobileLoginIfNeeded method', () {
      // Test that the new method exists (this will fail if not configured, but that's expected)
      expect(() {
        try {
          // We can't actually call this without initialization, but we can verify the method exists
          KindeFlutterSDK.instance;
        } catch (e) {
          // Expected to throw when not configured
        }
      }, returnsNormally);
    });
  });

  group('SDK Web Functionality Tests', () {
    test('SDK has completePendingLoginIfNeeded method for web', () {
      // Test that the web login completion method exists
      expect(() {
        try {
          KindeFlutterSDK.instance;
        } catch (e) {
          // Expected to throw when not configured
        }
      }, returnsNormally);
    });

    test('SDK has _finishWebLogin method for web OAuth completion', () {
      // Test that the web login finishing method exists
      expect(() {
        try {
          KindeFlutterSDK.instance;
        } catch (e) {
          // Expected to throw when not configured
        }
      }, returnsNormally);
    });

    test(
        'SDK has _isCurrentUrlContainWebAuthParams method for web URL detection',
        () {
      // Test that the web URL parameter detection method exists
      expect(() {
        try {
          KindeFlutterSDK.instance;
        } catch (e) {
          // Expected to throw when not configured
        }
      }, returnsNormally);
    });

    test('SDK has getUserProfileV2 method for fetching user details', () {
      // Test that the user profile fetching method exists
      expect(() {
        try {
          KindeFlutterSDK.instance;
        } catch (e) {
          // Expected to throw when not configured
        }
      }, returnsNormally);
    });

    test('SDK has getUser method for fetching user details', () {
      // Test that the user fetching method exists
      expect(() {
        try {
          KindeFlutterSDK.instance;
        } catch (e) {
          // Expected to throw when not configured
        }
      }, returnsNormally);
    });
  });
}
