import 'package:flutter/material.dart';

class TasksListTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;

  TasksListTile({this.isChecked, this.taskTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      leading: Checkbox(
        activeColor: Color(0xFF673AB7),
        value: isChecked,
//        onChanged: ,
      ),
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
