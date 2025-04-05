import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageKey {
  static const String encryption = 'encryptionKey';
  ///Cross-Site Request Forgery
  static const String authRequestState = 'authRequestStateKey';
}

class KindeSecureStorage {

  static final KindeSecureStorage _instance = KindeSecureStorage._();
  static KindeSecureStorage get instance => _instance;

  KindeSecureStorage._() {
    _secureStorage = const FlutterSecureStorage();
  }

  late final FlutterSecureStorage _secureStorage;

  Future<List<int>?> getSecureKey() async {
    final base64 = await _secureStorage.read(key: SecureStorageKey.encryption);
    if(base64 == null) return null;
    return base64Url.decode(base64);
  }

  Future<void> saveSecureKey(List<int> secureKey) async {
    await _secureStorage.write(
        key: SecureStorageKey.encryption, value: base64UrlEncode(secureKey));
  }

  Future<String?> getAuthRequestState() async {
    final storedState = await _secureStorage.read(key: SecureStorageKey.authRequestState);
    return storedState;
  }

  Future<void> saveAuthRequestState(String state) async {
    await _secureStorage.write(
        key: SecureStorageKey.authRequestState, value: state);
  }
}

String generateAuthState() {
  final generatedState = const Base64Encoder.urlSafe()
      .convert(DateTime.now().toIso8601String().codeUnits);
  return generatedState;
}
