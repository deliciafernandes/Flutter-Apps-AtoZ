import 'package:flutter/material.dart';
import 'package:productivity/models/tasks.dart';
import 'package:productivity/widgets/tasks_lists_tile.dart';

class TasksListView extends StatefulWidget {
  @override
  _TasksListViewState createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  List<Tasks> tasks = [
    Tasks(taskText: 'Buy milk'),
    Tasks(taskText: 'Buy eggs'),
    Tasks(taskText: 'Buy sugar'),
  ]; //List of Task objects

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TasksListTile(
          taskTitle: tasks[0].taskText,
          isChecked: tasks[0].isDone,
        ),
        TasksListTile(
          taskTitle: tasks[1].taskText,
          isChecked: tasks[1].isDone,
        ),
        TasksListTile(
          taskTitle: tasks[2].taskText,
          isChecked: tasks[2].isDone,
        ),
      ],
    );
  }
}
