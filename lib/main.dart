import 'package:flutter/material.dart';
import 'package:quiz1/homepage.dart';
import 'package:quiz1/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Praktikum Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        // '/home': (context) => HomePage(),
      },
      // home: HomePage(),
    );
  }
}
