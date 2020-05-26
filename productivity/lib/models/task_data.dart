//Class that is going to be provided throughout the tree.

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:productivity/models/tasks.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(taskText: 'Buy milk'),
    Task(taskText: 'Meditate for 10 mins'),
    Task(taskText: 'Buy eggs'),
    Task(taskText: 'Workout by 9pm'),
    Task(taskText: 'Buy bread'),
    Task(taskText: 'Check the news'),
    Task(taskText: 'Clear book shelf'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount => _tasks.length;

  void addTasks(String newTaskText) {
    final task = Task(taskText: newTaskText);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
