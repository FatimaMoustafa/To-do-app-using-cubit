import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/task_cubit.dart';

class EditTaskDialog extends StatefulWidget {
  final int index;
  final String title;

  const EditTaskDialog({
    super.key,
    required this.index,
    required this.title,
  });

  @override
  State<EditTaskDialog> createState() => _EditTaskDialogState();
}

class _EditTaskDialogState extends State<EditTaskDialog> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.title);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void updateTask() {
    context.read<TaskCubit>().editTask(
      widget.index,
      controller.text,
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Task"),

      content: TextField(
        controller: controller,
        autofocus: true,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        onSubmitted: (_) => updateTask(),
      ),

      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: updateTask,
          child: const Text("Update"),
        ),
      ],
    );
  }
}