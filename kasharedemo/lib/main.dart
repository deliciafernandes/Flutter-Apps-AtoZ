import 'package:flutter/material.dart';
import 'package:kasharedemo/credit_card.dart';
import 'homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF123986),
        iconTheme: IconThemeData(
          color: Color(0xFFF6BC44),
        ),
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          headline: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w400,
          ),
          subtitle: TextStyle(
            color: Colors.white,
            fontSize: 35.0,
            fontWeight: FontWeight.w700,
          ),
          body1: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
          ),
          body2: TextStyle(
            color: Color(0x92FFFFFF),
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/first': (context) => CreditCard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

//Colors:
//mandiri #EB4ECA
//CIMB #52CBF9
//card 1 #BC6BF8
//card 2 #EC55B5
//card 3 #1145DB
