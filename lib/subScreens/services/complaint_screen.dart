import 'package:flutter/material.dart';

class ComplaintScreen extends StatelessWidget {
  const ComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('File a Complaint')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Subject', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
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
              decoration: InputDecoration(labelText: 'Apartment Number', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: 'Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
