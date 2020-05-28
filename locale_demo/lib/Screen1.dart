import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
//import 'package:googleapis/translate.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  GoogleTranslator translator = GoogleTranslator();

  //Country language codes needed!

  String text = 'Hi, how are you!';
  String og = 'Hi, how are you!';

  void translate() {
    //Providing the source text to the translated object
    // to: country code
    // value is the translated text
    try {
      translator.translate(text, to: 'es').then((value) {
        setState(() {
          text = value;
        });
      });
    } catch (e) {
      setState(() {
        text = 'Error';
      });
      print('Error $e');
    }
  }

  @override
  void initState() {
    super.initState();
    translate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Localization Demo'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Text('$og'), //og text
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50.0),
              child: Text('$text'), //result
            ),
          ],
        ),
      ),
    );
  }
}

//Locale("en", "US"),
//Locale("bn", "IN"),
//Locale("gu", "IN"),
//Locale("hi", "IN"),
//Locale("kn", "IN"),
//Locale("ml", "IN"),
//Locale("mr", "IN"),
//Locale("pa", "IN"),
//Locale("ta", "IN"),
//Locale("te", "IN"),
//Locale("ur", "IN")
