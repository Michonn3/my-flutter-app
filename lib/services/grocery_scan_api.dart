import 'dart:convert';
import 'package:http/http.dart' as http;

/*
  Responsible for talking to Express backend.
  This service does NOT know anything about OCR.
  It only sends data over HTTP.
*/
class GroceryScanApi {
  GroceryScanApi({required this.baseUrl});

  // Location of Express server
  final String baseUrl;

  Future<void> saveScannedText({required String rawText}) async {
    // Send OCR results to backend
    final response = await http.post(
      Uri.parse('$baseUrl/api/grocery-scans'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'rawText': rawText}),
    );

    // Fail if backend rejected request
    if (response.statusCode != 201) {
      throw Exception('Failed to save scan: ${response.body}');
    }
  }
}
