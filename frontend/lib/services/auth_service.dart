import 'dart:convert'; //for jsonEncode and decode

import 'package:frontend/models/loginResponse_model.dart';
import 'package:http/http.dart' as http; // for making http request

import 'api_config.dart';

class AuthService {
  static Future<LoginResponse> login(String email, String password) async {
    final res = await http.post(
      Uri.parse("${ApiConfig.baseUrl}auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    if (res.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(res.body));
    } else {
      throw Exception("Login failed");
    }
  }

  static Future<Map<String, dynamic>> register(
    String name,
    String password,
    String email,
  ) async {
    final res = await http.post(
      Uri.parse("${ApiConfig.baseUrl}auth/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "password": password}),
    );
    return jsonDecode(res.body);
  }
}
