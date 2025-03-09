import 'package:flutter/material.dart';

class SOSPage extends StatefulWidget {
  const SOSPage({super.key});

  @override
  State<SOSPage> createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  // Function to send the SOS message
  void _sendSOSMessage() {
    // Simulate sending message to Watchman and Group Chat
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("SOS Alert sent to Watchman & Group Chat! 🚨")),
    );
  }

  // Function to show confirmation dialog before sending SOS
  void _confirmSOS() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm SOS"),
        content: const Text("Are you sure you want to send an SOS alert?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _sendSOSMessage();
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text("Send SOS", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Emergency SOS"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Press the SOS button in case of an emergency.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // SOS Button
            ElevatedButton(
              onPressed: _confirmSOS,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("SEND SOS 🚨", style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            const SizedBox(height: 30),

            // Message indicating where SOS is sent
            const Text(
              "Your SOS alert will be sent to:\n- Watchman\n- Apartment Group Chat",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
