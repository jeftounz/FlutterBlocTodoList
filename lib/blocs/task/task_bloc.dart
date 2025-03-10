import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc1/models/task_model.dart';
import 'package:flutter_bloc1/repositories/task_repository.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository taskRepository;

  TaskBloc({required this.taskRepository}) : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(TaskEvent event) async* {
    if (event is LoadTasksEvent) {
      yield TaskLoading();
      try {
        final tasks = await taskRepository.getTasks();
        yield TaskLoaded(tasks: tasks);
      } catch (e) {
        yield TaskError(message: e.toString());
      }
    } else if (event is AddTaskEvent) {
      yield TaskLoading();
      try {
        await taskRepository.addTask(event.task);
        final tasks = await taskRepository.getTasks();
        yield TaskLoaded(tasks: tasks);
      } catch (e) {
        yield TaskError(message: e.toString());
      }
    } else if (event is UpdateTaskEvent) {
      yield TaskLoading();
      try {
        await taskRepository.updateTask(event.task);
        final tasks = await taskRepository.getTasks();
        yield TaskLoaded(tasks: tasks);
      } catch (e) {
        yield TaskError(message: e.toString());
      }
    } else if (event is DeleteTaskEvent) {
      yield TaskLoading();
      try {
        await taskRepository.deleteTask(event.taskId);
        final tasks = await taskRepository.getTasks();
        yield TaskLoaded(tasks: tasks);
      } catch (e) {
        yield TaskError(message: e.toString());
      }
    }
  }
}
