import 'package:flutter/material.dart';

class BottomTaskSheet extends StatefulWidget {
  final Function taskTitleCallBack;
  BottomTaskSheet(
      {@required
          this.taskTitleCallBack}); //TODO 2: Once the constructor is initialised, the function passed just comes and sits in the class memory.

  @override
  _BottomTaskSheetState createState() => _BottomTaskSheetState();
}

class _BottomTaskSheetState extends State<BottomTaskSheet> {
  final taskTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String taskText;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF673AB7),
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            TextField(
              controller: taskTextController,
              cursorColor: Color(0xFF673AB7),
              autocorrect: true,
              autofocus:
                  true, //To automatically enable the textfield and show keyboard
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF512DA8),
                  ),
                ),
              ),
              onChanged: (value) {
                taskText = value;
              },
            ),
            SizedBox(
              height: 30.0,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonMinWidth: 160.0,
              children: <Widget>[
                RaisedButton(
                  color: Color(0xFF673AB7),
                  onPressed: () {
                    //TODO : Add task code
                    widget.taskTitleCallBack(
                        taskText); //TODO 3: Here the function taskTitleCallBack is called and taskText is passed, Now it is performed!
                    taskTextController.clear();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                RaisedButton(
                  color: Color(0xFF673AB7),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Color(0xffD1C4E9)
//#673AB7
