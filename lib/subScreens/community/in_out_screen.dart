import 'package:flutter/material.dart';

class InOutScreen extends StatefulWidget {
  const InOutScreen({super.key});

  @override
  _InOutScreenState createState() => _InOutScreenState();
}

class _InOutScreenState extends State<InOutScreen> {
  final Map<String, bool> userStatus = {
    "John Doe": true,
    "Jane Smith": false,
    "Michael Johnson": true,
    "Alice Brown": false,
    "Bob White": true,
  };

  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredUsers = [];

  @override
  void initState() {
    super.initState();
    _filteredUsers = userStatus.keys.toList();
  }

  void toggleStatus(String user) {
    setState(() {
      userStatus[user] = !userStatus[user]!;
    });
  }

  void _filterUsers(String query) {
    setState(() {
      _filteredUsers = userStatus.keys
          .where((user) => user.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2E3FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: const Color(0xFFCC00FF),
        title: _buildHeader(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = _filteredUsers[index];
                  final isIn = userStatus[user]!;

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.purple,
                        child: Text(user[0], style: const TextStyle(color: Colors.white)),
                      ),
                      title: Text(user),
                      subtitle: Text(isIn ? 'Status: IN' : 'Status: OUT'),
                      trailing: ElevatedButton(
                        onPressed: () => toggleStatus(user),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isIn ? Colors.green : Colors.red,
                        ),
                        child: Text(
                          isIn ? "IN" : "OUT",
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
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
      ],
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      onChanged: _filterUsers,
      decoration: InputDecoration(
        hintText: "Search users...",
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Icon(Icons.search, color: Colors.purple),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  
}
