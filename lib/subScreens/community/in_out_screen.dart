import 'package:flutter/material.dart';

class InOutScreen extends StatefulWidget {
  const InOutScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
      backgroundColor: Color(0xFFF2E3FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Color(0xFFCC00FF),
        title: _buildHeader(),
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
   Widget _buildHeader() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset("assets/logo.jpg", height: 60),
          ),
        ),
        // Add your logo here
        const SizedBox(width: 10),
        const Text(
          "SAFE HOOD",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Merriweather",
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
