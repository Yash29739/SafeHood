import 'package:flutter/material.dart';

class SecurityForgotPasswordScreen extends StatefulWidget {
  @override
  _SecurityForgotPasswordScreenState createState() => _SecurityForgotPasswordScreenState();
}

class _SecurityForgotPasswordScreenState extends State<SecurityForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }

  void resetPassword() {
    String email = emailController.text.trim();

    if (email.isEmpty) {
      _showMessage("Please enter your email", Colors.red);
    } else {
      _showMessage("Password reset link sent to $email!", Colors.green);
      // Implement actual password reset logic here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E3FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF6A007C),
        title: Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your email to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6A007C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: resetPassword,
                child: Text(
                  'Send Reset Link',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Back to Login',
                  style: TextStyle(color: Color.fromARGB(255, 0, 140, 255)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
