import 'package:flutter/material.dart';
import 'package:safehome/login_signup/login_screen.dart';

void main() {
  runApp(const SignupScreen());
}

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300], // Background color
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            // Fixed width for form
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.asset(
                  'assets/logo.jpg', // Change this to your actual logo path
                  width: 120,
                ),

                ),
                // Logo
                
                const SizedBox(height: 10),
                // Sign Up Text
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
                ),
                const SizedBox(height: 10),

                // Input Fields
                _buildTextField("Name"),
                _buildTextField("Email ID"),
                _buildTextField("Occupation"),
                _buildTextField("DOB (Date of Birth)"),
                _buildTextField("Age"),
                _buildTextField("Door Number"),
                _buildTextField("Total People Living"),
                _buildTextField("Flat Code"),
                _buildTextField("Flat Name"),
                _buildTextField("Phone Number"),
                _buildTextField("Emergency Phone Number"),
                _buildTextField("Emergency Contact Name"),
                _buildTextField("Description About Yourself"),
                _buildTextField("Original Place of Residence"),
                _buildTextField("Password", obscureText: true),
                _buildTextField("Confirm Password", obscureText: true),

                const SizedBox(height: 15),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
                  },
                  style: ElevatedButton.styleFrom(
                   
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Color.fromARGB(255, 130, 76, 206), fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.purple),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.purple, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
      ),
    );
  }
}