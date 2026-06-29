import '../models/task_model.dart';

class TaskState {
  final List<TaskModel> tasks;

  const TaskState({
    required this.tasks,
  });

  factory TaskState.initial() {
    return const TaskState(tasks: []);
  }

  TaskState copyWith({
    List<TaskModel>? tasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
    );
  }
}