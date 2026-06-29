import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/task_model.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState.initial());

  /// Add Task
  void addTask(String title) {
    if (title.trim().isEmpty) return;

    final task = TaskModel(
      title: title,
      createdAt: DateTime.now(),
    );

    final tasks = List<TaskModel>.from(state.tasks);

    tasks.add(task);

    emit(state.copyWith(tasks: tasks));
  }

  /// Delete Task
  void deleteTask(int index) {
    final tasks = List<TaskModel>.from(state.tasks);

    tasks.removeAt(index);

    emit(state.copyWith(tasks: tasks));
  }

  /// Complete Task
  void toggleTask(int index) {
    final tasks = List<TaskModel>.from(state.tasks);

    tasks[index].isCompleted =
    !tasks[index].isCompleted;

    emit(state.copyWith(tasks: tasks));
  }

  /// Edit Task
  void editTask(int index, String title) {
    if (title.trim().isEmpty) return;

    final tasks = List<TaskModel>.from(state.tasks);

    tasks[index].title = title;

    emit(state.copyWith(tasks: tasks));
  }

  /// Clear All Tasks
  void clearTasks() {
    emit(state.copyWith(tasks: []));
  }
}