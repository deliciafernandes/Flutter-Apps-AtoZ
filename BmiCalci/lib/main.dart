import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          textTheme: TextTheme(
            bodyText1: TextStyle(
              fontFamily: 'BalooBhaina',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[900],
            ),
          )),
      home: InputPage(),
    );
  }
}
