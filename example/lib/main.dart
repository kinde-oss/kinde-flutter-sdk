import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_kit/encrypted_box.dart';
import 'package:flutter_starter_kit/screens/routes.dart';
import 'package:flutter_starter_kit/state/app_state_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'navigation/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();
  await dotenv.load(fileName: ".env");

  await KindeFlutterSDK.initializeSDK(
      authDomain: dotenv.env['KINDE_AUTH_DOMAIN']!,
      authClientId: dotenv.env['KINDE_AUTH_CLIENT_ID']!,
      loginRedirectUri: dotenv.env['KINDE_LOGIN_REDIRECT_URI']!,
      logoutRedirectUri: dotenv.env['KINDE_LOGOUT_REDIRECT_URI']!,
      scopes: ["email", "profile", "offline", "openid"] // optional
      );

  await EncryptedBox.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoRouter _router;
  StreamSubscription<(UserProfileV2?, UserProfileV2?)>? _userStreamSubscription;

  @override
  void initState() {
    super.initState();
    _router = createRouter();
    _subscribeUserChangesStream();
  }

  void _subscribeUserChangesStream() {
    if (kIsWeb) return;
    _userStreamSubscription = AppStateManager.instance.userProfileStream.stream
        .listen((userProfileChanges) {
      final oldUser = userProfileChanges.$1;
      final newUser = userProfileChanges.$2;
      if (oldUser == null && newUser != null) {
        _navigateToHome();
      }
      if (oldUser != null && newUser == null) {
        _navigateToWelcome();
      }
    });
  }

  void _navigateToHome() {
    _router.pushReplacement(AppRoutes.HOME);
  }

  void _navigateToWelcome() {
    _router.pushReplacement(AppRoutes.WELCOME);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, _) => MaterialApp.router(
        routerConfig: _router,
        title: 'Flutter Kinde StarterKit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _userStreamSubscription?.cancel();
    super.dispose();
  }
}
