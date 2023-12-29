import 'package:flutter/material.dart';
import 'package:ren/pages/auth_page.dart';
import 'package:ren/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ren/pages/splash_screen_page.dart';
import 'firebase_options.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}