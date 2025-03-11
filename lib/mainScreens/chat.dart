import 'package:flutter/material.dart';
import 'package:safehome/subScreens/sos.dart';
// Import the SOS Screen

class ApartmentChatScreen extends StatefulWidget {
  const ApartmentChatScreen({super.key});

  @override
  State<ApartmentChatScreen> createState() => _ApartmentChatScreenState();
}

class _ApartmentChatScreenState extends State<ApartmentChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  List<Map<String, String>> messages = [];

  // Function to send a new message
  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        messages.add({
          "user": "You",
          "message": text,
          "time": "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}",
        });
      });
      _messageController.clear();
    }
  }

  // Function to receive SOS messages from SOS screen
  void _receiveSOSMessage(String sosMessage) {
    setState(() {
      messages.add({
        "user": "🚨 SOS Alert",
        "message": sosMessage,
        "time": "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}",
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Apartment Group Chat",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: messages[index]["user"] == "You"
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: messages[index]["user"] == "You"
                          ? Colors.purple[100]
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          messages[index]["user"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: messages[index]["user"] == "You"
                                ? Colors.purple
                                : Colors.red,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(messages[index]["message"]!),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            messages[index]["time"]!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Colors.purple),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Attach file feature coming soon!"),
                      ),
                    );
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () => _sendMessage(_messageController.text),
                  backgroundColor: Colors.purple,
                  child: const Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SOSScreen(sendMessageToChat: _receiveSOSMessage),
            ),
          );
        },
        backgroundColor: Colors.red,
        icon: const Icon(Icons.sos, color: Colors.white, size: 30),
        label: const Text("SOS", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
