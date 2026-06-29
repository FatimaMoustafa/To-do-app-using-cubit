import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../constants/colors.dart';
import '../cubit/task_cubit.dart';
import '../cubit/task_state.dart';
import '../widgets/add_task_dialog.dart';
import '../widgets/edit_task_dialog.dart';
import '../widgets/task_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Todo App"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<TaskCubit>().clearTasks();
            },
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => const AddTaskDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),

      body: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {

          final pending =
          state.tasks.where((e) => !e.isCompleted).toList();

          final completed =
          state.tasks.where((e) => e.isCompleted).toList();

          if (state.tasks.isEmpty) {
            return const Center(
              child: Text(
                "No Tasks Yet",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "Total Tasks : ${state.tasks.length}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Pending Tasks",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                ...pending.map((task) {

                  final index =
                  state.tasks.indexOf(task);

                  return TaskTile(
                    task: task,
                    index: index,
                    date:
                    DateFormat('dd/MM/yyyy')
                        .format(task.createdAt),
                    onEdit: () {

                      showDialog(
                        context: context,
                        builder: (_) => EditTaskDialog(
                          index: index,
                          title: task.title,
                        ),
                      );

                    },
                  );

                }),

                const SizedBox(height: 30),

                const Text(
                  "Completed Tasks",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                ...completed.map((task) {

                  final index =
                  state.tasks.indexOf(task);

                  return TaskTile(
                    task: task,
                    index: index,
                    date:
                    DateFormat('dd/MM/yyyy')
                        .format(task.createdAt),
                    onEdit: () {

                      showDialog(
                        context: context,
                        builder: (_) => EditTaskDialog(
                          index: index,
                          title: task.title,
                        ),
                      );

                    },
                  );

                }),

              ],
            ),
          );
        },
      ),
    );
  }
}