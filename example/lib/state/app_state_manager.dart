import 'package:flutter/material.dart';
import 'package:flutter_starter_kit/encrypted_box.dart';

import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

class AppStateManager {
  late final KindeFlutterSDK _kindeClient;
  late final EncryptedBox _encryptedBox;
  // Private constructor
  AppStateManager._privateConstructor() {
    _encryptedBox = EncryptedBox.instance;
    _kindeClient = KindeFlutterSDK.instance;
  }
  static final AppStateManager _instance =
      AppStateManager._privateConstructor();

  // Public instance getter
  static AppStateManager get instance => _instance;

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;

  Future<UserProfileV2?> checkIsUserLogged() async {
    _loading.value = true;
    try {
      bool isLogged = await _kindeClient.isAuthenticate();
      if (!isLogged) {
        ///if user not logged, refresh access and refresh token
        final accessToken = await EncryptedBox.instance.returnAccessToken();
        isLogged = accessToken != null;
      }
      if (isLogged) {
        return getProfile();
      }
      return null;
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
      return await _kindeClient.getUserProfileV2();
      // Navigator.of(navigatorKey.currentState!.context).pushReplacementNamed(AppRoutes.HOME)
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
        getProfile();
      }
    } catch (e, st) {
      debugPrintStack(label: "signIn() failed: $e", stackTrace: st);
    } finally {
      _loading.value = false;
    }
  }

  Future<void> signOut() async {
    _loading.value = true;
    try {
      await _kindeClient.logout();
      await _encryptedBox.clear();
      // Navigator.of(navigatorKey.currentState!.context).pushReplacementNamed(AppRoutes.WELCOME);
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
        getProfile();
      }
    } catch (e, st) {
      debugPrintStack(label: "signUp() failed: $e", stackTrace: st);
    } finally {
      _loading.value = false;
    }
  }
}
