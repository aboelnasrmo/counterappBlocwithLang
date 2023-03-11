import 'package:app1/business_logic/bloc/tasks_bloc/tasks_bloc.dart';
import 'package:app1/model/task.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:app1/l10n/app_localization.dart';

import 'widgets/add_task_bottom_sheet.dart';
import 'widgets/task_list.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  void _modalBottomSheetMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (builder) {
        return Container(
          height: 350.0,
          color: Colors.transparent, //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: const SingleChildScrollView(
            child: AddTaskBottomSheet(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page".tr(context)),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/settings');
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              List<Task> taskList = state.allTasks;
              return TaskList(taskList: taskList);
            },
          ),
          const SizedBox(height: 20),
          // BlocConsumer<InternetBloc, InternetState>(
          //   listener: (context, state) {
          //     if (state is NotConnectedState) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         SnackBar(
          //           content: Text(state.msg),
          //           backgroundColor: Colors.red,
          //         ),
          //       );
          //     }
          //   },
          //   builder: (context, state) {
          //     if (state is ConnectedState) {
          //       return const SizedBox();
          //     } else if (state is NotConnectedState) {
          //       return Column(
          //         children: [
          //           Text(state.msg),
          //           const SizedBox(
          //             height: 10,
          //           ),
          //           const CircularProgressIndicator(),
          //         ],
          //       );
          //     }
          //     return const SizedBox();
          //   },
          // ),
          // const SizedBox(height: 20),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _modalBottomSheetMenu(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
