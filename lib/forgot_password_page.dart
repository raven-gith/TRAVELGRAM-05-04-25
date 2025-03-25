import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _contactController = TextEditingController();

  /// Jika user isi apa saja, kita anggap "terdaftar"
  /// Kalau kosong, kita anggap "belum terdaftar"
  void _submit() {
    final contact = _contactController.text.trim();
    if (contact.isEmpty) {
      _showDialog(title: 'Gagal', content: 'Email / Nomor HP belum terdaftar!');
    } else {
      _showDialog(
        title: 'Berhasil',
        content:
            'Link konfirmasi perubahan kata sandi sudah terkirim ke $contact',
      );
    }
  }

  void _showDialog({required String title, required String content}) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  void dispose() {
    _contactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar dengan judul bold
      appBar: AppBar(
        title: const Text(
          'LUPA KATA SANDI',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background image penuh
          Positioned.fill(
            child: Image.asset('assets/background.jpg', fit: BoxFit.cover),
          ),

          // Isi utama di tengah
          Center(
            child: SingleChildScrollView(
              child: Container(
                // Kotak putih mirip di login
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Masukkan Email atau Nomor HP untuk konfirmasi reset kata sandi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    // TextField untuk email/nomor hp
                    TextField(
                      controller: _contactController,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/envelope.png', // ganti ikon sesuai kebutuhan
                            width: 24,
                            height: 24,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Icon(Icons.email),
                          ),
                        ),
                        hintText: 'Email / Nomor HP',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Tombol Kirim
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.cyan,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'KIRIM',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
