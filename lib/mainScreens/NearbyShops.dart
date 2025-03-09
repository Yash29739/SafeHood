import 'package:flutter/material.dart';

class NearByShops extends StatefulWidget {
  const NearByShops({super.key});

  @override
  State<NearByShops> createState() => _NearByShopsState();
}

class _NearByShopsState extends State<NearByShops> {
  final TextEditingController _searchController = TextEditingController();

  List<Map<String, String>> shops = [
    {
      "name": "ABC Supermarket",
      "location": "MG Road",
      "contact": "9876543210",
      "hours": "8 AM - 9 PM"
    },
    {
      "name": "Fresh Mart",
      "location": "Brigade Road",
      "contact": "9876504321",
      "hours": "7 AM - 10 PM"
    },
    {
      "name": "City Store",
      "location": "Indiranagar",
      "contact": "9876123456",
      "hours": "9 AM - 8 PM"
    },
    {
      "name": "Quick Buy",
      "location": "Koramangala",
      "contact": "9876234567",
      "hours": "6 AM - 11 PM"
    },
    {
      "name": "Daily Needs",
      "location": "Jayanagar",
      "contact": "9876345678",
      "hours": "8 AM - 9 PM"
    },
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

  // Function to add a new shop
  void _addShopDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController locationController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController hoursController = TextEditingController();

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
              TextField(
                controller: contactController,
                decoration: const InputDecoration(labelText: "Contact Number"),
                keyboardType: TextInputType.phone,
              ),
              TextField(
                controller: hoursController,
                decoration: const InputDecoration(labelText: "Opening Hours"),
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
                    locationController.text.isNotEmpty &&
                    contactController.text.isNotEmpty &&
                    hoursController.text.isNotEmpty) {
                  setState(() {
                    shops.add({
                      "name": nameController.text,
                      "location": locationController.text,
                      "contact": contactController.text,
                      "hours": hoursController.text,
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
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          filteredShops[index]["name"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Color.fromARGB(255, 175, 139, 220), size: 18),
                            const SizedBox(width: 5),
                            Text(filteredShops[index]["location"]!),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.phone, color: Colors.green, size: 18),
                            const SizedBox(width: 5),
                            Text(filteredShops[index]["contact"]!),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.access_time, color: Colors.blue, size: 18),
                            const SizedBox(width: 5),
                            Text(filteredShops[index]["hours"]!),
                          ],
                        ),
                        const Divider(thickness: 1),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Color.fromARGB(255, 178, 144, 220)),
                            onPressed: () {
                              setState(() {
                                shops.removeAt(index);
                                filteredShops = shops;
                              });
                            },
                          ),
                        ),
                      ],
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
