import 'dart:convert';
import 'package:frontend/models/todo_model.dart';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class TodoService {
  static Future<Todo> getTodos(String userid) async {
    final res = await http.get(
      Uri.parse("${ApiConfig.baseUrl}todo/get/$userid"),
    );
    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception("Failed to fetch todos");
    }
  }

  static Future<Todo> createTodo(
    String task,
    String description,
    String userId,
  ) async {
    final res = await http.post(
      Uri.parse("${ApiConfig.baseUrl}todo/create"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "task": task,
        "description": description,
        "user": userId,
      }),
    );
    final data = jsonDecode(res.body);
    return Todo.fromJson(data["todo"]);
  }
}
