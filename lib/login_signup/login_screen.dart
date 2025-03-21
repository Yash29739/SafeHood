import 'dart:developer' as developer;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safehome/login_signup/forgotPassword.dart';
import 'package:safehome/mainScreens/LandingScreen.dart';
import 'package:safehome/mainScreens/admin_dashboard.dart';
import 'package:safehome/mainScreens/security_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup_screen.dart';
import '../services/firestore_service.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void _showError(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccess(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  void logInUser(BuildContext context) async {
    String? email = emailController.text;
    String? password = passwordController.text;

    AuthController loginAuth = AuthController();

    try {
      String? result = await loginAuth.loginUser(
        email: email,
        password: password,
      );

      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // String? userId = prefs.getString("userId");
      // DocumentSnapshot userDoc =
      //     await FirebaseFirestore.instance
      //         .collection('users')
      //         .doc(userId)
      //         .get();
      // String role = userDoc["role"] ?? "User";

      // switch (role) {
      //   case "Admin":
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => AdminDashboard()),
      //     );
      //     break;
      //   case "Security":
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => SecurityDashboard()),
      //     );
      //     break;
      //   case "User":
      //   default:
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => LandingScreen()),
      //     );
      //     break;
      // }

      if (result == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LandingScreen()),
        );
        _showSuccess("Logged in Successfully!", context);
      } else {
        _showError(result, context);
      }
    } catch (e) {
      developer.log("Error during login: $e");
      _showError(e.toString(), context);
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset('assets/logo.jpg', width: 120),
                ),
                const SizedBox(height: 20),
                Text(
                  "User Login",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF6A007C),
                    fontWeight: FontWeight.bold,
                    fontFamily: "Merriweather",
                  ),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          ),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 140, 255),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
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
                  onPressed: () => logInUser(context),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not Registered?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Create an Account',
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
}
