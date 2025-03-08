import 'package:flutter/material.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Subject', border: OutlineInputBorder(),fillColor: Colors.white,filled: true),
            ),
            const SizedBox(height: 10),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Description', border: OutlineInputBorder(),fillColor: Colors.white,filled: true),
            ),
            const SizedBox(height: 20),
            const Text('Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Wrap(
              spacing: 10,
              children: [
                ChoiceChip(label: const Text('Noise'), selected: false, onSelected: (value) {}),
                ChoiceChip(label: const Text('Maintenance'), selected: false, onSelected: (value) {}),
                ChoiceChip(label: const Text('Security'), selected: false, onSelected: (value) {}),
                ChoiceChip(label: const Text('Cleanliness'), selected: false, onSelected: (value) {}),
                ChoiceChip(label: const Text('Parking'), selected: false, onSelected: (value) {}),
                ChoiceChip(label: const Text('Other'), selected: false, onSelected: (value) {}),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: 'Apartment Number', border: OutlineInputBorder(),fillColor: Colors.white,filled: true),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder(),fillColor: Colors.white,filled: true),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // Background color
    foregroundColor: Colors.black, // Text color
  ),
  child: const Text('Submit'),
)

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
