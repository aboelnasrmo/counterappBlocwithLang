import 'package:app1/l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/bloc/tasks_bloc/tasks_bloc.dart';
import '../../model/task.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Add Task'.tr(context),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              controller: titleController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text('Task Title'.tr(context)),
                hintText: 'Task Title'.tr(context),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              controller: descController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Text('Task Desc'.tr(context)),
                hintText: 'Task Desc'.tr(context),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'.tr(context))),
                ElevatedButton(
                    onPressed: () {
                      var task = Task(
                        title: titleController.text,
                      );
                      context.read<TasksBloc>().add(AddTask(task: task));
                      Navigator.pop(context);
                    },
                    child: Text('Add'.tr(context))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
