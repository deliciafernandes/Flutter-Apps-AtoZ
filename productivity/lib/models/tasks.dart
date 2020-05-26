class Task {
  final String taskText;
  bool isDone;

  Task({this.taskText, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
