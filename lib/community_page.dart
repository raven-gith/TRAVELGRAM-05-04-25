import 'package:flutter/material.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final TextEditingController _searchController = TextEditingController();

  /// Contoh data dummy untuk tab "My Community"
  /// Misalnya ini adalah list postingan dari komunitas-komunitas yang sudah kamu ikuti
  final List<Map<String, String>> myCommunityPosts = [
    {
      'communityName': 'Komunitas Segar',
      'author': 'Ayu',
      'content': 'Ada yang mau ikut ke Curug Cikapunrung?',
      'imageUrl': 'assets/komunitas_new.jpg',
    },
    {
      'communityName': 'Komunitas Segar',
      'author': 'Rika',
      'content': 'Kemarin ada ger-geran. MMLUAAACETTT BANGETTT...',
      'imageUrl': 'assets/komunitas_new.jpg',
    },
    {
      'communityName': 'Komunitas Jalan Renang',
      'author': 'Ariel',
      'content': 'Jadi kean Bandung?',
      'imageUrl': 'assets/komunitas_new.jpg',
    },
  ];

  /// Contoh data dummy untuk tab "Explore"
  /// Misalnya ini adalah list komunitas lain yang bisa dicari dan di-join
  final List<Map<String, String>> exploreCommunities = [
    {
      'communityName': 'Komunitas Anti Mager',
      'description':
          'Percaya ga, tadi ada main ke Malioboro ketemu cihkaa looh',
      'imageUrl': 'assets/komunitas2_new.JPG',
    },
    {
      'communityName': 'Komunitas Traveling',
      'description': 'Ayo keliling dunia bareng!',
      'imageUrl': 'assets/komunitas2_new.JPG',
    },
  ];

  /// Variabel untuk menyimpan kata kunci pencarian
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Community'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [Tab(text: 'My Community'), Tab(text: 'Explore')],
          ),
        ),
        body: Column(
          children: [
            /// Search bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search community...',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/search.png',
                      width: 24,
                      height: 24,
                      fit: BoxFit.contain,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                  });
                },
              ),
            ),

            /// Isi tab
            Expanded(
              child: TabBarView(
                children: [_buildMyCommunityTab(), _buildExploreTab()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget untuk menampilkan postingan dari komunitas yang sudah diikuti
  Widget _buildMyCommunityTab() {
    /// Filter postingan berdasarkan [searchQuery]
    final filteredPosts =
        myCommunityPosts.where((post) {
          final communityName = post['communityName']!.toLowerCase();
          final author = post['author']!.toLowerCase();
          final content = post['content']!.toLowerCase();
          return communityName.contains(searchQuery) ||
              author.contains(searchQuery) ||
              content.contains(searchQuery);
        }).toList();

    if (filteredPosts.isEmpty) {
      return const Center(child: Text('No posts found.'));
    }

    return ListView.builder(
      itemCount: filteredPosts.length,
      itemBuilder: (context, index) {
        final post = filteredPosts[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            leading:
                post['imageUrl'] != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        post['imageUrl']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    )
                    : const Icon(Icons.image, size: 50),
            title: Text(post['communityName'] ?? ''),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('by ${post['author']}'),
                const SizedBox(height: 4),
                Text(post['content'] ?? ''),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Widget untuk menampilkan list komunitas lain yang bisa di-join
  Widget _buildExploreTab() {
    /// Filter komunitas berdasarkan [searchQuery]
    final filteredCommunities =
        exploreCommunities.where((community) {
          final communityName = community['communityName']!.toLowerCase();
          final description = community['description']!.toLowerCase();
          return communityName.contains(searchQuery) ||
              description.contains(searchQuery);
        }).toList();

    if (filteredCommunities.isEmpty) {
      return const Center(child: Text('No communities found.'));
    }

    return ListView.builder(
      itemCount: filteredCommunities.length,
      itemBuilder: (context, index) {
        final community = filteredCommunities[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            leading:
                community['imageUrl'] != null
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        community['imageUrl']!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    )
                    : const Icon(Icons.image, size: 50),
            title: Text(community['communityName'] ?? ''),
            subtitle: Text(community['description'] ?? ''),
            trailing: ElevatedButton(
              onPressed: () {
                // TODO: Implementasi "join" community di sini
                // Misalnya panggil API atau update state
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Joined ${community['communityName']}'),
                  ),
                );
              },
              child: const Text('Join'),
            ),
          ),
        );
      },
    );
  }
}
