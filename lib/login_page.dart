import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email dan password harus diisi!")),
      );
    }
  }

  /// Contoh fungsi pop-up untuk lupa kata sandi
  void forgotPassword() {
    // Jika mau cek apakah emailController kosong, bisa lakukan di sini
    String email = emailController.text.trim();
    if (email.isEmpty) {
      _showDialog(
        title: "Gagal",
        content: "Mohon isi email / nomor HP terlebih dahulu!",
      );
    } else {
      _showDialog(
        title: "Berhasil",
        content: "Link reset kata sandi sudah dikirim ke $email",
      );
    }
  }

  /// Fungsi bantu untuk menampilkan dialog
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
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg',
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(color: Colors.grey),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TRAVELGRAM',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(1.0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/clipboard-user.png',
                                width: 24,
                                height: 24,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const Icon(Icons.email),
                              ),
                            ),
                            hintText: 'EMAIL',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/lock.png',
                                width: 24,
                                height: 24,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        const Icon(Icons.lock),
                              ),
                            ),
                            hintText: 'KATA SANDI',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/forgot-password');
                            },
                            // onPressed: forgotPassword, // Panggil fungsi pop-up
                            child: const Text(
                              'LUPA KATA SANDI',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.cyan,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: login,
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/google.png',
                            width: 24,
                            height: 24,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Icon(Icons.g_translate),
                          ),
                          label: const Text('Login dengan Google'),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/briefcase.png',
                            width: 24,
                            height: 24,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    const Icon(Icons.business),
                          ),
                          label: const Text('Login dengan Akun Bisnis'),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('BELUM PUNYA AKUN? '),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: const Text(
                                'BUAT AKUN',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
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
}
