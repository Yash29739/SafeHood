import 'package:flutter/material.dart';

class VisitorLogsPage extends StatefulWidget {
  @override
  _VisitorLogsPageState createState() => _VisitorLogsPageState();
}

class _VisitorLogsPageState extends State<VisitorLogsPage> {
  final List<Map<String, String>> visitorLogs = [
    {"name": "John Doe", "doorNo": "101", "purpose": "Meeting", "time": "2025-03-21 10:30"},
    {"name": "Jane Smith", "doorNo": "202", "purpose": "Delivery", "time": "2025-03-21 11:00"},
    {"name": "Robert Brown", "doorNo": "303", "purpose": "Interview", "time": "2025-03-21 12:15"},
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController doorNoController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();

  void _addVisitorLog() {
    if (nameController.text.isNotEmpty &&
        doorNoController.text.isNotEmpty &&
        purposeController.text.isNotEmpty) {
      setState(() {
        visitorLogs.add({
          "name": nameController.text,
          "doorNo": doorNoController.text,
          "purpose": purposeController.text,
          "time": DateTime.now().toLocal().toString().substring(0, 16),
        });
      });
      nameController.clear();
      doorNoController.clear();
      purposeController.clear();
      Navigator.pop(context);
    }
  }

  void _showAddVisitorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          "Add Visitor Log",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Visitor Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: doorNoController,
              decoration: InputDecoration(
                labelText: "Door No.",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: purposeController,
              decoration: InputDecoration(
                labelText: "Purpose of Visit",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: _addVisitorLog,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text("Add"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitor Logs"),
        backgroundColor: const Color.fromARGB(255, 148, 45, 148),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade100,
              const Color.fromARGB(255, 193, 164, 199),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: visitorLogs.isEmpty
                  ? Center(
                      child: Text(
                        "No visitor logs available.",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: visitorLogs.length,
                      itemBuilder: (context, index) {
                        final log = visitorLogs[index];
                        return Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4,
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            title: Text(
                              log["name"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              "Door No: ${log["doorNo"]}\nPurpose: ${log["purpose"]}\nTime: ${log["time"]}",
                              style: TextStyle(color: Colors.black87),
                            ),
                            leading: CircleAvatar(
                              backgroundColor: Colors.purple.shade100,
                              child: Icon(Icons.person, color: Colors.deepPurple),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddVisitorDialog,
        backgroundColor: const Color.fromARGB(255, 196, 62, 196),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
