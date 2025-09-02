import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_starter_kit/encrypted_box.dart';

import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

class AppStateManager {
  late final KindeFlutterSDK _kindeClient;
  late final EncryptedBox _encryptedBox;

  late final StreamController<(UserProfileV2?, UserProfileV2?)>
      userProfileStream;

  UserProfileV2? _userProfile;
  UserProfileV2? get userProfile => _userProfile;

  void _setUser(UserProfileV2? userProfile) {
    final oldUser = _userProfile;
    _userProfile = userProfile;
    userProfileStream.sink.add((oldUser, _userProfile));
  }

  // Private constructor
  AppStateManager._privateConstructor() {
    _encryptedBox = EncryptedBox.instance;
    _kindeClient = KindeFlutterSDK.instance;
    userProfileStream = StreamController.broadcast();
  }
  static final AppStateManager _instance =
      AppStateManager._privateConstructor();

  // Public instance getter
  static AppStateManager get instance => _instance;

  final ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  Future<UserProfileV2?> checkIsUserLogged() async {
    _loading.value = true;
    try {
      if (kIsWeb) {
        final loginCompleted =
            await _kindeClient.completePendingLoginIfNeeded();
      } else {
        await _kindeClient.completePendingLoginIfNeeded();
      }

      bool isLogged = await _kindeClient.isAuthenticated();

      if (!isLogged) {
        final accessToken = await EncryptedBox.instance.returnAccessToken();
        isLogged = accessToken != null;
      }

      if (isLogged) {
        final user = await getProfile();
        _setUser(user);
      } else {
        _setUser(null);
      }
      return userProfile;
    } catch (e, st) {
      debugPrintStack(label: "_checkIsUserLogged() failed: $e", stackTrace: st);
      return null;
    } finally {
      _loading.value = false;
    }
  }

  Future<UserProfileV2?> getProfile() async {
    _loading.value = true;
    try {
      return _kindeClient.getUserProfileV2();
    } catch (e, st) {
      debugPrintStack(label: "getProfile() failed: $e", stackTrace: st);
      rethrow;
    } finally {
      _loading.value = false;
    }
  }

  Future<void> signIn() async {
    _loading.value = true;
    try {
      final token = await _kindeClient.login(type: AuthFlowType.pkce);
      if (token != null) {
        await _encryptedBox.saveToken(token);
        final user = await getProfile();
        _setUser(user);
        //in web app will be opened KINDE_LOGIN_REDIRECT_URI set in .evn, for others handle it manually
      }
    } catch (e, st) {
      debugPrintStack(label: "signIn() failed: $e", stackTrace: st);
    } finally {
      _loading.value = false;
    }
  }

  Future<void> signOut() async {
    if (userProfile == null) return;
    _loading.value = true;
    try {
      await _kindeClient.logout();
      await _encryptedBox.clear();
      _setUser(null);
    } catch (e, st) {
      debugPrintStack(label: "signOut() failed: $e", stackTrace: st);
    } finally {
      _loading.value = false;
    }
  }

  Future<void> signUp() async {
    _loading.value = true;
    try {
      final token = await _kindeClient.register();
      if (token != null) {
        await _encryptedBox.saveToken(token);
        final user = await getProfile();
        _setUser(user);
      }
    } catch (e, st) {
      debugPrintStack(label: "signUp() failed: $e", stackTrace: st);
    } finally {
      _loading.value = false;
    }
  }
}
