import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/notifier/todo_notifier.dart';
import 'package:frontend/state/toDO_state.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, TOdoState>((ref) {
  return TodoNotifier();
});
