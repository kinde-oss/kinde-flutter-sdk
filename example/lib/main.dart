import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_starter_kit/encrypted_box.dart';
import 'package:kinde_flutter_sdk/kinde_flutter_sdk.dart';

import 'home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await KindeFlutterSDK.initializeSDK(
      authDomain: dotenv.env['KINDE_AUTH_DOMAIN']!,
      authClientId: dotenv.env['KINDE_AUTH_CLIENT_ID']!,
      loginRedirectUri: dotenv.env['KINDE_LOGIN_REDIRECT_URI']!,
      logoutRedirectUri: dotenv.env['KINDE_LOGOUT_REDIRECT_URI']!,
      scopes: ["email","profile","offline","openid"] // optional
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
      builder: (_ , child) {
        return MaterialApp(
          title: 'Flutter Kinde StarterKit',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: child,
        );
      },
      child: const HomePage(),
    );
  }
}
