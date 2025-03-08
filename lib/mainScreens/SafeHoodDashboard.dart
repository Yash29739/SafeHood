import 'package:flutter/material.dart';
import 'package:safehome/subScreens/services/CommunityNoticeBoard.dart';
import 'package:safehome/subScreens/services/CommunityRulesApp.dart';
import 'package:safehome/subScreens/services/MaintenanceRequestsScreen.dart';
import 'package:safehome/subScreens/services/StaffDirectoryPage.dart';
import 'package:safehome/subScreens/services/complaint_screen.dart';
import 'package:safehome/login_signup/login_screen.dart';
import 'package:safehome/subScreens/community/neighbor_profile_screen.dart';

// ignore: camel_case_types
class SafeHoodDashboard extends StatefulWidget {
  const SafeHoodDashboard({super.key});

  @override
  State<SafeHoodDashboard> createState() => _SafeHoodDashboardState();
}

class _SafeHoodDashboardState extends State<SafeHoodDashboard> {
  // int _selectedIndex = 0;

  // final List<Widget> _pages = [
  //   const mainHomePage(),
  //   const LeaveApplicationPage(),
  //   const ProfilePage(),
  //   settingScreen(),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Color(0xFFCC00FF),
        title: _buildHeader(),
      ),
      backgroundColor: Color(0xFFF2E3FF),
      // body: SizedBox(
      //   height: MediaQuery.of(context).size.height - 160,
      //   child: _pages[_selectedIndex],
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      _buildSOSButton(),
                      const SizedBox(height: 20),
                      _buildSectionTitle("SERVICE"),
                      const SizedBox(height: 10),
                      _buildGrid([
                        _gridItem(
                          "File a Complaint",
                          Icons.report_problem,
                          ComplaintScreen(),
                          context,
                        ),
                        _gridItem(
                          "Maintenance",
                          Icons.build,
                          MaintenanceRequestsScreen(),
                          context,
                        ),
                        _gridItem(
                          "Community Notice Board",
                          Icons.dashboard,
                          CommunityNoticeBoard(),
                          context,
                        ),
                        _gridItem(
                          "Staffs",
                          Icons.people,
                          StaffDirectoryPage(),
                          context,
                        ),
                        _gridItem(
                          "Community Rules",
                          Icons.article,
                          CommunityRulesApp(),
                          context,
                        ),
                      ]),
                      const SizedBox(height: 30),
                      _buildSectionTitle("COMMUNITY"),
                      const SizedBox(height: 10),
                      _buildGrid([
                        _gridItem(
                          "Do-To-List",
                          Icons.checklist,
                          LoginScreen(),
                          context,
                        ),
                        _gridItem(
                          "IN/OUT",
                          Icons.sync_alt,
                          LoginScreen(),
                          context,
                        ),
                        _gridItem(
                          "Friends",
                          Icons.people_alt,
                          LoginScreen(),
                          context,
                        ),
                        _gridItem(
                          "Neighbors Screen",
                          Icons.home,
                          NeighborProfileScreen(),
                          context,
                        ),
                        _gridItem(
                          "Community Events",
                          Icons.event,
                          CommunityNoticeBoard(),
                          context,
                        ),
                      ]),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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

  Widget _buildSOSButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        ),
        child: Column(
          children: const [
            Icon(Icons.sos, size: 40, color: Colors.black),
            Text(
              "Emergency !",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: "Merriweather",
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildGrid(List<Widget> items) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 1,
      physics: const NeverScrollableScrollPhysics(),
      children: items,
    );
  }

  Widget _gridItem(
    String title,
    IconData icon,
    Widget nav,
    BuildContext context,
  ) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => nav));
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(15), // Adjust padding if needed
        backgroundColor: Colors.white, // Set button background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.black),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.purple[700],
      unselectedItemColor: Colors.black,
      // currentIndex: _selectedIndex,
      // onTap: _onItemPressed,
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
