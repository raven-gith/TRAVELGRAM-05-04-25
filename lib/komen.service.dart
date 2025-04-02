import 'dart:convert';
import 'package:http/http.dart' as http;

class CommentService {
  final String baseUrl = 'http://10.0.2.2:8000'; // ganti ke IP backend-mu
  final String token;

  CommentService({required this.token});

  Future<List<dynamic>> fetchComments(String postId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/api/posts/$postId/comments'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal ambil komentar');
    }
  }

  Future<void> postComment(String postId, String content) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/posts/$postId/comments'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'content': content}),
    );

    if (response.statusCode != 201) {
      throw Exception('Gagal kirim komentar');
    }
  }
}
