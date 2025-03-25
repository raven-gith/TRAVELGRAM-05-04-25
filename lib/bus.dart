import 'package:flutter/material.dart';
import 'package:flutter_ta_1/tike.bus.dart';


class BusPage extends StatelessWidget {
  const BusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/tourist_2.png', // Pastikan asset sudah ada di pubspec.yaml
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 220,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildInputField("Dari", "Jakarta", 'assets/transport.png'),
                  _buildInputField("Ke", "Semarang", 'assets/transport.png'),
                  _buildInputField("Tanggal Keberangkatan", "Selasa, 24 Des 2024", 'assets/icon.png'),
                  _buildInputField("Penumpang", "1 Orang", 'assets/icon (1).png'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TiketBusPage(),
                        ),
                      );
                    },
                    child: const Text("Cari"),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 16,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icon_2.png', // Tombol kembali menggunakan asset
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label, String value, String assetPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(assetPath, width: 20, height: 20),
                const SizedBox(width: 8),
                Text(value),
              ],
            ),
          ),
        ],
      ),
    );
  }
}