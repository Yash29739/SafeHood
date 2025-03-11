import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Apartment Event Planner',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: events(),
    );
  }
}

class events extends StatefulWidget {
  const events({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<events> {
  List<Map<String, dynamic>> events = [];
  final TextEditingController _eventController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  DateTime? _selectedDate;

  // Function to add an event
  void _addEvent() {
    if (_eventController.text.isNotEmpty &&
        _selectedDate != null &&
        _locationController.text.isNotEmpty) {
      setState(() {
        events.add({
          "event": _eventController.text,
          "date": _selectedDate!,
          "location": _locationController.text,
          "completed": false,
        });
      });
      _eventController.clear();
      _locationController.clear();
      _selectedDate = null;
    }
  }

  // Function to edit an event
  void _editEvent(int index) {
    _eventController.text = events[index]['event'];
    _locationController.text = events[index]['location'];
    _selectedDate = events[index]['date'];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _eventController,
                decoration: const InputDecoration(labelText: 'Event Name'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location (Within Apartment)'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _selectDate(context, editMode: true, index: index),
                child: Text(_selectedDate != null
                    ? "Date: ${DateFormat('dd-MM-yyyy').format(_selectedDate!)}"
                    : "Select Date"),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  events[index]['event'] = _eventController.text;
                  events[index]['location'] = _locationController.text;
                  events[index]['date'] = _selectedDate!;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Function to delete an event
  void _deleteEvent(int index) {
    setState(() {
      events.removeAt(index);
    });
  }

  // Function to toggle event completion
  void _toggleEventCompletion(int index) {
    setState(() {
      events[index]['completed'] = !events[index]['completed'];
    });
  }

  // Function to select a date
  Future<void> _selectDate(BuildContext context, {bool editMode = false, int? index}) async {
    DateTime initialDate = _selectedDate ?? DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        if (editMode && index != null) {
          events[index]['date'] = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 230, 254),
     appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Color(0xFFCC00FF),
        title: _buildHeader(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Event Input Field
            TextField(
              controller: _eventController,
              decoration: InputDecoration(
                labelText: 'Enter Event Name',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.event, color: Colors.purple),
              ),
            ),
            const SizedBox(height: 10),

            // Location Input Field
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location (Within Apartment)',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                prefixIcon: const Icon(Icons.location_on, color: Colors.purple),
              ),
            ),
            const SizedBox(height: 10),

            // Date Picker Button
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text(_selectedDate != null
                  ? "Selected Date: ${DateFormat('dd-MM-yyyy').format(_selectedDate!)}"
                  : "Select Date"),
            ),
            const SizedBox(height: 10),

            // Add Event Button
            ElevatedButton.icon(
              onPressed: _addEvent,
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('Add Event'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 246, 246, 246),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Event List
            Expanded(child: _buildEventList()),
          ],
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return events.isEmpty
        ? const Center(
            child: Text(
              "No events yet! Click the add button to add an event.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          )
        : ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: Checkbox(
                    value: events[index]['completed'],
                    onChanged: (value) => _toggleEventCompletion(index),
                    activeColor: Colors.purple,
                  ),
                  title: Text(
                    events[index]['event'],
                    style: TextStyle(
                      fontSize: 18,
                      decoration: events[index]['completed']
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "📅 Date: ${DateFormat('dd-MM-yyyy').format(events[index]['date'])}",
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        "📍 Location: ${events[index]['location']}",
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  trailing: Wrap(
                    spacing: 12,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _editEvent(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteEvent(index),
                      ),
                    ],
                  ),
                ),
              );
            },
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
