import 'package:flutter_test/flutter_test.dart';
import 'package:movies/core/network/api_client.dart';

void main() {
  test('ApiClient can fetch movies from YTS', () async {
    final apiClient = ApiClient();

    final response = await apiClient.get(
      'list_movies.json',
      queryParameters: {'limit': '1'},
    );

    expect(response, isA<Map<String, dynamic>>());

    final data = response['data'];

    expect(data, isA<Map<String, dynamic>>());
    expect(data['movies'], isNotNull);
  });
}
