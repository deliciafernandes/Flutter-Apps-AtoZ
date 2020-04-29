import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onTap;

  BottomButton({
    @required this.text,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: kBottomCardHeight,
        color: kBottomCardColour,
        child: Center(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1,
            )),
      ),
    );
  }
}