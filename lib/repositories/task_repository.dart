import 'package:flutter_bloc1/models/task_model.dart'; // Asegúrate de que la ruta de importación sea correcta

class TaskRepository {
  // Simulación de una lista de tareas en memoria
  final List<Task> _tasks = [];

  Future<List<Task>> getTasks() async {
    // Simular una operación asíncrona (como una llamada a una API o una consulta a una base de datos)
    await Future.delayed(
      Duration(seconds: 1),
    ); // Simular un retraso de 1 segundo
    return _tasks; // Devuelve la lista de tareas
  }

  Future<void> addTask(Task task) async {
    // Simular una operación asíncrona
    await Future.delayed(Duration(seconds: 1));
    _tasks.add(task); // Añade la tarea a la lista
  }

  Future<void> updateTask(Task task) async {
    // Simular una operación asíncrona
    await Future.delayed(Duration(seconds: 1));
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task; // Actualiza la tarea en la lista
    }
  }

  Future<void> deleteTask(String taskId) async {
    // Simular una operación asíncrona
    await Future.delayed(Duration(seconds: 1));
    _tasks.removeWhere((t) => t.id == taskId); // Elimina la tarea de la lista
  }
}
