import 'package:flutter/material.dart';

class Event {
  final String title;
  final String description;
  final String category; // E.g., Age, Skill, etc.
  final String date;

  Event({
    required this.title,
    required this.description,
    required this.category,
    required this.date,
  });
}

class UpcomingEventsScreen extends StatelessWidget {
  // Removed the 'const' keyword here
  UpcomingEventsScreen({super.key});

  // Sample events data
  final List<Event> events = [
    Event(
      title: 'Yoga for Beginners',
      description: 'A beginner-friendly yoga session.',
      category: 'Skill',
      date: '2025-03-20',
    ),
    Event(
      title: 'Art Class for Kids',
      description: 'An art class for children to explore creativity.',
      category: 'Age: Kids',
      date: '2025-03-22',
    ),
    Event(
      title: 'Web Development Bootcamp',
      description: 'An intensive coding bootcamp for aspiring web developers.',
      category: 'Skill',
      date: '2025-03-25',
    ),
    Event(
      title: 'Cooking Class for Teens',
      description: 'Learn to cook delicious meals in this fun class.',
      category: 'Age: Teens',
      date: '2025-03-27',
    ),
    Event(
      title: 'Senior Fitness Class',
      description: 'A fitness class designed specifically for seniors.',
      category: 'Age: Seniors',
      date: '2025-03-30',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Group events by category
    Map<String, List<Event>> categorizedEvents = {};
    for (var event in events) {
      if (categorizedEvents.containsKey(event.category)) {
        categorizedEvents[event.category]!.add(event);
      } else {
        categorizedEvents[event.category] = [event];
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Events'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: categorizedEvents.entries.map((entry) {
            String category = entry.key;
            List<Event> eventList = entry.value;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 10),
                ...eventList.map((event) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(event.title),
                      subtitle: Text(event.description),
                      trailing: Text(event.date),
                      onTap: () {
                        // Optionally, you can navigate to a detailed event screen
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(event.title),
                              content: Text(event.description),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  );
                }),
                const SizedBox(height: 20),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
