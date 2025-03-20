import 'package:flutter/material.dart';
import 'package:safehome/login_signup/login_screen.dart';
import 'package:safehome/login_signup/admin_login.dart';
import 'package:safehome/login_signup/security_login.dart';

class RoleSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E3FF),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select Your Role",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6A007C),
                ),
              ),
              SizedBox(height: 30),
              RoleButton(
                role: "User",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                ),
              ),
              SizedBox(height: 15),
              RoleButton(
                role: "Admin",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminLoginScreen()),
                ),
              ),
              SizedBox(height: 15),
              RoleButton(
                role: "Security",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecurityLoginScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleButton extends StatelessWidget {
  final String role;
  final VoidCallback onTap;

  RoleButton({required this.role, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF6A007C),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
      onPressed: onTap,
      child: Text(
        role,
        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
