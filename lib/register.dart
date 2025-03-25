import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya (Login)
          },
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey,
              ),
            ),
          ),

          // Form Register
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo Text
                  Text(
                    'TRAVELGRAM',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Register Box
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white.withAlpha((0.9 * 255).toInt()),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildTextField('assets/envelope.png', "EMAIL"),
                        const SizedBox(height: 10),

                        _buildTextField('assets/id-card.png', "NAMA PENGGUNA"),
                        const SizedBox(height: 10),

                        _buildTextField('assets/phone-flip.png', "NO. TELEPON"),
                        const SizedBox(height: 10),

                        _buildTextField('assets/eye-crossed.png', "KATA SANDI", obscureText: true),
                        const SizedBox(height: 10),

                        _buildTextField('assets/eye-crossed.png', "ULANGI KATA SANDI", obscureText: true),
                        const SizedBox(height: 15),

                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () async {
                              // Tampilkan SnackBar sebagai notifikasi sukses
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Akun berhasil terdaftar!'),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2),
                                ),
                              );

                              // Tunggu 2 detik lalu kembali ke halaman login
                              await Future.delayed(const Duration(seconds: 2));

                              if (!context.mounted) return; // Mencegah error jika widget sudah di-unmount

                              // Pindah ke halaman login
                              Navigator.pushReplacementNamed(context, '/');
                            },
                            child: const Text(
                              'KIRIM',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable TextField Widget dengan ikon dari assets
  Widget _buildTextField(String iconPath, String hint, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            iconPath,
            width: 24,
            height: 24,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
          ),
        ),
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
