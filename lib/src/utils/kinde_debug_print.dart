import 'package:flutter/foundation.dart';

/// Global flag to enable/disable Kinde SDK logging.
///
/// Set to false to disable all SDK logging in production if needed.
bool kindeLoggingEnabled = true;

/// Configure Kinde SDK logging.
///
/// [enabled] - Set to false to disable all SDK logging.
void configureKindeLogging({required bool enabled}) {
  kindeLoggingEnabled = enabled;
}

/// Production-safe logging for Kinde SDK operations.
///
/// Logs are formatted as: `KINDE: methodName - message | key=value, ...`
///
/// [methodName] - The method or component name
/// [message] - The log message
/// [context] - Optional structured data (key-value pairs)
void kindeDebugPrint({
  required String methodName,
  required String message,
  Map<String, dynamic>? context,
}) {
  if (!kindeLoggingEnabled) return;

  try {
    final buffer = StringBuffer('KINDE: $methodName - $message');

    if (context != null && context.isNotEmpty) {
      buffer.write(' | ');
      final entries = context.entries.map((e) => '${e.key}=${e.value}').join(', ');
      buffer.write(entries);
    }

    debugPrint(buffer.toString());
  } catch (_) {
    // Logging should never crash the app
  }
}
