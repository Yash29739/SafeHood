import 'package:flutter/material.dart';

class AccessControlPage extends StatefulWidget {
  @override
  _AccessControlPageState createState() => _AccessControlPageState();
}

class _AccessControlPageState extends State<AccessControlPage> {
  final List<Map<String, String>> accessLogs = [
    {"name": "John Doe", "accessType": "Granted", "time": "2025-03-21 09:00"},
    {"name": "Jane Smith", "accessType": "Denied", "time": "2025-03-21 09:30"},
    {"name": "Robert Brown", "accessType": "Granted", "time": "2025-03-21 10:15"},
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController accessTypeController = TextEditingController();

  void _addAccessLog() {
    if (nameController.text.isNotEmpty && accessTypeController.text.isNotEmpty) {
      setState(() {
        accessLogs.add({
          "name": nameController.text,
          "accessType": accessTypeController.text,
          "time": DateTime.now().toLocal().toString().substring(0, 16),
        });
      });
      nameController.clear();
      accessTypeController.clear();
      Navigator.pop(context);
    }
  }

  void _showAddAccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Access Log"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Person Name"),
            ),
            TextField(
              controller: accessTypeController,
              decoration: InputDecoration(labelText: "Access Type (e.g., Granted/Denied)"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: _addAccessLog,
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
        title: Text("Access Control"),
        backgroundColor: const Color.fromARGB(255, 196, 62, 196),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade100, const Color.fromARGB(255, 208, 135, 223)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: accessLogs.isEmpty
                  ? Center(
                      child: Text(
                        "No access logs available.",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: accessLogs.length,
                      itemBuilder: (context, index) {
                        final log = accessLogs[index];
                        return Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            title: Text(
                              log["name"]!,
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                            ),
                            subtitle: Text(
                              "Access: ${log["accessType"]}\nTime: ${log["time"]}",
                              style: TextStyle(color: Colors.black87),
                            ),
                            leading: Icon(
                              log["accessType"] == "Granted" ? Icons.check_circle : Icons.cancel,
                              color: log["accessType"] == "Granted" ? Colors.green : Colors.red,
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
        onPressed: _showAddAccessDialog,
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 175, 65, 176),
      ),
    );
  }
}
