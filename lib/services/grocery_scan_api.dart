import 'dart:convert';
import 'package:http/http.dart' as http;

class GroceryScanApi {
  GroceryScanApi({required this.baseUrl});

  final String baseUrl;

  Future<void> saveScannedText({required String rawText}) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/grocery-scans'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'rawText': rawText}),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to save scan: ${response.body}');
    }
  }
}
