import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safehome/login_signup/login_screen.dart';
import 'package:safehome/services/firestore_service.dart';
import 'package:safehome/services/localServices.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Dashboard"),
        backgroundColor: Color(0xFF6A007C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome, Admin!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A007C),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  DashboardCard(
                    title: "Manage Users",
                    icon: Icons.people,
                    onTap: () {},
                  ),
                  DashboardCard(
                    title: "Security Logs",
                    icon: Icons.security,
                    onTap: () {},
                  ),
                  DashboardCard(
                    title: "System Settings",
                    icon: Icons.settings,
                    onTap: () {},
                  ),
                  DashboardCard(
                    title: "Reports",
                    icon: Icons.bar_chart,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  DashboardCard({required this.title, required this.icon, required this.onTap});
  void _logout(BuildContext context) async {
    // Add logout logic here
    AuthController logoutController = AuthController();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userId = prefs.getString('userId');
    logoutController.updateUserLoginStatus(userId, false);
    logoutUser();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Logout successful!"),
        backgroundColor: Colors.green,
      ),
    );

    await FirebaseFirestore.instance.collection('userLogs').doc(userId).set({
      'email': userId,
      'action': "Logout",
      'timestamp': FieldValue.serverTimestamp(),
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color(0xFFF2E3FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Color(0xFF6A007C)),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6A007C),
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () => {_logout(context)},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: Text("Logout", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
