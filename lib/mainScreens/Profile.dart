import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safehome/login_signup/login_screen.dart';
import 'package:safehome/services/firestore_service.dart';
import 'package:safehome/services/localServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isIn = true;
  List<Map<String, String>> emergencyContacts = [];

  final Map<String, TextEditingController> controllers = {
    "Name": TextEditingController(text: "John Doe"),
    "Email ID": TextEditingController(text: "john.doe@example.com"),
    "Occupation": TextEditingController(text: "Software Engineer"),
    "Date of Birth": TextEditingController(text: "1995-06-15"),
    "Age": TextEditingController(text: "28"),
    "Door Number": TextEditingController(text: "A-101"),
    "Total People Living": TextEditingController(text: "4"),
    "Flat Code": TextEditingController(text: "SH101"),
    "Flat Name": TextEditingController(text: "Safe Haven"),
    "Phone Number": TextEditingController(text: "9876543210"),
    "About Yourself": TextEditingController(
      text: "Friendly and helpful neighbor.",
    ),
    "Original Place of Residence": TextEditingController(text: "Bangalore"),
  };

  void _logout(BuildContext context) async {
    // Add logout logic here
    AuthController logoutController = AuthController();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString('userId');
    logoutController.updateUserLoginStatus(userId, false);
    logoutUser();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Logout successful!"),
        backgroundColor: Colors.green,
      ),
    );

    await FirebaseFirestore.instance.collection('userLogs').doc(userId).set({
      'email': userId,
      'action': "Logout",
      'timestamp': FieldValue.serverTimestamp(),
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void _toggleInOut() {
    setState(() {
      isIn = !isIn;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(isIn ? "Marked as In" : "Marked as Out")),
    );
  }

  void _editProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(controllers: controllers),
      ),
    ).then((_) => setState(() {}));
  }

  void _manageEmergencyContacts() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => EditEmergencyContactsScreen(
              emergencyContacts: emergencyContacts,
            ),
      ),
    ).then((updatedContacts) {
      if (updatedContacts != null) {
        setState(() {
          emergencyContacts = updatedContacts;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 350,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.purple,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    controllers["Name"]!.text,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  Text(
                    "Door No: ${controllers["Door Number"]!.text}",
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: _editProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {_logout(context)},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              width: 350,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Column(
                children: [
                  const Text(
                    "⚠️ Your In/Out status helps neighbors know if you're available.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _toggleInOut,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isIn ? Colors.green : Colors.red,
                    ),
                    child: Text(
                      isIn ? "Mark as Out" : "Mark as In",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    "⚠️ Ensure your emergency contacts are up-to-date.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: _manageEmergencyContacts,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      "Manage Emergency Contacts",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Edit Profile Screen
class EditProfileScreen extends StatefulWidget {
  final Map<String, TextEditingController> controllers;

  const EditProfileScreen({super.key, required this.controllers});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            for (var entry in widget.controllers.entries)
              _buildProfileField(entry.key, entry.value),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text(
                "Save Changes",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.purple[50],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}

// Edit Emergency Contacts Screen
class EditEmergencyContactsScreen extends StatefulWidget {
  final List<Map<String, String>> emergencyContacts;

  const EditEmergencyContactsScreen({
    super.key,
    required this.emergencyContacts,
  });

  @override
  _EditEmergencyContactsScreenState createState() =>
      _EditEmergencyContactsScreenState();
}

// ignore: unused_element

class _EditEmergencyContactsScreenState
    extends State<EditEmergencyContactsScreen> {
  late List<Map<String, String>> contacts;

  @override
  void initState() {
    super.initState();
    contacts = List<Map<String, String>>.from(widget.emergencyContacts);
  }

  void _addContact() {
    setState(() {
      contacts.add({"Name": "", "Phone": ""});
    });
  }

  void _updateContact(int index, String key, String value) {
    setState(() {
      contacts[index][key] = value;
    });
  }

  void _removeContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void _saveContacts() {
    Navigator.pop(context, contacts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Emergency Contacts"),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _saveContacts, // Save and return
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              labelText: "Name",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.purple,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            onChanged:
                                (value) => _updateContact(index, "Name", value),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            decoration: const InputDecoration(
                              labelText: "Phone Number",
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.purple,
                              ),
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.phone,
                            onChanged:
                                (value) =>
                                    _updateContact(index, "Phone", value),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _removeContact(index),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              onPressed: _addContact,
              backgroundColor: Colors.purple,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
