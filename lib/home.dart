import 'package:flutter/material.dart';
import 'package:flutter_ta_1/chat_page.dart';
import 'package:flutter_ta_1/community_page.dart';
import 'package:flutter_ta_1/profile_page.dart';
import 'tiket.flight.dart';
import 'hotel.dart';
import 'wisata.dart';
import 'bus.dart';
import 'keretaapi.dart';
import 'komen.dart  ';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, bool> likedPosts = {};
  Map<String, int> likeCounts = {
    'assets/sindoro.jpg': 144,
    'assets/nimo.png': 200,
  };
  Map<String, int> commentCounts = {
    'assets/sindoro.jpg': 12,
    'assets/nimo.png': 18,
  };
  List<Map<String, dynamic>> userPosts = [];
  void _openPostDialog() {
  final captionController = TextEditingController();
  XFile? imageFile;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 16,
              left: 16,
              right: 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Buat Postingan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: captionController,
                  decoration: const InputDecoration(labelText: 'Caption'),
                ),
                const SizedBox(height: 10),
                imageFile != null
                    ? Image.file(File(imageFile!.path), height: 150)
                    : TextButton.icon(
                        onPressed: () async {
                          final picker = ImagePicker();
                          final picked = await picker.pickImage(source: ImageSource.gallery);
                          if (picked != null) {
                            setModalState(() {
                              imageFile = picked;
                            });
                          }
                        },
                        icon: const Icon(Icons.image),
                        label: const Text('Pilih Gambar'),
                      ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (imageFile != null) {
                      setState(() {
                        userPosts.insert(0, {
                          'username': 'Kamu',
                          'location': 'Lokasi default',
                          'caption': captionController.text,
                          'imageFile': imageFile!.path,
                        });
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Post'),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
    String getPostIdFromImage(String imagePath) {
    switch (imagePath) {
      case 'assets/sindoro.jpg':
        return '1';
      case 'assets/nimo.png':
        return '2';
      default:
        return '0';
    }
  }


  void toggleLike(String imagePath) {
    setState(() {
      likedPosts[imagePath] = !(likedPosts[imagePath] ?? false);
      likeCounts[imagePath] =
          (likeCounts[imagePath] ?? 0) + (likedPosts[imagePath]! ? 1 : -1);
    });
  }

  void addComment(String imagePath) {
    setState(() {
      commentCounts[imagePath] = (commentCounts[imagePath] ?? 0) + 1;
    });
  }
Widget _buildPost(String username, String location, String imagePath,
    {String? caption, bool isFile = false}) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(child: Text(username[0])),
          title: Text(username),
          subtitle: Text(location),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: isFile
              ? Image.file(File(imagePath), fit: BoxFit.cover)
              : Image.asset(imagePath, fit: BoxFit.cover),
        ),
        if (caption != null && caption.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(caption),
          ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              onPressed: () {
                toggleLike(imagePath);
              },
              icon: Image.asset(
                'assets/heart.png',
                width: 20,
                height: 20,
                color: likedPosts[imagePath] ?? false ? Colors.red : Colors.black,
              ),
              label: Text('${likeCounts[imagePath] ?? 0}'),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CommentPage(postId: getPostIdFromImage(imagePath)),
                  ),
                );
              },
              icon: Image.asset(
                'assets/comment-alt-dots.png',
                width: 20,
                height: 20,
                color: Colors.black,
              ),
              label: const Text('Komentar'),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travelgram'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Image.asset(
              'assets/menu-burger.png',
              width: 24,
              height: 24,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: _buildCategoryIcons(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildDrawerItem(context, 'assets/plane-alt.png', 'Tiket Pesawat', TicketFlightPage()),
            _buildDrawerItem(context, 'assets/hotel.png', 'Hotel', HotelPage()),
            _buildDrawerItem(context, 'assets/umbrella-beach.png', 'Paket Wisata',WisataPage() ),
            _buildDrawerItem(context, 'assets/bus-alt.png', 'Tiket Bus & Travel', BusPage()),
            _buildDrawerItem(context, 'assets/train-side.png', 'Tiket Kereta Api', KeretaApiPage()),
            _buildDrawerItem(context, 'assets/users.png', 'Komunitas', CommunityPage()),
            _buildDrawerItem(context, 'assets/messages.png', 'Pesan', ChatPage()),
            _buildDrawerItem(context, 'assets/users.png', 'Profil', ProfilePage()),
            _buildDrawerItem(context, 'assets/phone-call.png', 'Pusat Bantuan', null),
            _buildDrawerItem(context, 'assets/user-headset.png', 'Hubungi Kami', null),
          ],
        ),
      ),
      body: Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
    children: [
      Expanded(
        child: ListView(
          children: [
            ...userPosts.map((post) => _buildPost(
                  post['username'],
                  post['location'],
                  post['imageFile'],
                  caption: post['caption'],
                  isFile: true,
                )),
            _buildPost('Rizky', 'Gunung Sindoro', 'assets/sindoro.jpg'),
            _buildPost('Rizka', 'Gunung Merbabu', 'assets/nimo.png'),
          ],
        ),
      ),
    ],
  ),
),

      floatingActionButton: FloatingActionButton(
      onPressed: () {
      _openPostDialog();
    },
      backgroundColor: Colors.white,
      child: Image.asset('assets/plus.png', width: 30, height: 30),
    ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String iconPath, String title, Widget? page) {
    return ListTile(
      leading: Image.asset(
        iconPath,
        width: 24,
        height: 24,
        color: Colors.black,
      ),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
    );
  }

  Widget _buildCategoryIcons() {
    List<Map<String, dynamic>> categories = [
      {"icon": 'assets/plane-alt.png', "label": "Tiket Pesawat", "page": TicketFlightPage()},
      {"icon": 'assets/hotel.png', "label": "Hotel", "page": HotelPage()},
      {"icon": 'assets/umbrella-beach.png', "label": "Paket Wisata", "page": WisataPage()},
      {"icon": 'assets/bus-alt.png', "label": "Tiket Bus & Travel", "page": BusPage()},
      {"icon": 'assets/train-side.png', "label": "Tiket Kereta Api", "page": KeretaApiPage()},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: categories.map((category) {
        return InkWell(
          onTap: () {
            if (category["page"] != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => category["page"]!),
              );
            }
          },
          child: Column(
            children: [
              Image.asset(
                category["icon"],
                width: 40,
                height: 40,
                color: Colors.black,
              ),
              const SizedBox(height: 5),
              Text(category["label"], style: const TextStyle(fontSize: 12)),
            ],
          ),
        );
      }).toList(),
    );
  }
}
