import 'package:frontend/models/todo_model.dart';

class TOdoState {
  final List<Todo> todos;
  final bool isLoading;
  final String? error;

  TOdoState({
    required this.todos,
    required this.isLoading,
    required this.error,
  });

  TOdoState copyWith({List<Todo>? todos, bool? isLoading, String? error}) {
    return TOdoState(
      todos: todos ?? this.todos,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
