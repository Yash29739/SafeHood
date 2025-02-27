import 'package:flutter/material.dart';
import 'package:safehome/screens/chat.dart';
import 'package:safehome/screens/home.dart';
import 'package:safehome/screens/neabyShops.dart';
import 'package:safehome/screens/profile.dart';

class LandingScreeen extends StatefulWidget {
  const LandingScreeen({super.key});

  @override
  State<LandingScreeen> createState() => _LandingScreeenState();
}

class _LandingScreeenState extends State<LandingScreeen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ChatRoom(),
    const NearbyShops(),
    const ProfileScreen(),
  ];

  void _selectedScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color.fromARGB(255, 217, 0, 255),

        // centerTitle: true,
        title: SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("assets/logo.jpg", height: 80),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "SafeHood",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Merriweather",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      body: SizedBox(
        height: MediaQuery.of(context).size.height - 160,
        child: _pages[_currentIndex],
      ),

      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.purple[800],
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.purpleAccent[400],
                  child: Icon(Icons.home, size: 25, color: Colors.white),
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.purple[800],
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purpleAccent[400],
                child: Icon(Icons.chat, size: 25, color: Colors.white),
              ),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.purple[800],
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purpleAccent[400],
                child: Icon(Icons.shop_sharp, size: 25, color: Colors.white),
              ),
              label: 'Shops',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.purple[800],
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.purpleAccent[400],
                child: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          onTap: _selectedScreen,
        ),
      ),
    );
  }
}
