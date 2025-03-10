import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc1/blocs/task/task_bloc.dart';
import 'package:flutter_bloc1/widgets/task_item.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is TaskLoaded) {
          return ListView.builder(
            itemCount: state.tasks.length,
            itemBuilder: (context, index) {
              final task = state.tasks[index];
              return TaskItem(task: task);
            },
          );
        } else if (state is TaskError) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('No tasks found'));
        }
      },
    );
  }
}
