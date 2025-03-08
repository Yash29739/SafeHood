import 'package:flutter/material.dart';

class NearByShops extends StatefulWidget {
  const NearByShops({super.key});

  @override
  State<NearByShops> createState() => _NearByShopsState();
}

class _NearByShopsState extends State<NearByShops> {
  // Function to handle FAB click
  void _onFabPressed() {
    // You can add navigation or a dialog here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("FAB Clicked! Add your action here")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          "This is the Nearby Shops Screen",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed, // Corrected function call
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
