import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  // Data dummy
  final List<Map<String, String>> chats = const [
    {
      'name': 'Andre',
      'message': 'kesana aja ndre, worth it',
      'avatar': 'assets/avatar_andre.png',
    },
    {
      'name': 'Maul',
      'message': 'ntar kita cabs jamber?',
      'avatar': 'assets/avatar_andre.png',
    },
    {
      'name': 'Amel',
      'message': 'iya tadi rame',
      'avatar': 'assets/avatar_amel.png',
    },
    {
      'name': 'Putri',
      'message': 'info dong ini dimana?',
      'avatar': 'assets/avatar_putri.png',
    },
    {
      'name': 'Rijal',
      'message': 'dresscode pake merah',
      'avatar': 'assets/avatar_rijal.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: Image.asset('assets/search.png', width: 24, height: 24),
            onPressed: () {
              // Tambahkan aksi pencarian jika diperlukan
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (_, __) => const Divider(height: 0),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(chat['avatar']!),
              radius: 24,
            ),
            title: Text(
              chat['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(chat['message']!),
            onTap: () {
              // Aksi saat item diklik (misal buka detail chat)
            },
          );
        },
      ),
    );
  }
}
