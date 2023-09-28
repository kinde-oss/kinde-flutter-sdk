import 'package:test/test.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';
import 'package:built_collection/built_collection.dart';

// tests for ErrorResponse
void main() {
  final instance = ErrorResponseBuilder();
  // TODO add properties to the builder and call build()

  group(ErrorResponse, () {
    // BuiltList<Error> errors
    test('to test the property `errors`', () async {
      // TODO
      final errors = instance.errors;
      expect(errors, isA<ListBuilder<Error>>());
      expect(errors.length, isZero);
      Error error = Error();
      instance.errors.add(error);
      final result = instance.build();
      expect(result, isA<ErrorResponse>());
      expect(result.errors, isA<BuiltList<Error>?>());
      expect(result.errors, isNotNull);
      expect(result.errors?.length, isNonZero);
    });
  });
}
