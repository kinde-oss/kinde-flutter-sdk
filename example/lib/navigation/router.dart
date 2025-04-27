import 'package:flutter/foundation.dart';
import 'package:flutter_starter_kit/screens/splash/splash_screen.dart';
import 'package:flutter_starter_kit/screens/unknown/unknown_screen.dart';
import 'package:flutter_starter_kit/screens/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/home/home_screen.dart';
import '../screens/routes.dart';

GoRouter createRouter() => GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: AppRoutes.SPLASH,
  errorBuilder: (context, state) {
    return const UnknownScreen();
  },
  routes: [
    GoRoute(
        path: AppRoutes.HOME,
        builder: (context, state) {
          return const HomeScreen();
        }),
    GoRoute(
        path: AppRoutes.SPLASH,
        builder: (context, state) {
          return const SplashScreen();
        }),
    GoRoute(
        path: AppRoutes.WELCOME,
        builder: (context, state) {
          return const WelcomeScreen();
        }),

  ],
);
