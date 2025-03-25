import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String name;
  final String imageUrl;

  const DetailPage({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Column(
        children: [
          if (imageUrl.isNotEmpty)
            Image.asset(imageUrl, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 20),
          const Text("Detail Post", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}