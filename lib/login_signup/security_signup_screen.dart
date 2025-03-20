import 'package:flutter/material.dart';

class SecuritySignupScreen extends StatefulWidget {
  @override
  _SecuritySignupScreenState createState() => _SecuritySignupScreenState();
}

class _SecuritySignupScreenState extends State<SecuritySignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }

  void signUpSecurity() {
    String name = nameController.text.trim();
    String id = idController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || id.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage("All fields are required!", Colors.red);
    } else {
      _showMessage("Security personnel registered successfully!", Colors.green);
      // You can navigate to another screen or store data in Firestore
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E3FF),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Security Signup",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF6A007C)),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: idController,
                  decoration: InputDecoration(labelText: 'Security ID', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                ),
                SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder()),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6A007C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  onPressed: signUpSecurity,
                  child: Text(
                    "Signup",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Already have an account? Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
