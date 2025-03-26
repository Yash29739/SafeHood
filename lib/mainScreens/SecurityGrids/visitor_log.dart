import 'package:flutter/material.dart';

class VisitorLogsPage extends StatefulWidget {
  @override
  _VisitorLogsPageState createState() => _VisitorLogsPageState();
}

class _VisitorLogsPageState extends State<VisitorLogsPage> {
  final List<Map<String, String>> visitorLogs = [
    {"name": "John Doe", "purpose": "Meeting", "time": "2025-03-21 10:30"},
    {"name": "Jane Smith", "purpose": "Delivery", "time": "2025-03-21 11:00"},
    {
      "name": "Robert Brown",
      "purpose": "Interview",
      "time": "2025-03-21 12:15",
    },
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();

  void _addVisitorLog() {
    if (nameController.text.isNotEmpty && purposeController.text.isNotEmpty) {
      setState(() {
        visitorLogs.add({
          "name": nameController.text,
          "purpose": purposeController.text,
          "time": DateTime.now().toLocal().toString().substring(0, 16),
        });
      });
      nameController.clear();
      purposeController.clear();
      Navigator.pop(context);
    }
  }

  void _showAddVisitorDialog() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Add Visitor Log"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "Visitor Name"),
                ),
                TextField(
                  controller: purposeController,
                  decoration: InputDecoration(labelText: "Purpose of Visit"),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              ElevatedButton(onPressed: _addVisitorLog, child: Text("Add")),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Visitor Logs"),
        backgroundColor: const Color.fromARGB(255, 196, 62, 196),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple.shade100,
              const Color.fromARGB(255, 208, 135, 223),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child:
                  visitorLogs.isEmpty
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
                            child: ListTile(
                              title: Text(
                                log["name"]!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              subtitle: Text(
                                "Purpose: ${log["purpose"]}\nTime: ${log["time"]}",
                                style: TextStyle(color: Colors.black87),
                              ),
                              leading: Icon(
                                Icons.person,
                                color: Colors.deepPurple,
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
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 175, 65, 176),
      ),
    );
  }
}
