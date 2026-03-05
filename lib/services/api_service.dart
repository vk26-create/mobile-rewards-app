import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://api.example.com';

  Future<dynamic> authenticate(String username, String password) async {
    final response = await http.post(
      Uri.parse('\$baseUrl/auth'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}),
    );
    return _handleResponse(response);
  }

  Future<dynamic> fetchUserProfile(String token) async {
    final response = await http.get(
      Uri.parse('\$baseUrl/user/profile'),
      headers: {'Authorization': 'Bearer \$token'},
    );
    return _handleResponse(response);
  }

  Future<dynamic> fetchTasks(String token) async {
    final response = await http.get(
      Uri.parse('\$baseUrl/tasks'),
      headers: {'Authorization': 'Bearer \$token'},
    );
    return _handleResponse(response);
  }

  Future<dynamic> fetchRewards(String token) async {
    final response = await http.get(
      Uri.parse('\$baseUrl/rewards'),
      headers: {'Authorization': 'Bearer \$token'},
    );
    return _handleResponse(response);
  }

  Future<dynamic> fetchBalance(String token) async {
    final response = await http.get(
      Uri.parse('\$baseUrl/balance'),
      headers: {'Authorization': 'Bearer \$token'},
    );
    return _handleResponse(response);
  }

  Future<dynamic> fetchLeaderboard(String token) async {
    final response = await http.get(
      Uri.parse('\$baseUrl/leaderboard'),
      headers: {'Authorization': 'Bearer \$token'},
    );
    return _handleResponse(response);
  }

  Future<dynamic> withdraw(String token, double amount) async {
    final response = await http.post(
      Uri.parse('\$baseUrl/withdraw'),
      headers: {'Authorization': 'Bearer \$token', 'Content-Type': 'application/json'},
      body: json.encode({'amount': amount}),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(response.body);
      case 400:
      case 401:
      case 403:
      case 404:
      case 500:
        throw Exception('Failed with status code: \${response.statusCode}');
      default:
        throw Exception('Unexpected error: \${response.statusCode}');
    }
  }
}
