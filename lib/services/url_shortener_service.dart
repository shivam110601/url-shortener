import 'dart:convert';
import 'package:http/http.dart' as http;

class UrlShortenerService {
  final String _baseUrl = 'https://sdmd4icpvl.execute-api.ap-south-1.amazonaws.com/prod/shorten';

  Future<String?> shortenUrl(String longUrl) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'long_url': longUrl}),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      return responseBody['short_url'];
    } else {
      // Handle error
      return null;
    }
  }
}
