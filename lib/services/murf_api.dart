import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MurfApi {
  static final String _apiKey = dotenv.env['MURF_API_KEY']!;
  
  static Future<String> generateSpeech(String text) async {
    final url = Uri.parse('https://api.murf.ai/v1/speech/generate');
    final response = await http.post(
      url,
      headers: {
        'api-key' : _apiKey,
        'Content-Type' : 'application/json',
      },
      body: jsonEncode({
        "text": text,
        "voiceId": "en-US-natalie",
        "format": "MP3",
        "modelVersion": "GEN2"
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['audioFile'];
    } else {
      throw Exception("Failed to generate speech: ${response.body}");
    }
  }
}