import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kUrl = 'https://avatars.githubusercontent.com/u/53268119?v=4';

void main() => runApp(MyApp());

class DelsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(kUrl),
              ),
              Text(
                'Delicia Fernandes',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                ),
              ),
              Text(
                'DEVELOPER',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  fontFamily: 'Playfair',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple[100],
        body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(kUrl),
                  // backgroundImage: AssetImage("images/del.jpg"),
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
                // Container(
                //   width: 150.0,
                //   padding: EdgeInsets.symmetric(vertical: 15.0),
                //   child: Divider(color: Colors.purple),
                // ),
                ReusableCardWidget(
                  icon: Icons.phone,
                  text: '+91 123 456 789',
                  textSize: 20.0,
                ),
                ReusableCardWidget(
                  icon: Icons.email,
                  text: 'fernandesdelicia07@student.sfit.ac.in',
                  textSize: 15.0,
                ),
              ]),
        ),
      ),
    );
  }
}

class ReusableCardWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final double textSize;

  ReusableCardWidget(
      {@required this.icon, @required this.text, @required this.textSize});

  @override
  Widget build(BuildContext context) {
    return Card(
      //cards by default are white
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
          size: 20.0,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
