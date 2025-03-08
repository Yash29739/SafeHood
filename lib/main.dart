import 'package:flutter/material.dart';
import 'package:safehome/login_signup/login_screen.dart';

void main() {
  runApp(const MyApp());
}
      
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safe Hood',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const LoginScreen(),
    );
  }
}
