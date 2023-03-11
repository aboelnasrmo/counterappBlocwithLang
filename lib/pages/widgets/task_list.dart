import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/bloc/tasks_bloc/tasks_bloc.dart';
import '../../model/task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.taskList,
  });

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          var task = taskList[index];
          return ListTile(
              title: Text(task.title),
              trailing: Checkbox(
                onChanged: (value) {
                  context.read<TasksBloc>().add(
                        UpdateTask(task: task),
                      );
                },
                value: task.isDone,
              ),
              onLongPress: () => context.read<TasksBloc>().add(
                    DeleteTask(task: task),
                  ));
        },
        itemCount: taskList.length,
        shrinkWrap: true,
      ),
    );
  }
}
