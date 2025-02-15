import 'package:flutter/foundation.dart';
import 'package:flutter_starter_kit/main.dart';
import 'package:flutter_starter_kit/screens/splash/splash_screen.dart';
import 'package:flutter_starter_kit/screens/welcome/welcome_screen.dart';
import 'package:flutter_starter_kit/state/app_state_manager.dart';
import 'package:go_router/go_router.dart';

import '../screens/home/home_screen.dart';
import '../screens/routes.dart';

GoRouter createRouter() => GoRouter(
  debugLogDiagnostics: kDebugMode,
  initialLocation: AppRoutes.SPLASH,
  errorBuilder: (context, state) {
    return const UnknownScreen();
  },
  redirect: (context, state) {
    if(state.uri.path == AppRoutes.SPLASH) {
      return null;
    }
    if(AppStateManager.instance.userProfile == null) {
      return AppRoutes.WELCOME;
    }
    if(kIsWeb) {
      if (state.uri.path == AppRoutes.WELCOME &&
          AppStateManager.instance.userProfile != null) {
        return GoRouterState
            .of(context)
            .uri
            .toString();
      }
    }
    return null;
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
