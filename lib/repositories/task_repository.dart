import 'package:flutter_bloc1/models/task_model.dart';
import 'package:flutter_bloc1/services/database_helper.dart';

class TaskRepository {
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<List<Task>> getTasks() async {
    final tasks = await dbHelper.getTasks();
    return tasks.map((task) => Task.fromMap(task)).toList();
  }

  Future<void> addTask(Task task) async {
    await dbHelper.createTask(
      task.title,
      task.description,
      task.categoryId, // categoryId es int
    );
  }

  Future<void> updateTask(Task task) async {
    await dbHelper.updateTask(
      task.id, // id es int
      task.title,
      task.description,
      task.isCompleted ? 1 : 0,
    );
  }

  Future<void> deleteTask(int taskId) async {
    // Cambiar a int
    await dbHelper.deleteTask(taskId);
  }
}
