import 'package:flutter/material.dart';
import 'package:productivity/models/task_data.dart';
import 'package:productivity/widgets/bottom_tasks_sheet.dart';
import 'package:productivity/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF512DA8),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    color: Color(0xFF673AB7),
                    size: 30.0,
                  ),
                  backgroundColor: Color(0xFFffffff),
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'To do',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 70.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                children: <Widget>[
                  TasksList(),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO : Add new task bottom sheet
          showModalBottomSheet(
            context: context,
            builder: (context) =>
                BottomTaskSheet(taskTitleCallBack: (newTaskText) {
              setState(() {
                Provider.of<TaskData>(context, listen: false)
                    .addTasks(newTaskText);
              });
            }), //TODO 1: All that this callback does is pass a function, that's all! Nothing else, it just passes this code block and does nothing. (Understanding Callbacks!)
          );
        },
        backgroundColor: Color(0xFF673AB7),
        child: Icon(Icons.add),
      ),
    );
  }
}
