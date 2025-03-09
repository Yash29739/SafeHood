import 'package:flutter/material.dart';

class ApartmentProfileScreen extends StatefulWidget {
  final String name;
  final String apartmentNumber;
  final String contactNumber;

  const ApartmentProfileScreen({
    super.key,
    required this.name,
    required this.apartmentNumber,
    required this.contactNumber,
  });

  @override
  State<ApartmentProfileScreen> createState() => _ApartmentProfileScreenState();
}

class _ApartmentProfileScreenState extends State<ApartmentProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _apartmentController;
  late TextEditingController _contactController;

  bool isEditing = false; // Track edit mode

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _apartmentController = TextEditingController(text: widget.apartmentNumber);
    _contactController = TextEditingController(text: widget.contactNumber);
  }

  // Function to save updated details
  void _saveProfile() {
    setState(() {
      isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated successfully!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resident Profile"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(isEditing ? Icons.check : Icons.edit),
            onPressed: () {
              setState(() {
                if (isEditing) {
                  _saveProfile();
                }
                isEditing = !isEditing;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/profile_pic.png"), // Change to network if needed
                backgroundColor: Colors.grey[300],
              ),
            ),
            const SizedBox(height: 15),

            // Editable Fields
            _buildProfileField("Full Name", _nameController),
            _buildProfileField("Apartment Number", _apartmentController),
            _buildProfileField("Contact Number", _contactController),

            const SizedBox(height: 20),

            // Logout Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Logging out...")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build profile fields (Editable when in edit mode)
  Widget _buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            enabled: isEditing, // Editable only when in edit mode
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
