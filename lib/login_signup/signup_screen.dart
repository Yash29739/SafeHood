import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phNumberController = TextEditingController();
  final TextEditingController emergencyPhNumberController = TextEditingController();
  final TextEditingController emergencyNameController = TextEditingController();
  final TextEditingController doorNumberController = TextEditingController();
  final TextEditingController flatCodeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Optional fields
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController numberOfPeopleController = TextEditingController();
  final TextEditingController flatNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController originalPlaceController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // This will open the date picker and set the DOB
  Future<void> _selectDate(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(1900);
    DateTime lastDate = DateTime.now();

    // Show the date picker
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    // If a date is picked, update the TextField with the selected date and calculate the age
    if (picked != null && picked != initialDate) {
      setState(() {
        dobController.text = "${picked.toLocal()}".split(' ')[0]; // Format to yyyy-mm-dd
        _calculateAge(picked); // Calculate the age whenever the DOB is updated
      });
    }
  }

  // Calculate age based on the selected DOB
  void _calculateAge(DateTime dob) {
    DateTime today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month || (today.month == dob.month && today.day < dob.day)) {
      age--; // If birthday hasn't occurred yet this year, subtract one year from the age
    }
    ageController.text = age.toString(); // Set the calculated age
  }

  void handleSignUp() {
    if (!_formKey.currentState!.validate()) {
      return; // If form is invalid, return
    }

    // Handle signup logic here (e.g., send data to the backend or save to database)
    print("Name: ${nameController.text}");
    print("Email: ${emailController.text}");
    print("DOB: ${dobController.text}");
    print("Age: ${ageController.text}");
    print("Phone Number: ${phNumberController.text}");
    print("Emergency Name: ${emergencyNameController.text}");
    print("Emergency Phone Number: ${emergencyPhNumberController.text}");
    print("Door Number: ${doorNumberController.text}");
    print("Flat Code: ${flatCodeController.text}");
    print("Password: ${passwordController.text}");
    print("Confirm Password: ${confirmPasswordController.text}");
    print("Occupation: ${occupationController.text}");
    print("Number of People Living: ${numberOfPeopleController.text}");
    print("Flat Name: ${flatNameController.text}");
    print("Description: ${descriptionController.text}");
    print("Original Place: ${originalPlaceController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100, // Lighter purple background
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple.shade300, Colors.purple.shade100], // Lighter gradient
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/logo.jpg', // Change this to your actual logo path
                      width: 120,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "User Registration",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      color: Color.fromARGB(255, 119, 15, 123), // Matching color for the title text
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Input Fields
                  _buildTextField("Name*", nameController, (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  }),
                  SizedBox(height: 10),
                  _buildTextField("Email ID *", emailController, (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                        .hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  }, hintText: "abc@gmail.com"),
                  SizedBox(height: 10),
                  _buildDateOfBirthField(),
                  SizedBox(height: 10),
                  _buildTextField("Age*", ageController, null, readOnly: true),
                  SizedBox(height: 10),
                  _buildTextField("Phone Number* (10 digits)", phNumberController, (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone Number is required";
                    }
                    if (value.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Phone number must be exactly 10 digits";
                    }
                    return null;
                  }),
                  SizedBox(height: 10),
                  _buildTextField("Emergency Name", emergencyNameController, null),
                  SizedBox(height: 10),
                  _buildTextField("Emergency Phone Number", emergencyPhNumberController, (value) {
                    if (value == phNumberController.text) {
                      return "Emergency phone number cannot be the same as phone number";
                    }
                    return null;
                  }),
                  SizedBox(height: 10),
                  _buildTextField("Door Number", doorNumberController, null),
                  SizedBox(height: 10),
                  _buildTextField("Flat Code", flatCodeController, null),
                  SizedBox(height: 10),
                  _buildTextField("Password*", passwordController, (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  }, obscureText: true),
                  SizedBox(height: 10),
                  _buildTextField("Confirm Password*", confirmPasswordController, (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm Password is required";
                    }
                    if (value != passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  }, obscureText: true),
                  SizedBox(height: 10),

                  // Optional Fields
                  _buildTextField("Occupation (Optional)", occupationController, null),
                  SizedBox(height: 10),
                  _buildTextField("Number of People Living (Optional)", numberOfPeopleController, null),
                  SizedBox(height: 10),
                  _buildTextField("Flat Name (Optional)", flatNameController, null),
                  SizedBox(height: 10),
                  _buildTextField("Description About Yourself (Optional)", descriptionController, null),
                  SizedBox(height: 10),
                  _buildTextField("Original Place of Residence (Optional)", originalPlaceController, null),
                  SizedBox(height: 20),

                  // Submit Button
                  ElevatedButton(
                    onPressed: handleSignUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 119, 15, 123), // Pink color for button
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
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateOfBirthField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: dobController,
              decoration: InputDecoration(
                labelText: "DOB (Date of Birth)*",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.purple, width: 2), // Increased border width
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 119, 15, 123), width: 2), // Increased border width for focus
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Date of Birth is required";
                }
                return null;
              },
              readOnly: true, // Make the field read-only, as the user will pick the date
            ),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Color.fromARGB(255, 119, 15, 123)),
            onPressed: () {
              _selectDate(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    String? Function(String?)? validator, {
    bool obscureText = false,
    String? hintText,
    bool readOnly = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.purple, width: 2), // Increased border width
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color.fromARGB(255, 119, 15, 123), width: 2), // Increased border width for focus
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
