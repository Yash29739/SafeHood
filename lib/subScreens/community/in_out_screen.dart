import 'package:flutter/material.dart';

class InOutScreen extends StatefulWidget {
  const InOutScreen({super.key});

  @override
  _InOutScreenState createState() => _InOutScreenState();
}

class _InOutScreenState extends State<InOutScreen> {
  // Sample data for users' statuses
  final Map<String, bool> userStatus = {
    "John Doe": true, // true means IN, false means OUT
    "Jane Smith": false,
    "Michael Johnson": true,
    "Alice Brown": false,
    "Bob White": true,
  };

  // Toggle IN/OUT status of the user
  void toggleStatus(String user) {
    setState(() {
      userStatus[user] = !userStatus[user]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IN/OUT Status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: userStatus.keys.length,
          itemBuilder: (context, index) {
            final user = userStatus.keys.elementAt(index);
            final isIn = userStatus[user]!;

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  // Placeholder or user profile image can go here
                  backgroundColor: Colors.purple,
                  child: Text(
                    user[0], // Display first letter of the user's name
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(user),
                subtitle: Text(isIn ? 'Status: IN' : 'Status: OUT'),
                trailing: IconButton(
                  icon: Icon(
                    isIn ? Icons.exit_to_app : Icons.check_circle,
                    color: isIn ? Colors.green : Colors.red,
                  ),
                  onPressed: () {
                    toggleStatus(user);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
