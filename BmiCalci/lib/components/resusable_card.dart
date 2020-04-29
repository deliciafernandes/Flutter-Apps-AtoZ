import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function tap;

  ReusableCard({@required this.colour, this.cardChild, this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Error when i write onPress(), note: you're not calling the function onPress, you're just passing it! so no onPress()!!
      onTap: tap,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}