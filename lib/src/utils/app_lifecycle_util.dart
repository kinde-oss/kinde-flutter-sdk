import 'dart:async';

import 'package:flutter/widgets.dart';

/// A utility class for handling app lifecycle events.
class AppLifecycleUtil {
  /// Ensures that the app is in the foreground.
  ///
  /// Returns `true` if the app is resumed (or transitions to resumed within the [timeout]),
  /// or `false` if the [timeout] expires while the app is not in the foreground.
  static Future<bool> ensureAppIsInForeground({
    Duration timeout = const Duration(seconds: 3),
  }) async {
    final state = WidgetsBinding.instance.lifecycleState;

    if (state == AppLifecycleState.resumed) {
      return true;
    }

    final completer = Completer<bool>();

    final resumedLifecycleObserver = _ResumedLifecycleObserver(
      onResumed: () {
        if (!completer.isCompleted) {
          completer.complete(true);
        }
      },
    );

    WidgetsBinding.instance.addObserver(resumedLifecycleObserver);

    final isResumed = await completer.future.timeout(
      timeout,
      onTimeout: () => false,
    );

    WidgetsBinding.instance.removeObserver(resumedLifecycleObserver);

    return isResumed;
  }
}

/// A lifecycle observer that listens for the app to be resumed.
///
/// When the app is resumed, it calls the [onResumed] callback.
class _ResumedLifecycleObserver extends WidgetsBindingObserver {
  _ResumedLifecycleObserver({required this.onResumed});

  final VoidCallback onResumed;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      onResumed();
    }
  }
}

