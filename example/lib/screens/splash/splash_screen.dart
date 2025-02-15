import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kinde_flutter_sdk/kinde_api.dart';

import '../../state/app_state_manager.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Future<UserProfileV2?> future;

  @override
  void initState() {
    super.initState();
    print("intiState");
    future = AppStateManager.instance.checkIsUserLogged();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: FutureBuilder(
          future: future,
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.done) {
              final user = asyncSnapshot.data;
              final route = user == null ? AppRoutes.WELCOME : AppRoutes.HOME;
              SchedulerBinding.instance.addPostFrameCallback((_) {
                context.pushReplacement(route);
              });
            }
            return Center(
              child: Text(
                "K",
                style: TextStyle(fontSize: 48.h, color: Colors.black),
                textAlign: TextAlign.center,
              ),
            );
          }),
    );
  }
}
