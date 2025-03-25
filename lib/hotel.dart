import 'package:flutter/material.dart';
import 'tiket_hotel.dart';

class HotelPage extends StatelessWidget {
  const HotelPage({super.key});

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
              'assets/tourist.png', // Sesuaikan dengan aset yang ada
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
                  _buildInfoCard("Lokasi", "Sekitar Bandung", 'assets/icon_3.png'),
                  _buildInfoCard("Tanggal", "Selasa, 24 Des 2024 – Selasa, 24 Des 2024", 'assets/icon.png'),
                  _buildInfoCard("Kamar", "1 Kamar", 'assets/image_1.png'),
                  const SizedBox(height: 20),
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
                          builder: (context) => TiketHotelPage(),
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
                'assets/icon_2.png', // Tombol kembali sesuai aset yang digunakan
                height: 24,
                width: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value, String assetPath) {
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