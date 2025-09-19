import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/todo_model.dart';
import 'package:frontend/services/todo_service.dart';
import 'package:frontend/state/toDO_state.dart';

class TodoNotifier extends StateNotifier<TOdoState> {
  TodoNotifier() : super(TOdoState(todos: [], isLoading: false, error: null));

  Future<void> fetchTodos(String userId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final res = await TodoService.getTodos(userId);
      final todos = (res as List).map((e) => Todo.fromJson(e)).toList();
      state = state.copyWith(isLoading: false, todos: todos);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> addTodo(String task, String description, String userId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final todo = await TodoService.createTodo(task, description, userId);
      state = state.copyWith(todos: [...state.todos, todo], isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
