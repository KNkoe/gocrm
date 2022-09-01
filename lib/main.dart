import 'package:flutter/material.dart';
import 'resources/theme.dart';
import 'screens/home/home.dart';
import 'screens/landing/landing.dart';
import 'screens/login.dart';
import 'screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoCRM',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const Signup(),
        '/dashboard': (context) => const MyHomePage()
      },
    );
  }
}
