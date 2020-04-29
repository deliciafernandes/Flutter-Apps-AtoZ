import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableColumn extends StatelessWidget {
  final String measurement;
  final int humanDimension;
  final String unit;

  final Widget columnChild;

  ReusableColumn(
      {this.measurement, this.humanDimension, this.unit, this.columnChild});

  bool textShouldBeVisible() {
    // unit = null only in Age, thus text shouldn't be visible
    return (unit == null ? false : true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$measurement',
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.ideographic,
          children: [
            Text(
              '$humanDimension',
              style: kNumberTextStyle,
            ),
            Visibility(
              visible: textShouldBeVisible(),
              child: Text(
                '$unit',
                style: kLabelTextStyle,
              ),
            ),
          ],
        ),
        Container(
          child: columnChild,
        )
      ],
    );
  }
}

