import 'dart:convert';
import 'api_config.dart';
import 'package:http/http.dart' as http;

class UserService {
  static Future<Map<String, dynamic>> getUser(String userId) async {
    var res = await http.get(Uri.parse("${ApiConfig.baseUrl}todo/get/$userId"));
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception("Failed to fetch user");
    }
  }
}
