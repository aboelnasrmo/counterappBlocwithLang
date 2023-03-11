import 'package:flutter/material.dart';

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
              onChanged: (value) {},
              value: task.isDone,
            ),
          );
        },
        itemCount: taskList.length,
        shrinkWrap: true,
      ),
    );
  }
}
