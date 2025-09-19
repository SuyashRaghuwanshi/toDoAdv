class Todo {
  final String id;
  final String task;
  final String description;
  final bool isCompleted;
  final String user;

  Todo({
    required this.id,
    required this.task,
    required this.isCompleted,
    required this.description,
    required this.user,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['_id'],
      task: json['task'],
      description: json['description'],
      isCompleted: json['completed'],
      user: json['user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "task": task,
      "description": description,
      "completed": isCompleted,
      "user": user,
    };
  }
}
