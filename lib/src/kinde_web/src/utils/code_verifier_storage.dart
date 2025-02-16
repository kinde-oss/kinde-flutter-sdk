import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CodeVerifierStorage {
  CodeVerifierStorage._();

  static const String _codeVerifierKey = 'codeVerifier';

  SharedPreferences? _sharedPreferences;

  static Future<CodeVerifierStorage> initialize() async {
    final instance = CodeVerifierStorage._();
    try {
      instance._sharedPreferences = await SharedPreferences.getInstance();
        } catch (e) {
          debugPrint('Failed to initialize SharedPreferences: $e');
          rethrow;
        }
    return instance;
  }

  /// Restores the state of [codeVerifier].
  /// Only used in web.
  String? restore() {
    final code = _sharedPreferences?.getString(_codeVerifierKey);
    debugPrint('------ OAuthWebAuth codeVerifier: $code ------');
    return code;
  }

  /// Clears the last [codeVerifier] saved state.
  /// Only used in web.
  void clear() {
    _sharedPreferences?.remove(_codeVerifierKey);
  }

  /// Saves the state of [codeVerifier].
  /// Only used in web.
  void save(String codeVerifier) {
    _sharedPreferences?.setString(_codeVerifierKey, codeVerifier);
  }
}
