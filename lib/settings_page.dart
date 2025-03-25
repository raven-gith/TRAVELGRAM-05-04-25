import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  // --- Contoh navigasi ke halaman lain ---
  void _goToKataSandi(BuildContext context) {
    // Navigator.pushNamed(context, '/changePassword');
  }

  void _goToBahasa(BuildContext context) {
    // Navigator.pushNamed(context, '/language');
  }

  void _goToSyaratKetentuan(BuildContext context) {
    // Navigator.pushNamed(context, '/terms');
  }

  void _goToPrivasi(BuildContext context) {
    // Navigator.pushNamed(context, '/privacy');
  }

  void _goToTentangKami(BuildContext context) {
    // Navigator.pushNamed(context, '/about');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          // BAGIAN: Kata Sandi & Keamanan
          ListTile(
            leading: Image.asset(
              'assets/security.png', // Ganti dengan icon kamu (kalau ada)
              width: 24,
              height: 24,
            ),
            title: const Text('Kata Sandi & Keamanan'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _goToKataSandi(context),
          ),

          // BAGIAN: Bahasa
          ListTile(
            leading: Image.asset(
              'assets/language.png', // Ganti dengan icon kamu (kalau ada)
              width: 24,
              height: 24,
            ),
            title: const Text('Bahasa'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _goToBahasa(context),
          ),

          // PEMBATAS
          const Divider(thickness: 8, color: Color(0xfff5f5f5)),

          // BAGIAN: App Version
          ListTile(
            title: const Text('App Version'),
            trailing: const Text('1.0.1'),
          ),

          // BAGIAN: Syarat & Ketentuan
          ListTile(
            title: const Text('Syarat & Ketentuan'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _goToSyaratKetentuan(context),
          ),

          // BAGIAN: Pemberitahuan Privasi
          ListTile(
            title: const Text('Pemberitahuan Privasi'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _goToPrivasi(context),
          ),

          // BAGIAN: Tentang Kami
          ListTile(
            title: const Text('Tentang Kami'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => _goToTentangKami(context),
          ),

          // PEMBATAS
          const Divider(thickness: 8, color: Color(0xfff5f5f5)),

          // BAGIAN: Log Out
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Log Out', style: TextStyle(color: Colors.red)),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Konfirmasi'),
                    content: const Text('Apakah kamu yakin ingin log out?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                        },
                        child: const Text('Tidak'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Tutup dialog
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                        child: const Text('Ya'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
