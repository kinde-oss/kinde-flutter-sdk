package com.kinde.kinde_flutter_sdk

import android.util.Log
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** KindeFlutterSdkPlugin */
class KindeFlutterSdkPlugin : FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel: MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kinde_flutter_sdk")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    try {
      if (call.method == "getPlatformVersion") {
        result.success("Android ${android.os.Build.VERSION.RELEASE}")
      } else {
        result.notImplemented()
      }
    } catch (e: IllegalStateException) {
      // Handle "Reply already submitted" error gracefully
      if (e.message?.contains("Reply already submitted") == true) {
        Log.w(
          "KindeFlutterSdk",
          "Method channel reply already submitted for method: ${call.method}. This may be caused by plugin interference."
        )
        // Don't crash the app, just log the warning
      } else {
        // Re-throw other IllegalStateExceptions
        throw e
      }
    } catch (e: Exception) {
      Log.e("KindeFlutterSdk", "Unexpected error in method call: ${call.method}", e)
      // Try to send error response if possible
      try {
        result.error("UNEXPECTED_ERROR", "An unexpected error occurred: ${e.message}", null)
      } catch (replyException: IllegalStateException) {
        if (replyException.message?.contains("Reply already submitted") == true) {
          Log.w("KindeFlutterSdk", "Cannot send error response - reply already submitted")
        } else {
          throw replyException
        }
      }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
