import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {

//  int answer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
          '~ quizzo ~',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[800],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                child: Text(
                  'Your Result:',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 35.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '7/10',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 120.0,
                  color: Colors.lightBlueAccent,
                ),
              ),
              Text(
                'Great!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 35.0,
                  color: Colors.greenAccent,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: FlatButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  color: Colors.pinkAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Retake',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
