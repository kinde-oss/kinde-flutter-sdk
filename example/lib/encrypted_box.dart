import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

class EncryptedBox {
  static const String _tokenKey = 'app_token';

  static EncryptedBox? _instance;

  late final FlutterSecureStorage _secureStorage;

  EncryptedBox._privateConstructor();

  static EncryptedBox get instance {
    if (_instance == null) {
      throw Exception("EncryptedBox not initialized. Call init() first.");
    }
    return _instance!;
  }

  static Future<void> init() async {
    _instance = EncryptedBox._privateConstructor();
    _instance!._secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
      iOptions: IOSOptions(
        accessibility: KeychainAccessibility.first_unlock,
      ),
      webOptions: WebOptions(
        dbName: 'app_secure_storage',
        publicKey: 'app_public_key',
      ),
    );
  }

  Future<String?> returnAccessToken() async {
    String? token;
    try {
      token = await _secureStorage.read(key: _tokenKey);
    } catch (e) {
      debugPrint("Error reading token: ${e.toString()}");
    }

    if (token == null) {
      return await getNewToken();
    }

    try {
      bool hasExpired = JwtDecoder.isExpired(token);
      if (hasExpired) {
        return await getNewToken();
      }
      return token;
    } catch (e) {
      debugPrint("Error decoding token: ${e.toString()}");
      // Token might be malformed, get a new one
      return await getNewToken();
    }
  }

  Future<String?> getNewToken() async {
    try {
      final String? token = await KindeFlutterSDK.instance.getToken();
      if (token != null) {
        await saveToken(token);
      }
      return token;
    } catch (e) {
      debugPrint("Error getting new token: ${e.toString()}");
      return null;
    }
  }

  Future<void> saveToken(String token) async {
    try {
      await _secureStorage.write(key: _tokenKey, value: token);
    } catch (e) {
      debugPrint("saveToken() failed: ${e.toString()}");
    }
  }

  Future<void> clear() async {
    try {
      await _secureStorage.delete(key: _tokenKey);
    } catch (e) {
      debugPrint("clear() failed: ${e.toString()}");
    }
  }
}