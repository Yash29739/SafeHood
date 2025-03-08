import 'package:flutter/material.dart';

class NearByShops extends StatefulWidget {
  const NearByShops({super.key});

  @override
  State<NearByShops> createState() => _NearByShopsState();
}

class _NearByShopsState extends State<NearByShops> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> shops = [
    {"name": "ABC Supermarket", "location": "MG Road"},
    {"name": "Fresh Mart", "location": "Brigade Road"},
    {"name": "City Store", "location": "Indiranagar"},
    {"name": "Quick Buy", "location": "Koramangala"},
    {"name": "Daily Needs", "location": "Jayanagar"},
  ];

  List<Map<String, String>> filteredShops = [];

  @override
  void initState() {
    super.initState();
    filteredShops = shops;
  }

  // Function to filter shops based on search
  void _filterShops(String query) {
    setState(() {
      filteredShops = shops
          .where((shop) =>
              shop["name"]!.toLowerCase().contains(query.toLowerCase()) ||
              shop["location"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  // Function to handle FAB click
  void _addShopDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController locationController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Add New Shop"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Shop Name"),
              ),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: "Location"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    locationController.text.isNotEmpty) {
                  setState(() {
                    shops.add({
                      "name": nameController.text,
                      "location": locationController.text
                    });
                    filteredShops = shops;
                  });
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Shops"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: _searchController,
              onChanged: _filterShops,
              decoration: InputDecoration(
                labelText: "Search Shops",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredShops.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(filteredShops[index]["name"]!),
                    subtitle: Text("📍 ${filteredShops[index]["location"]!}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          shops.removeAt(index);
                          filteredShops = shops;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addShopDialog,
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}
