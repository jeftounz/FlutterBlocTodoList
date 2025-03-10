import 'package:flutter/material.dart';
import 'package:flutter_bloc1/models/task_model.dart';

class TaskItem extends StatelessWidget {
  final Task task;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.description),
      trailing: Checkbox(
        value: task.isCompleted,
        onChanged: (value) {
          // Lógica para marcar la tarea como completada
        },
      ),
      onTap: () {
        // Navegar a la pantalla de edición de tarea
      },
    );
  }
}
