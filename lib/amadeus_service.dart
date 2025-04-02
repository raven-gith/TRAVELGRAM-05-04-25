import 'dart:convert';
import 'package:http/http.dart' as http;

class AmadeusService {
  final String clientId = 'LklBjkyLhAhF9TXxzjEWUgfpzmzGdfLy';
  final String clientSecret = 'PzAX3nhADkwCqB7E';
  

  Future<String> getAccessToken() async {
    final response = await http.post(
      Uri.parse('https://test.api.amadeus.com/v1/security/oauth2/token'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'grant_type': 'client_credentials',
        'client_id': clientId,
        'client_secret': clientSecret,
      },
    );
    print("Token response status: ${response.statusCode}");
    print("Token response body: ${response.body}");
    
    final data = jsonDecode(response.body);
    return data['access_token'];
  }

  Future<List<dynamic>> searchFlights({
  String origin = 'CGK',
  String destination = 'DPS',
  String? date,
}) async {
  final token = await getAccessToken();

  final departureDate = date ?? DateTime.now().add(Duration(days: 1)).toIso8601String().substring(0, 10);

  final url =
      'https://test.api.amadeus.com/v2/shopping/flight-offers?originLocationCode=$origin&destinationLocationCode=$destination&departureDate=$departureDate&adults=1&nonStop=true&max=5';

  print("GET URL: $url");

  final response = await http.get(
    Uri.parse(url),
    headers: {
      'Authorization': 'Bearer $token',
    },
  );

  print("Flight response status: ${response.statusCode}");
  print("Flight response body: ${response.body}");

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['data'];
  } else {
    throw Exception('Gagal mengambil data penerbangan');
  }
}
}
