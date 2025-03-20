import 'package:flutter/material.dart';
import 'package:safehome/login_signup/admin_login.dart';

class AdminSignupScreen extends StatefulWidget {
  @override
  _AdminSignupScreenState createState() => _AdminSignupScreenState();
}

class _AdminSignupScreenState extends State<AdminSignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController aadhaarController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }

  void signUpAdmin() {
    String name = nameController.text.trim();
    String dob = dobController.text.trim();
    String aadhaar = aadhaarController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (name.isEmpty || dob.isEmpty || aadhaar.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty) {
      _showMessage("All fields are required!", Colors.red);
      return;
    }

    _showMessage("Admin Registered Successfully!", Colors.green);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => AdminLoginScreen()),
    );
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
                  "Admin Signup",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF6A007C)),
                ),
                SizedBox(height: 20),
                TextField(controller: nameController, decoration: InputDecoration(labelText: 'Full Name', border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextField(controller: dobController, decoration: InputDecoration(labelText: 'Date of Birth', border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextField(controller: aadhaarController, keyboardType: TextInputType.number, decoration: InputDecoration(labelText: 'Aadhaar Number', border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextField(controller: phoneController, keyboardType: TextInputType.phone, decoration: InputDecoration(labelText: 'Phone Number', border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder())),
                SizedBox(height: 15),
                TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder())),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6A007C),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  onPressed: signUpAdmin,
                  child: Text("Signup", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLoginScreen()));
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
