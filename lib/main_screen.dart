import 'package:flutter/material.dart';
import 'home.dart';
import 'community_page.dart';
import 'chat_page.dart';
import 'profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const CommunityPage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/home.png')),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/users.png')),
            label: 'Komunitas',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/messages.png')),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/circle-user.png')),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
