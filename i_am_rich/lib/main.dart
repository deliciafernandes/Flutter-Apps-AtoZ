import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("I am rich"),
            backgroundColor: Colors.blueGrey[900],
          ),
          body: Center(
            child: Image(
//            image: NetworkImage('https://cdn.images.express.co.uk/img/dynamic/151/590x/Black-hole-picture-please-time-date-first-image-black-hole-event-horizon-telescope-1112295.jpg?r=1554889792953'),
              image: AssetImage('images/diamond.png'),
              ),
          ),
          backgroundColor: Colors.blueGrey[500],
        ),
    ),
  );
}
