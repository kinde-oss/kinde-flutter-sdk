package com.kinde.kinde_flutter_sdk

import android.app.Activity
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/**
 * KindeFlutterSdkPlugin
 *
 * This plugin implements ActivityAware to handle activity result interference
 * from other plugins that might consume activity results without proper requestCode filtering.
 *
 * The main issue occurs when plugins like flutter_appauth (used for authentication)
 * receive activity results that are intercepted by rogue plugins consuming all results.
 */
class KindeFlutterSdkPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private var activity: Activity? = null
  private var activityPluginBinding: ActivityPluginBinding? = null

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "kinde_flutter_sdk")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  /**
   * ActivityAware implementation to ensure proper plugin registration order.
   *
   * Note: The actual crash protection happens at the Flutter level in error handling.
   * This Android implementation ensures we're properly registered and don't interfere
   * with other plugins' activity result handling.
   *
   * The "Reply already submitted" crash occurs when:
   * 1. flutter_appauth starts an activity and expects a result
   * 2. A rogue plugin consumes ALL activity results without requestCode filtering
   * 3. flutter_appauth's method channel reply fails because result was already consumed
   *
   * The fix: Flutter-side error handling catches this PlatformException and converts it
   * to a KindeError with pluginInterference code, preventing the app crash.
   */
  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
    activityPluginBinding = binding

    // We don't add an activity result listener here because:
    // 1. We don't handle activity results directly (flutter_appauth does)
    // 2. Adding a listener that returns false would still be called before flutter_appauth
    // 3. The real protection is in Flutter-side error handling

    // This method ensures proper Activity lifecycle management
    // but we intentionally don't interfere with activity result handling
  }

  override fun onDetachedFromActivityForConfigChanges() {
    activity = null
    activityPluginBinding = null
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
    activityPluginBinding = binding
  }

  override fun onDetachedFromActivity() {
    activity = null
    activityPluginBinding = null
  }
}
