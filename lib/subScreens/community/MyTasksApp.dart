import 'package:flutter/material.dart';

void main() {
  runApp(MyTasksApp());
}

class MyTasksApp extends StatelessWidget {
  const MyTasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTasksPage(),
    );
  }
}

class MyTasksPage extends StatelessWidget {
  const MyTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("My Tasks", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add_circle_outline))],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            _taskSection("Today's Tasks", [
              _taskItem("Complete project presentation", "2:30 PM", Colors.cyan),
              _taskItem("Review team updates", "4:00 PM", Colors.purple),
            ]),
            _taskSection("Tomorrow", [
              _taskItem("Client meeting", "10:00 AM", Colors.orange),
              _taskItem("Team brainstorming session", "1:00 PM", Colors.cyan),
            ]),
            _taskSection("This Week", [
              _taskItem("Quarterly planning", "Thursday", Colors.purple),
              _taskItem("Project deadline", "Friday", Colors.green),
              _taskItem("Team building event", "Saturday", Colors.orange),
            ]),
            _taskSection("Completed", [
              _taskItem("Morning standup", "Today", Colors.green, isCompleted: true),
              _taskItem("Email follow-ups", "Today", Colors.green, isCompleted: true),
            ], titleColor: Colors.teal),
          ],
        ),
      ),
    );
  }

  Widget _taskSection(String title, List<Widget> tasks, {Color titleColor = Colors.black}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: titleColor)),
              SizedBox(height: 8),
              Column(children: tasks),
            ],
          ),
        ),
      ),
    );
  }

  Widget _taskItem(String task, String time, Color dotColor, {bool isCompleted = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(isCompleted ? Icons.check_circle : Icons.circle, color: dotColor, size: 18),
              SizedBox(width: 10),
              Text(task, style: TextStyle(fontSize: 16)),
            ],
          ),
          Text(time, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
