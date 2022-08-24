import 'package:flutter/material.dart';
import 'package:gocrm/screens/dashboard.dart';
import 'package:gocrm/screens/home/homepage.dart';
import 'package:gocrm/screens/login.dart';
import 'package:gocrm/screens/signup.dart';
import 'package:gocrm/resources/theme.dart';

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
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const Signup(),
        '/dashboard': (context) => const DashBoard()
      },
    );
  }
}
