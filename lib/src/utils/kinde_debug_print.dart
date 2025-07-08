import 'package:flutter/foundation.dart';

void kindeDebugPrint({
  required String methodName,
  required String message,
}) {
  assert(() {
    debugPrint('''KINDE_DEBUG:
  {
    method: $methodName,
    message: $message
  }''');
    return true;
  }());
}
