void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Data = await task2();
  task3(task2Data);
}

void task1() {
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
//  sleep(threeSeconds);

  String result;

  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  return result;
}

void task3(task2Data) {
  print('Task 3 complete with $task2Data');
}

//void getLocation() async {
//
//    Complex syntax :
//    Position position = Position();
//    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//
//    Simpler syntax:
//    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//    print(position);
//
//}
