import 'package:flutter/material.dart';

class TasksListTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkBoxCallBack;
  final Function deleteTaskCallBack;

  TasksListTile(
      {this.isChecked,
      this.taskTitle,
      this.checkBoxCallBack,
      this.deleteTaskCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteTaskCallBack,
      contentPadding: EdgeInsets.all(0.0),
      leading: Checkbox(
        activeColor: Color(0xFF673AB7),
        value: isChecked,
        onChanged: checkBoxCallBack,
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
