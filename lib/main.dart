import 'package:flutter/material.dart';
import 'package:oauth_webauth/oauth_webauth.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OAuthWebAuth.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kinde Flutter SDK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
