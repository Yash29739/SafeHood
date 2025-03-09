import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: FriendsChatPage()));
}

class FriendsChatPage extends StatelessWidget {
  const FriendsChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E3FF),
    
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Color(0xFFCC00FF),
        title: _buildHeader(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOnlineFriends(),
              const SizedBox(height: 20),
              _buildRecentChats(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildOnlineFriends() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Online Friends", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _friendAvatar("Sarah K.", Colors.purpleAccent),
              _friendAvatar("Mike R.", Colors.lightBlueAccent),
              _friendAvatar("Emma L.", Colors.orangeAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget _friendAvatar(String name, Color color) {
    return Column(
      children: [
        CircleAvatar(radius: 30, backgroundColor: color),
        const SizedBox(height: 5),
        Text(name, style: const TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildRecentChats() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Recent Chats", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          _chatItem("Sarah Kim", "Hey, are you free for coffee later?", "2m", Colors.purpleAccent),
          _chatItem("Mike Rodriguez", "Thanks for helping with the move!", "1h", Colors.lightBlueAccent),
          _chatItem("Emma Lee", "Community BBQ this weekend?", "3h", Colors.orangeAccent),
        ],
      ),
    );
  }

  Widget _chatItem(String name, String message, String time, Color avatarColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 25, backgroundColor: avatarColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(message, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          Text(time, style: TextStyle(color: Colors.grey[500])),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.chat, size: 30), label: "Chat"),
        BottomNavigationBarItem(icon: Icon(Icons.store, size: 30), label: "Store"),
        BottomNavigationBarItem(icon: Icon(Icons.person, size: 30), label: "Profile"),
      ],
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
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
}
