import 'package:flutter/material.dart';
import 'package:safehome/login_signup/login_screen.dart';
import 'package:safehome/services/firestore_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignupScreen> {
  final FirestoreService _firestoreService = FirestoreService();
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
    
    
    //make sure age is in numbers
    if (ageController.text.trim().isEmpty) 
    {
      _showError("Enter a valid age");
      return;
    }

    int? age = int.tryParse(ageController.text.trim());
    if (age == null || age <= 0)
    {
      _showError("Age is invalid");
      return;
    }

    //phone number mandatorily 10 digits

    if (phNumberController.text.trim().isEmpty || phNumberController.text.trim().length != 10 || int.tryParse(phNumberController.text.trim()) == null)
    {
      _showError("Enter a valid 10-digit phone number");
      return;
    }


    // making sure it ends with @gmail.com

    if (!emailController.text.trim().toLowerCase().endsWith("@gmail.com")) 
    {
      _showError("Enter a valid email");
      return;
    }
    //--------------------------------------------------------

    // make sure passowrd matches

    if (passwordController.text != confirmPasswordController.text) {
      _showError("Passwords do not match");
      return;
    }

    bool success = await _firestoreService.signUp(
      nameController.text,
      emailController.text,
      occupationController.text,
      dobController.text,
      ageController.text,
      doorNumberController.text,
      peopleCountController.text,
      flatCodeController.text,
      flatNameController.text,
      phNumberController.text,
      emergencyNumberController.text,
      emergencyContactNameController.text,
      descriptionController.text,
      residenceController.text,
      passwordController.text,
      
    );

    if (success) {
      _showSuccess("SignUp Successfull");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      _showError("Signup failed");
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
                _buildTextField("Age", ageController,keyboardType: TextInputType.number),
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
                _buildTextField("Phone Number", phNumberController,keyboardType: TextInputType.phone),
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
