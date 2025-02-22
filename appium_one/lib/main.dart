import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:flutter_driver/driver_extension.dart';



void main() {

  enableFlutterDriverExtension();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );

  }
}
