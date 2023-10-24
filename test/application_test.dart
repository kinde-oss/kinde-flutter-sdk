import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

// tests for Applications
void main() {
  final instance = ApplicationsBuilder();
  // TODO add properties to the builder and call build()

  group(Applications, () {
    // String appId
    test('to test the property `id`', () async {
      // TODO
      final id = instance.id;
      expect(id, isNull);
      instance.id = 'id';
      final result = instance.build();
      expect(result, isA<Applications>());
      expect(result.id, isNotNull);
      expect(result.id, equals('id'));
    });

    // String name
    test('to test the property `name`', () async {
      // TODO
      final name = instance.name;
      expect(name, isNull);
      instance.name = 'name';
      final result = instance.build();
      expect(result, isA<Applications>());
      expect(result.name, isNotNull);
      expect(result.name, equals('name'));
    });
  });
}
