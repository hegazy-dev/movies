import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  static const String baseUrl = 'https://movies-api.accel.li/api/v2/';

  final http.Client _client;

  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  Future<dynamic> get(
    String endpoint, {
    Map<String, String>? queryParameters,
  }) async {
    final uri = Uri.parse(
      '$baseUrl$endpoint',
    ).replace(queryParameters: queryParameters);

    final response = await _client.get(uri);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    }

    throw Exception('HTTP Error: ${response.statusCode}');
  }
}
