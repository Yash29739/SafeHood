import 'package:flutter/material.dart';

class IncidentReportsPage extends StatefulWidget {
  @override
  _IncidentReportsPageState createState() => _IncidentReportsPageState();
}

class _IncidentReportsPageState extends State<IncidentReportsPage> {
  final List<Map<String, String>> incidentReports = [
    {
      "title": "Unauthorized Entry",
      "description": "A person was found entering a restricted area without permission.",
      "time": "2025-03-21 10:30",
    },
    {
      "title": "Lost Item",
      "description": "A visitor reported losing a valuable item in the lobby.",
      "time": "2025-03-21 12:45",
    },
    {
      "title": "Suspicious Activity",
      "description": "A group of individuals were seen loitering around the premises.",
      "time": "2025-03-21 14:10",
    },
  ];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void _addIncidentReport() {
    if (titleController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
      setState(() {
        incidentReports.add({
          "title": titleController.text,
          "description": descriptionController.text,
          "time": DateTime.now().toLocal().toString().substring(0, 16),
        });
      });
      titleController.clear();
      descriptionController.clear();
      Navigator.pop(context);
    }
  }

  void _showAddIncidentDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Report an Incident"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Incident Title"),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: _addIncidentReport,
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Incident Reports"),
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
        child: Column(
          children: [
            Expanded(
              child: incidentReports.isEmpty
                  ? Center(child: Text("No incident reports available."))
                  : ListView.builder(
                      itemCount: incidentReports.length,
                      itemBuilder: (context, index) {
                        final report = incidentReports[index];
                        return Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                          child: ListTile(
                            leading: Icon(Icons.report, color: Colors.red, size: 40),
                            title: Text(report["title"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                            subtitle: Text("Description: ${report["description"]}\nTime: ${report["time"]}"),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddIncidentDialog,
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 175, 65, 176),
      ),
    );
  }
}
