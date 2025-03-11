import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => TodoApp();
}

class TodoApp extends State<TodoListScreen> {
  final TextEditingController _taskController = TextEditingController();
  List<Map<String, dynamic>> tasks = []; // Holds task data

  // Function to add a new task
  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        tasks.add({"task": _taskController.text, "completed": false});
      });
      _taskController.clear();
    }
  }

  // Function to mark task as completed
  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index]["completed"] = !tasks[index]["completed"];
    });
  }

  // Function to delete a task
  void _deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: "Enter Task",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add, color: Colors.purple),
                  onPressed: _addTask,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Task List
            Expanded(
              child: tasks.isEmpty
                  ? const Center(child: Text("No tasks added yet!"))
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: Checkbox(
                              value: tasks[index]["completed"],
                              onChanged: (value) => _toggleTaskCompletion(index),
                              activeColor: Colors.purple,
                            ),
                            title: Text(
                              tasks[index]["task"],
                              style: TextStyle(
                                decoration: tasks[index]["completed"]
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteTask(index),
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
}
