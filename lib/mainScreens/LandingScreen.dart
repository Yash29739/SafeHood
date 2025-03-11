import 'package:flutter/material.dart';
import 'package:safehood/mainScreens/NearbyShops.dart';
import 'package:safehood/mainScreens/Profile.dart';
import 'package:safehood/mainScreens/SafeHoodDashboard.dart';
import 'package:safehood/mainScreens/chat.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  int _selectedindex = 0;

  final List<Widget> _pages = [
    const SafeHoodDashboard(),
    const ApartmentChatScreen(),
    const NearByShops(),
    const ApartmentProfileScreen(),
  ];

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
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 160,
        child: _pages[_selectedindex],
      ),
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
