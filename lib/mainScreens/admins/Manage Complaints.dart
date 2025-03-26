import 'package:flutter/material.dart';

class ManageComplaintsScreen extends StatefulWidget {
  const ManageComplaintsScreen({super.key});

  @override
  State<ManageComplaintsScreen> createState() => _ManageComplaintsScreenState();
}

class _ManageComplaintsScreenState extends State<ManageComplaintsScreen> {
  List<Map<String, dynamic>> complaints = [
    {'id': 1, 'title': 'Water leakage', 'status': 'Pending'},
    {'id': 2, 'title': 'Noise disturbance', 'status': 'Resolved'},
    {'id': 3, 'title': 'Broken streetlight', 'status': 'Pending'},
  ];

  void markResolved(int index) {
    setState(() {
      complaints[index]['status'] = 'Resolved';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Complaints"),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(complaints[index]['title']),
              subtitle: Text("Status: ${complaints[index]['status']}"),
              trailing: complaints[index]['status'] == 'Pending'
                  ? ElevatedButton(
                      onPressed: () => markResolved(index),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text("Mark Resolved"),
                    )
                  : const Icon(Icons.check_circle, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}
