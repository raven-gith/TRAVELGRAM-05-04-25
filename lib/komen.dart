import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'komen.service.dart';

class CommentPage extends StatefulWidget {
  final String postId;

  const CommentPage({super.key, required this.postId});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  late CommentService _commentService;
  List<dynamic> _comments = [];
  final TextEditingController _controller = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _setup();
  }

  Future<void> _setup() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    _commentService = CommentService(token: token);
    await _loadComments();
  }

Future<void> _loadComments() async {
  await Future.delayed(const Duration(seconds: 1)); // simulasi loading
  setState(() {
    _comments = [
      {"user": {"name": "Rizky"}, "content": "Keren banget tempatnya!"},
      {"user": {"name": "Rizka"}, "content": "Pengen ke sini juga 😍"},
    ];
    isLoading = false;
  });
}

Future<void> _submitComment() async {
  final content = _controller.text.trim();
  if (content.isNotEmpty) {
    setState(() {
      _comments.insert(0, {
        "user": {"name": "Kamu"},
        "content": content,
      });
      _controller.clear();
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    leading: IconButton(
    icon: Image.asset(
      'assets/icon_2.png',
      width: 24,
      height: 24,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  ),
  title: const Text('Komentar'),
),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _comments.length,
                    itemBuilder: (context, index) {
                      final comment = _comments[index];
                      return ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(comment['user']['name'] ?? 'Anonim'),
                        subtitle: Text(comment['content']),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Tulis komentar...',
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: _submitComment,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
