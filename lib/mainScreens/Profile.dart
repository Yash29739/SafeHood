import 'package:flutter/material.dart';

class ApartmentProfileScreen extends StatefulWidget {
  const ApartmentProfileScreen({super.key});

  @override
  _ApartmentProfileScreenState createState() => _ApartmentProfileScreenState();
}

class _ApartmentProfileScreenState extends State<ApartmentProfileScreen> {
  bool isEditing = false;

  // Mock data
  Map<String, String> profileData = {
    "name": "John Doe",
    "email": "johndoe@example.com",
    "occupation": "Software Developer",
    "dob": "1996-05-12",
    "age": "28",
    "door_number": "12A",
    "total_people": "3",
    "flat_code": "B-102",
    "flat_name": "Sunrise Residency",
    "phone_number": "9876543210",
    "emergency_phone": "9123456789",
    "emergency_name": "Jane Doe",
    "bio": "A passionate developer!",
    "original_place": "California",
    "password": "********",
  };

  // Controllers to edit fields
  final Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    profileData.forEach((key, value) {
      controllers[key] = TextEditingController(text: value);
    });
  }

  @override
  void dispose() {
    controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Profile"),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
            icon: Icon(isEditing ? Icons.check : Icons.edit),
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF8F7FC),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile header
            Center(
              child: Column(
                children: [
                  Text(
                    profileData['name'] ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    profileData['email'] ?? 'No Email',
                    style: const TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Profile Details",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 12),

            // Profile details
            ...profileData.keys.map((key) {
              return _buildProfileField(key, profileData[key]!);
            }).toList(),

            const SizedBox(height: 30),
            // Logout button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print("Log Out tapped");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  "Log Out",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              "${_formatTitle(title)}: ",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: isEditing
                ? TextField(
                    controller: controllers[title],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                  )
                : Text(
                    value,
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                  ),
          ),
        ],
      ),
    );
  }

  String _formatTitle(String key) {
    // Convert snake_case keys to readable titles
    return key.replaceAll("_", " ").split(" ").map((word) => word[0].toUpperCase() + word.substring(1)).join(" ");
  }
}
