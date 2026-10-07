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

class KindeFlutterSdkPlugin : FlutterPlugin, MethodCallHandler, ActivityAware, PluginRegistry.ActivityResultListener {
    private lateinit var channel: MethodChannel
    private var context: Context? = null
    private var activityBinding: ActivityPluginBinding? = null

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "getRescuedAuthJson") {
            context?.let {
                val authCachePreferences = it.getSharedPreferences(AUTH_CACHE_PREFERENCES_NAME, Context.MODE_PRIVATE)
                val responseJson = authCachePreferences.getString(KEY_AUTH_RESPONSE, null)
                val exceptionJson = authCachePreferences.getString(KEY_AUTH_EXCEPTION, null)

                if (responseJson != null || exceptionJson != null) {
                    val rescuedAuthData = mapOf(
                        "response" to responseJson,
                        "exception" to exceptionJson
                    )
                    result.success(rescuedAuthData)

                    authCachePreferences.edit().remove(KEY_AUTH_RESPONSE).remove(KEY_AUTH_EXCEPTION).apply()
                } else {
                    result.success(null)
                }
            } ?: result.success(null)
        } else {
            result.notImplemented()
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if ((requestCode == FLUTTER_APPAUTH_RC_AUTH_EXCHANGE_CODE || requestCode == FLUTTER_APPAUTH_RC_AUTH_CODE) && data != null) {
            val responseJson = data.getStringExtra(EXTRA_AUTH_RESPONSE)
            val exceptionJson = data.getStringExtra(EXTRA_AUTH_EXCEPTION)

            if (responseJson != null || exceptionJson != null) {
                context?.let {
                    val authCachePreferences = it.getSharedPreferences(AUTH_CACHE_PREFERENCES_NAME, Context.MODE_PRIVATE)
                    val editor = authCachePreferences.edit()
                    if (responseJson != null) editor.putString(KEY_AUTH_RESPONSE, responseJson)
                    if (exceptionJson != null) editor.putString(KEY_AUTH_EXCEPTION, exceptionJson)
                    editor.apply()
                }
            }
        }
        return false // Let flutter_appauth also process it
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.kinde.flutter/auth")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        context = null
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        setupActivityBinding(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        teardownActivityBinding()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        setupActivityBinding(binding)
    }

    override fun onDetachedFromActivity() {
        teardownActivityBinding()
    }

    private fun setupActivityBinding(binding: ActivityPluginBinding) {
        activityBinding = binding
        binding.addActivityResultListener(this)
    }

    private fun teardownActivityBinding() {
        activityBinding?.removeActivityResultListener(this)
        activityBinding = null
    }

    companion object {
        // The name of the SharedPreferences file used to cache the authentication response
        private const val AUTH_CACHE_PREFERENCES_NAME = "com.kinde.kinde_flutter_sdk.FlutterAppAuthCache"
        // The SharedPreferences key for the cached auth response
        private const val KEY_AUTH_RESPONSE = "auth_response"
        // The SharedPreferences key for the cached auth exception
        private const val KEY_AUTH_EXCEPTION = "auth_exception"

        // The request code used by flutter_appauth for authorizeAndExchangeCode requests
        private const val FLUTTER_APPAUTH_RC_AUTH_EXCHANGE_CODE = 65030
        // The request code used by flutter_appauth for authorize requests
        private const val FLUTTER_APPAUTH_RC_AUTH_CODE = 65031

        // The extra string used by AppAuth-Android to store the AuthorizationResponse
        private const val EXTRA_AUTH_RESPONSE = "net.openid.appauth.AuthorizationResponse"
        // The extra string used by AppAuth-Android to store the AuthorizationException
        private const val EXTRA_AUTH_EXCEPTION = "net.openid.appauth.AuthorizationException"
    }
}