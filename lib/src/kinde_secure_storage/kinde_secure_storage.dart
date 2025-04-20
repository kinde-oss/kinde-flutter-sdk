import 'dart:convert';
import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kinde_flutter_sdk/src/utils/kinde_debug_print.dart';

import 'kinde_secure_storage_i.dart';

abstract class SecureStorageKey {
  static const String encryption = 'encryptionKey';
  static const String authRequestState = 'authRequestStateKey';
}

class KindeSecureStorage implements KindeSecureStorageInterface {
  KindeSecureStorage({FlutterSecureStorage? secureStorage})
      : _secureStorage = secureStorage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _secureStorage;

  @override
  Future<List<int>?> getSecureKey() async {
    try {
      final base64 =
      await _secureStorage.read(key: SecureStorageKey.encryption);
      if (base64 == null) return null;
      return base64Url.decode(base64);
    } catch (e) {
      kindeDebugPrint(
        methodName: "getSecureKey",
        message: "Error type: ${e.runtimeType}",
      );
      return null;
    }
  }

  @override
  Future<void> saveSecureKey(List<int> secureKey) async {
    try {
      await _secureStorage.write(
        key: SecureStorageKey.encryption,
        value: base64UrlEncode(secureKey),
      );
    } catch (e) {
      kindeDebugPrint(
        methodName: "saveSecureKey",
        message: e.toString(),
      );
    }
  }

  @override
  Future<String?> getAuthRequestState() {
    return _secureStorage.read(key: SecureStorageKey.authRequestState);
  }

  @override
  Future<void> saveAuthRequestState(String state) {
    return _secureStorage.write(
      key: SecureStorageKey.authRequestState,
      value: state,
    );
  }

  @override
  Future<void> removeAuthRequestState() {
    return _secureStorage.delete(key: SecureStorageKey.authRequestState);
  }
}

String generateAuthState() {
  final randomBytes =
      List<int>.generate(32, (i) => Random.secure().nextInt(256));
  return base64UrlEncode(randomBytes);
}
