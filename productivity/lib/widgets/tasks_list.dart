import 'package:flutter/material.dart';
import 'package:productivity/models/task_data.dart';
import 'package:productivity/widgets/tasks_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap:
              true, //shrinkWrap: true, the ListView only occupies the space it needs (it will still scroll when there more items) as in the If you do not set the shrinkWrap property, your ListView will be as big as its parent. If you set it to true, the list will wrap its content and be as big as it children allows it to be.

          itemBuilder: (context, index) {
            final work = taskData.tasks[index];
            return TasksListTile(
              taskTitle: work.taskText,
              isChecked: work.isDone,
              checkBoxCallBack: (bool checkStateBox) {
                taskData.updateTask(work);
              },
              deleteTaskCallBack: () {
                taskData.deleteTask(work);
              },
            );
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}
