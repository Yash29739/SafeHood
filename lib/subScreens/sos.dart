import 'package:flutter/material.dart';

class SOSScreen extends StatefulWidget {
  final Function(String) sendMessageToChat; // Function to send messages to chat

  const SOSScreen({super.key, required this.sendMessageToChat});

  @override
  State<SOSScreen> createState() => _SOSScreenState();
}

class _SOSScreenState extends State<SOSScreen> {
  // Function to send SOS message
  void _sendSOS() {
    String sosMessage = "🚨 Emergency Alert! A resident needs immediate help!";

    // Send the message to the apartment chat screen
    widget.sendMessageToChat(sosMessage);

    // Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("🚨 SOS Sent! Apartment Group Notified."),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency SOS"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Press the button in case of emergency!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            FloatingActionButton.extended(
              onPressed: _sendSOS,
              backgroundColor: Colors.red,
              icon: const Icon(Icons.sos, color: Colors.white, size: 30),
              label: const Text(
                "Send SOS",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
