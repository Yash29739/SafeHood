import 'package:flutter/material.dart';
import 'package:safehood/login_signup/login_screen.dart';

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
      backgroundColor: Color(0xFFF2E3FF), // Background color
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            // Fixed width for form
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/logo.jpg', // Change this to your actual logo path
                    width: 120,
                  ),
                ),

                // Logo
                const SizedBox(height: 10),
                // Sign Up Text
                const Text(
                  "User Registration",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Merriweather",
                    color: Color(0xFF6A007C),
                  ),
                ),
                const SizedBox(height: 10),

                // Input Fields
                _buildTextField("Name"),
                SizedBox(height: 10),
                _buildTextField("Email ID"),
                SizedBox(height: 10),
                _buildTextField("Occupation"),
                SizedBox(height: 10),
                _buildTextField("DOB (Date of Birth)"),
                SizedBox(height: 10),
                _buildTextField("Age"),
                SizedBox(height: 10),
                _buildTextField("Door Number"),
                SizedBox(height: 10),
                _buildTextField("Total People Living"),
                SizedBox(height: 10),
                _buildTextField("Flat Code"),
                SizedBox(height: 10),
                _buildTextField("Flat Name"),
                SizedBox(height: 10),
                _buildTextField("Phone Number"),
                SizedBox(height: 10),
                _buildTextField("Emergency Phone Number"),
                SizedBox(height: 10),
                _buildTextField("Emergency Contact Name"),
                SizedBox(height: 10),
                _buildTextField("Description About Yourself"),
                SizedBox(height: 10),
                _buildTextField("Original Place of Residence"),
                SizedBox(height: 10),
                _buildTextField("Password", obscureText: true),
                SizedBox(height: 10),
                _buildTextField("Confirm Password", obscureText: true),
                SizedBox(height: 15),

                // Submit Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6A007C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a User?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Log-In',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 140, 255),
                        ),
                      ),
                    ),
                  ],
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
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF6A007C)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.purple, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
        ),
      ),
    );
  }
}
