import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(''),
          actions: [
            IconButton(
              icon: Image.asset('assets/setting.png', width: 24, height: 24),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
        body: Column(
          children: [
            /// Header Profile
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/avatar_minji.png'),
                    radius: 40,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Minji',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                // Aksi ke halaman perubahan akun
                              },
                              child: Image.asset(
                                'assets/change.png',
                                width: 13,
                                height: 13,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text('Followers 40   Following 40'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Transaksi
            TextButton(
              onPressed: () {
                // aksi ke halaman transaksi
              },
              child: const Text('Transaksi 🧾'),
            ),

            /// Tab Bar
            const TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(
                  icon: ImageIcon(
                    AssetImage('assets/grid.png'),
                    color: Colors.black,
                  ),
                ),
                Tab(
                  icon: ImageIcon(
                    AssetImage('assets/heart.png'),
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            /// Isi TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  /// Tab 1: Postingan
                  ListView(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/avatar_minji.png',
                          ),
                        ),
                        title: const Text('Minji'),
                        subtitle: const Text(
                          'Akhirnya aku menemukan wisata alam yang indah',
                        ),
                        trailing: const Icon(Icons.more_vert),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 72, bottom: 16),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/heart.png',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 4),
                            const Text('23'),
                            const SizedBox(width: 16),
                            Image.asset(
                              'assets/comment-alt-dots.png',
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(width: 4),
                            const Text('5'),
                            const SizedBox(width: 16),
                            const Icon(Icons.share_outlined),
                          ],
                        ),
                      ),
                    ],
                  ),

                  /// Tab 2: Disukai
                  const Center(child: Text('Belum ada postingan disukai')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
