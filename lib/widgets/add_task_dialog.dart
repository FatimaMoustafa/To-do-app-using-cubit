import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/task_cubit.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({super.key});

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void addTask() {
    context.read<TaskCubit>().addTask(controller.text);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Task"),

      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: "Enter task title",
          border: OutlineInputBorder(),
        ),
        onSubmitted: (_) => addTask(),
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: addTask,
          child: const Text("Save"),
        ),
      ],
    );
  }
}