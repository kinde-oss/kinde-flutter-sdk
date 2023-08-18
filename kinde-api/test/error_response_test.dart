import 'package:test/test.dart';
import 'package:kinde_api/kinde_api.dart';
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
      Error _error = Error();
      instance.errors.add(_error);
      final result = instance.build();
      expect(result, isA<ErrorResponse>());
      expect(result.errors, isA<BuiltList<Error>?>());
      expect(result.errors, isNotNull);
      expect(result.errors?.length, isNonZero);
    });
  });
}
