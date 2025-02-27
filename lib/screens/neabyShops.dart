import 'package:flutter/material.dart';

class NearbyShops extends StatefulWidget {
  const NearbyShops({super.key});

  @override
  State<NearbyShops> createState() => _NearbyShopsState();
}

class _NearbyShopsState extends State<NearbyShops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [Text("This is Shops Screen")]));
  }
}
