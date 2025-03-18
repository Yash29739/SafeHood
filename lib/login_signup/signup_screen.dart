import 'package:bcrypt/bcrypt.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safehome/login_signup/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController doorNumberController = TextEditingController();
  final TextEditingController peopleCountController = TextEditingController();
  final TextEditingController flatCodeController = TextEditingController();
  final TextEditingController flatNameController = TextEditingController();
  final TextEditingController phNumberController = TextEditingController();
  final TextEditingController emergencyNumberController =
      TextEditingController();
  final TextEditingController emergencyContactNameController =
      TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController residenceController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  void handleSignUp() async {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String occupation = occupationController.text.trim();
    String dob = dobController.text.trim();
    String age = ageController.text.trim();
    String doorNumber = doorNumberController.text.trim();
    String peopleCount = peopleCountController.text.trim();
    String flatCode = flatCodeController.text.trim();
    String flatName = flatNameController.text.trim();
    String phone = phNumberController.text.trim();
    String emergencyPhone = emergencyNumberController.text.trim();
    String emergencyContact = emergencyContactNameController.text.trim();
    String desc = descriptionController.text.trim();
    String origin = residenceController.text.trim();
    String password = passwordController.text.trim();

    try {
      String hashedPass = BCrypt.hashpw(password, BCrypt.gensalt());

      await FirebaseFirestore.instance.collection("users").doc(email).set({
        "name": name,
        "email": email,
        "occupation": occupation,
        "dob": dob,
        "age": age,
        "doorNumber": doorNumber,
        "peopleCount": peopleCount,
        "flatCode": flatCode,
        "flatName": flatName,
        "phone": phone,
        "emergencyPhone": emergencyPhone,
        "emergencyContact": emergencyContact,
        "description": desc,
        "origin": origin,
        "password": hashedPass,
        'timestamp': FieldValue.serverTimestamp(),
      });
      _showSuccess("Account created successfully");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } catch (e) {
      _showError("$e");
    }
  }

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
                _buildTextField("Name", nameController),
                SizedBox(height: 10),
                _buildTextField("Email ID", emailController),
                SizedBox(height: 10),
                _buildTextField("Occupation", occupationController),
                SizedBox(height: 10),
                _buildTextField("DOB (Date of Birth)", dobController),
                SizedBox(height: 10),
                //MAKE SURE AGE IS IN NUMBERS
                _buildTextField(
                  "Age",
                  ageController,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                _buildTextField("Door Number", doorNumberController),
                SizedBox(height: 10),
                _buildTextField("Total People Living", peopleCountController),
                SizedBox(height: 10),
                _buildTextField("Flat Code", flatCodeController),
                SizedBox(height: 10),
                _buildTextField("Flat Name", flatNameController),
                SizedBox(height: 10),
                //modified ph number inputting
                _buildTextField(
                  "Phone Number",
                  phNumberController,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  "Emergency Phone Number",
                  emergencyNumberController,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  "Emergency Contact Name",
                  emergencyContactNameController,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  "Description About Yourself",
                  descriptionController,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  "Original Place of Residence",
                  residenceController,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  "Password",
                  passwordController,
                  obscureText: true,
                ),
                SizedBox(height: 10),
                _buildTextField(
                  "Confirm Password",
                  confirmPasswordController,
                  obscureText: true,
                ),
                SizedBox(height: 15),

                // Submit Button
                ElevatedButton(
                  onPressed: handleSignUp,
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
                            builder: (context) => LoginScreen(),
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

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
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
