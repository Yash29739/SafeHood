import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:safehome/mainScreens/NearbyShops.dart';
import 'package:safehome/mainScreens/Profile.dart';
import 'package:safehome/mainScreens/SafeHoodDashboard.dart';
import 'package:safehome/mainScreens/admin_dashboard.dart';
import 'package:safehome/mainScreens/chat.dart';
import 'package:safehome/mainScreens/security_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String role = "User";
  int _selectedindex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  void checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString("userId");
    if (userId != null) {
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userId)
              .get();
      if (userDoc.exists) {
        setState(() {
          role = userDoc["role"];
          configurePages();
        });
      } else {
        configurePages();
      }
    }
  }

  void configurePages() {
    switch (role) {
      case "Admin":
        _pages = [
          AdminDashboard(),
          const ApartmentChatScreen(),
          const NearByShops(),
          const ProfileScreen(),
        ];
        break;
      case "Security":
        _pages = [
          SecurityDashboard(),
          const ApartmentChatScreen(),
          const NearByShops(),
          const ProfileScreen(),
        ];
        break;
      default:
        _pages = [
          SafeHoodDashboard(),
          const ApartmentChatScreen(),
          const NearByShops(),
          const ProfileScreen(),
        ];
    }
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        backgroundColor: Color(0xFFCC00FF),
        title: _buildHeader(),
      ),
      backgroundColor: Color(0xFFF2E3FF),
      body:
          _pages.isNotEmpty
              ? SizedBox(
                height: MediaQuery.of(context).size.height - 160,
                child: _pages[_selectedindex],
              )
              : const Center(child: CircularProgressIndicator()),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset("assets/logo.jpg", height: 60),
          ),
        ),
        // Add your logo here
        const SizedBox(width: 10),
        const Text(
          "SAFE HOOD",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Merriweather",
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.purple[700],
      unselectedItemColor: Colors.black,
      currentIndex: _selectedindex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, size: 30),
          label: "Chat",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart, size: 30),
          label: "Shop",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 30),
          label: "Profile",
        ),
      ],
    );
  }
}
