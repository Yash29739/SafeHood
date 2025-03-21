import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GuardPatrolPage extends StatefulWidget {
  @override
  _GuardPatrolPageState createState() => _GuardPatrolPageState();
}

class _GuardPatrolPageState extends State<GuardPatrolPage> {
  final List<Map<String, String>> patrolLogs = [
    {
      "location": "Main Gate",
      "notes": "Checked ID, all clear.",
      "time": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now().subtract(Duration(hours: 1))),
    },
    {
      "location": "Parking Lot",
      "notes": "Suspicious vehicle, reported to supervisor.",
      "time": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now().subtract(Duration(hours: 2))),
    },
    {
      "location": "Back Entrance",
      "notes": "Area secured, nothing unusual.",
      "time": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now().subtract(Duration(hours: 3))),
    },
  ];

  final TextEditingController locationController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  void _addPatrolLog() {
    if (locationController.text.isNotEmpty) {
      setState(() {
        patrolLogs.insert(
          0,
          {
            "location": locationController.text,
            "notes": notesController.text.isEmpty ? "No additional notes" : notesController.text,
            "time": DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          },
        );
      });
      locationController.clear();
      notesController.clear();
      Navigator.pop(context);
    }
  }

  void _showAddPatrolDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.deepPurple.shade50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Log Patrol Check-In", style: TextStyle(color: Colors.deepPurple)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: "Location", border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: notesController,
              decoration: InputDecoration(labelText: "Notes (Optional)", border: OutlineInputBorder()),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            onPressed: _addPatrolLog,
            child: Text("Log"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guard Patrol Logs"),
        backgroundColor:const Color.fromARGB(255, 196, 62, 196),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[Colors.purple.shade100, const Color.fromARGB(255, 208, 135, 223)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: patrolLogs.length,
          itemBuilder: (context, index) {
            final log = patrolLogs[index];
            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 212, 131, 216),
                  child: Icon(Icons.security, color: Colors.white),
                ),
                title: Text(
                  "Location: ${log["location"]}",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
                ),
                subtitle: Text(
                  "Notes: ${log["notes"]}\nTime: ${log["time"]}",
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddPatrolDialog,
        backgroundColor:const Color.fromARGB(255, 175, 65, 176),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
