import 'package:flutter/foundation.dart';

/// The default logging state.
///
/// `true` in debug mode and `false` otherwise (profile and release mode)
const bool _kDefaultLoggingEnabled = kDebugMode;

/// Flag to enable/disable Kinde SDK logging.
///
/// Set to [_kDefaultLoggingEnabled] by default.
bool _kindeLoggingEnabled = _kDefaultLoggingEnabled;

/// Returns the current logging enabled state.
@visibleForTesting
bool get kindeLoggingEnabled => _kindeLoggingEnabled;

/// Resets the logging enabled state to the default.
@visibleForTesting
void resetKindeLoggingToDefault() {
  _kindeLoggingEnabled = _kDefaultLoggingEnabled;
}

/// Configure Kinde SDK logging.
///
/// [enabled] - Set to false to disable all SDK logging.
void configureKindeLogging({required bool enabled}) {
  _kindeLoggingEnabled = enabled;
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
  if (!_kindeLoggingEnabled) return;

  try {
    final buffer = StringBuffer('KINDE: $methodName - $message');

    if (context != null && context.isNotEmpty) {
      buffer.write(' | ');
      final entries = context.entries
          .map((e) => '${e.key}=${e.value}')
          .join(', ');
      buffer.write(entries);
    }

    debugPrint(buffer.toString());
  } catch (_) {
    // Logging should never crash the app
  }
}
