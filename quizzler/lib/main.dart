import 'package:flutter/material.dart';
import 'package:quizzler/screens/quiz_page.dart';
import 'package:quizzler/screens/result_page.dart';
import 'package:quizzler/screens/screen0.dart';

void main() => runApp(Quizzo());

class Quizzo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => Screen0(),
        '/first' : (context) => QuizPage(),
        '/second' :  (context) => ResultPage(),
      },
    );
  }
}
