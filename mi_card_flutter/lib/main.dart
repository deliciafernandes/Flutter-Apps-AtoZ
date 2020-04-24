import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[100],
        body: SafeArea(
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Container(
//                color: Colors.red,
//                height: double.infinity,
//                width: 100,
//              ),
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Container(
//                    //Single child widget
//                    color: Colors.yellow,
//                    height: 100,
//                    width: 100,
//                  ),
//                  Container(
//                    //Single child widget
//                    color: Colors.green,
//                    height: 100,
//                    width: 100,
//                  ),
//                ],
//              ),
//              Container(
//                //Single child widget
//                color: Colors.blue,
//                height: double.infinity,
//                width: 100,
//              )
//            ],
//          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("images/del.jpg"),
              radius: 70,
            ),
            Text(
              "Delicia Fernandes",
              style: TextStyle(
                fontSize: 40,
                fontFamily: "Pacifico",
                color: Colors.black,
              ),
            ),
            Text(
              "Software Developer",
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                fontFamily: "Playfair",
                color: Colors.deepPurple[900],
              ),
            ),
            SizedBox(
              width: 150.0,
              height: 30.0,
              child: Divider(
                color: Colors.purple,
              ),
            ),
            Card(
              //cards by default are white
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.black,
                  size: 20.0,
                ),
                title: Text(
                  "+91 123 456 789",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.black,
                  size: 20.0,
                ),
                title: Text(
                  "fernandesdelicia07@student.sfit.ac.in",
                  style: TextStyle(
                    fontSize: 15.2,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
