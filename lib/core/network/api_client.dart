import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:movies/core/errors/network_exception.dart';
import 'package:movies/core/errors/server_exception.dart';

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

    try {
      final response = await _client.get(uri);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return jsonDecode(response.body);
      }

      throw ServerException(response.statusCode);
    } on SocketException {
      throw NetworkException('No internet connection');
    } on http.ClientException {
      throw NetworkException('Network request failed');
    }
  }
}
