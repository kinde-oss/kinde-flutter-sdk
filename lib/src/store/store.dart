import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kinde_flutter_sdk/src/keys/keys.dart';
import 'package:kinde_flutter_sdk/src/token/auth_state.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';

class Store {
  static const String _authStateKey = 'kinde_auth_state';
  static const String _keysKey = 'kinde_keys';

  static Store? _instance;

  late final FlutterSecureStorage _storage;

  Store._internal();

  static Store get instance {
    return _instance ??= Store._internal();
  }

  static Future<void> init() async {
    _instance = Store._internal();
    _instance!._storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
      webOptions: WebOptions(
        dbName: 'kinde_secure_storage',
        publicKey: 'kinde_public_key',
      ),
    );
  }

  AuthState? get authState {
    // This is now async, but we'll handle it synchronously by caching
    // The actual async read happens in _readAuthState
    return _cachedAuthState;
  }

  set authState(AuthState? value) {
    _cachedAuthState = value;
    _writeAuthState(value);
  }

  Keys? get keys {
    // This is now async, but we'll handle it synchronously by caching
    return _cachedKeys;
  }

  set keys(Keys? value) {
    _cachedKeys = value;
    _writeKeys(value);
  }

  // Cache to support synchronous getters
  AuthState? _cachedAuthState;
  Keys? _cachedKeys;

  // Load cached values from storage
  Future<void> loadFromStorage() async {
    await _readAuthState();
    await _readKeys();
  }

  Future<void> _readAuthState() async {
    try {
      final currentData = await _storage.read(key: _authStateKey);
      if (currentData == null || currentData.toLowerCase() == "null") {
        _cachedAuthState = null;
      } else {
        _cachedAuthState = AuthState.fromJson(
          jsonDecode(currentData) as Map<String, dynamic>,
        );
      }
    } catch (e) {
      kindeDebugPrint(
        methodName: "Store._readAuthState",
        message: "Error reading auth state: $e",
      );
      _cachedAuthState = null;
    }
  }

  Future<void> _writeAuthState(AuthState? value) async {
    try {
      final json = jsonEncode(value?.toJson());
      await _storage.write(key: _authStateKey, value: json);
    } catch (e) {
      kindeDebugPrint(
        methodName: "Store._writeAuthState",
        message: "Error writing auth state: $e",
      );
    }
  }

  Future<void> _readKeys() async {
    try {
      final currentData = await _storage.read(key: _keysKey);
      if (currentData == null || currentData.toLowerCase() == "null") {
        _cachedKeys = null;
      } else {
        _cachedKeys = Keys.fromJson(jsonDecode(currentData) as Map<String, dynamic>);
      }
    } catch (e) {
      kindeDebugPrint(
        methodName: "Store._readKeys",
        message: "Error reading keys: $e",
      );
      _cachedKeys = null;
    }
  }

  Future<void> _writeKeys(Keys? value) async {
    try {
      final json = jsonEncode(value?.toJson());
      await _storage.write(key: _keysKey, value: json);
    } catch (e) {
      kindeDebugPrint(
        methodName: "Store._writeKeys",
        message: "Error writing keys: $e",
      );
    }
  }

  Future<void> clear() async {
    try {
      await _storage.delete(key: _authStateKey);
      await _storage.delete(key: _keysKey);
      _cachedAuthState = null;
      _cachedKeys = null;
    } catch (e) {
      kindeDebugPrint(
        methodName: "Store.clear",
        message: "Error clearing store: $e",
      );
    }
  }
}
