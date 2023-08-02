import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:kinde_flutter_sdk/src/keys/keys.dart';
import 'package:kinde_flutter_sdk/src/token/auth_state.dart';

class Store {
  static const String _authState = 'auth_state';
  static const String _boxName = 'kinde_preference';
  static const String _keys = 'keys';

  static Store? _instance;

  Store._internal();

  static Store get instance {
    _instance ??= Store._internal();
    return _instance ?? Store._internal();
  }

  Box get _box => Hive.box(_boxName);

  static Future<void> init(HiveCipher? encryptionCipher, String? path) async {
    Hive.init(path);
    await Hive.openBox(_boxName, encryptionCipher: encryptionCipher);
  }

  AuthState? get authState {
    final currentData = _box.get(_authState) as String?;
    if (currentData == null || currentData.toLowerCase() == "null") {
      return null;
    } else {
      return AuthState.fromJson(jsonDecode(currentData) as Map<String, dynamic>);
    }
  }

  set authState(AuthState? value) {
    final json = jsonEncode(value);
    _box.put(_authState, json);
  }

  Keys? get keys {
    final currentData = _box.get(_keys) as String?;
    if (currentData == null || currentData.toLowerCase() == "null") {
      return null;
    } else {
      return Keys.fromJson(jsonDecode(currentData) as Map<String, dynamic>);
    }
  }

  set keys(Keys? keys) {
    final json = jsonEncode(keys);
    _box.put(_keys, json);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}

