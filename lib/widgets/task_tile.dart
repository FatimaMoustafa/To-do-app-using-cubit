import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/colors.dart';
import '../cubit/task_cubit.dart';
import '../models/task_model.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;
  final int index;
  final String date;
  final VoidCallback onEdit;

  const TaskTile({
    super.key,
    required this.task,
    required this.index,
    required this.date,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          activeColor: AppColors.completed,
          onChanged: (_) {
            context.read<TaskCubit>().toggleTask(index);
          },
        ),

        title: Text(
          task.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : null,
          ),
        ),

        subtitle: Text("Created: $date"),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: onEdit,
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                context.read<TaskCubit>().deleteTask(index);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}