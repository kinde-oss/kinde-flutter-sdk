import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_kit/encrypted_box.dart';
import 'package:flutter_starter_kit/screens/home/home_screen.dart';
import 'package:flutter_starter_kit/screens/routes.dart';
import 'package:flutter_starter_kit/screens/splash/splash_screen.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'screens/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // usePathUrlStrategy();
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, _) => MaterialApp(
        title: 'Flutter Kinde StarterKit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onUnknownRoute: (settings) => UnknownScreen.pageRoute,
        initialRoute: AppRoutes.SPLASH,
        onGenerateRoute: (settings) {
          if(settings.name == null) {
            return UnknownScreen.pageRoute;
          }
          final uri = Uri.parse(settings.name!);
          final extractedPath = uri.path;
          return switch (extractedPath) {
            AppRoutes.HOME => HomeScreen.pageRoute(uri.queryParameters),
            AppRoutes.SPLASH => SplashScreen.pageRoute,
            AppRoutes.WELCOME => WelcomeScreen.pageRoute,
            _ => UnknownScreen.pageRoute
          };
        },
      ),
    );
  }
}

class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  static MaterialPageRoute get pageRoute => MaterialPageRoute(
        builder: (context) =>
            const UnknownScreen(), // Optional: a fallback for unknown routes
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unknown Page')),
      body: const Center(
        child: Text('404 - Page not found'),
      ),
    );
  }
}
