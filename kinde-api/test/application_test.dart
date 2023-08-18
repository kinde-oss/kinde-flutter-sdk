import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';

// tests for Application
void main() {
  final instance = ApplicationBuilder();
  // TODO add properties to the builder and call build()

  group(Application, () {
    // String appId
    test('to test the property `appId`', () async {
      // TODO
      final appId = instance.appId;
      expect(appId, isNull);
      instance.appId = 'appId';
      final result = instance.build();
      expect(result, isA<Application>());
      expect(result.appId, isNotNull);
      expect(result.appId, equals('appId'));
    });

    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = 'name';
      final result = instance.build();
      expect(result, isA<Application>());
      expect(result.name, isNotNull);
      expect(result.name, equals('name'));
    });
  });
}
