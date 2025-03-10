import 'package:flutter/material.dart';

class demoScreen extends StatefulWidget {
  const demoScreen({super.key});

  @override
  State<demoScreen> createState() => _demoScreenState();
}

class _demoScreenState extends State<demoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("DEMO"));
  }
}
