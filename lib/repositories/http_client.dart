import 'dart:convert';

import 'package:http/http.dart' as client;

import '../config/app_api.dart';

class HttpClient {
  const HttpClient();

  Uri _url(String path, Map<String, String> queries) =>
      Uri.http(AppApi.baseUrl, path, queries);

  Future<Map<String, dynamic>> post({
    required String endpoint,
    String? body,
    Map<String, String> headers = const {},
    Map<String, String> queries = const {},
  }) async {
    print(endpoint);
    final response = await client.post(
      _url(endpoint, queries),
      headers: {'Content-Type': 'application/json', ...headers},
      body: body,
    );
    print(headers);
    print(queries);
    print(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body)['data'] as Map<String, dynamic>;
      case 204:
        return {};
      case 401:
      case 422:
        throw json.decode(response.body)['errors'] as Map<String, dynamic>;
      default:
        throw UnimplementedError();
    }
  }

  Future<Map<String, dynamic>> get({
    required String endpoint,
    Map<String, String> headers = const {},
    Map<String, String> queries = const {},
  }) async {
    print(endpoint);
    final response = await client.get(
      _url(endpoint, queries),
      headers: {'Content-Type': 'application/json', ...headers},
    );
    print(headers);
    print(queries);
    print(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        return json.decode(response.body)['data'] as Map<String, dynamic>;
      case 204:
        return {};
      case 401:
      case 422:
        throw json.decode(response.body)['errors'] as Map<String, dynamic>;
      default:
        throw UnimplementedError();
    }
  }
}
