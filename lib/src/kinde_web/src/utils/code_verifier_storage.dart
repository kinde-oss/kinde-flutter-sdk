import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CodeVerifierStorage {
  static CodeVerifierStorage? _instance;
  CodeVerifierStorage._();

  static const String _codeVerifierKey = 'codeVerifier';

  SharedPreferences? _sharedPreferences;

  static Future<CodeVerifierStorage> initialize() async {
    if (_instance != null) return _instance!;
    final instance = CodeVerifierStorage._();
    try {
      instance._sharedPreferences = await SharedPreferences.getInstance();
      _instance = instance;
        } catch (e) {
          debugPrint('Failed to initialize SharedPreferences: $e');
          rethrow;
        }
    return instance;
  }

  /// Restores the state of [codeVerifier].
  /// Only used in web.
  String? restore() {
    if (_sharedPreferences == null) {
      debugPrint('SharedPreferences not initialized');
      return null;
    }
    final code = _sharedPreferences?.getString(_codeVerifierKey);
    return code;
  }

  /// Clears the last [codeVerifier] saved state.
  /// Only used in web.
  Future<void> clear() async {
    if (_sharedPreferences == null) {
      debugPrint('SharedPreferences not initialized');
      return;
    }
    await _sharedPreferences?.remove(_codeVerifierKey);
  }

  /// Saves the state of [codeVerifier].
  /// Only used in web.
  Future<void> save(String codeVerifier) async {
    if (_sharedPreferences == null) {
      debugPrint('SharedPreferences not initialized');
      return;
    }
    await _sharedPreferences!.setString(_codeVerifierKey, codeVerifier);
  }
}
