package com.kinde.kinde_flutter_sdk

import android.content.Context
import android.content.Intent
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry
import java.util.HashMap

class KindeFlutterSdkPlugin : FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
    private lateinit var channel: MethodChannel
    private var context: Context? = null

    private val PREFS_NAME = "FlutterAppAuthCache"

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.kinde.flutter/auth")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getRescuedAuthJson") {
            val ctx = context
            if (ctx != null) {
                val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                val responseJson = prefs.getString("auth_response", null)
                val exceptionJson = prefs.getString("auth_exception", null)

                if (responseJson != null || exceptionJson != null) {
                    val map = HashMap<String, String?>()
                    map["response"] = responseJson
                    map["exception"] = exceptionJson
                    result.success(map)

                    // Clear cache after reading
                    prefs.edit().remove("auth_response").remove("auth_exception").apply()
                } else {
                    result.success(null)
                }
            } else {
                result.success(null)
            }
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        context = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {}

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivity() {}

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        val AUTH_EXCHANGE_CODE = 65030
        val AUTH_REQUEST_CODE = 65031

        if ((requestCode == AUTH_EXCHANGE_CODE || requestCode == AUTH_REQUEST_CODE) && data != null) {
            val responseJson = data.getStringExtra("net.openid.appauth.AuthorizationResponse")
            val exceptionJson = data.getStringExtra("net.openid.appauth.AuthorizationException")

            if (responseJson != null || exceptionJson != null) {
                val ctx = context
                if (ctx != null) {
                    val prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
                    val editor = prefs.edit()
                    if (responseJson != null) editor.putString("auth_response", responseJson)
                    if (exceptionJson != null) editor.putString("auth_exception", exceptionJson)
                    editor.apply()
                }
            }
        }
        return false // Let flutter_appauth also process it
    }
}
