import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travelgram'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.person, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'User Name',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            _buildCategoryIcons(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildPost('Rizky', 'Gunung Sindoro', 'assets/sindoro.jpg', 144, 12),
                  _buildPost('Rizka', 'Gunung Merbabu', 'assets/merbabu.jpg', 200, 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcons() {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.airplanemode_active, "label": "Tiket Pesawat"},
      {"icon": Icons.hotel, "label": "Hotel"},
      {"icon": Icons.place, "label": "Paket Wisata"},
      {"icon": Icons.directions_bus, "label": "Tiket Bus & Travel"},
      {"icon": Icons.train, "label": "Tiket Kereta Api"},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: categories.map((category) {
        return Column(
          children: [
            Icon(category["icon"], color: Colors.black, size: 30), // Ikon tanpa CircleAvatar
            const SizedBox(height: 5),
            Text(category["label"], style: const TextStyle(fontSize: 12)),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildPost(String username, String location, String imagePath, int likes, int comments) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(child: Text(username[0])),
            title: Text(username),
            subtitle: Text(location),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Icon(Icons.favorite, color: Colors.red),
                const SizedBox(width: 5),
                Text('$likes'),
                const SizedBox(width: 20),
                Icon(Icons.comment, color: Colors.grey),
                const SizedBox(width: 5),
                Text('$comments'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}