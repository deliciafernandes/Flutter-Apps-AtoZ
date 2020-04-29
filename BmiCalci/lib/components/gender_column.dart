import 'package:flutter/material.dart';

import '../constants.dart';


class GenderColumn extends StatelessWidget {
  final IconData symbol;
  final String gender;

  GenderColumn({@required this.symbol, @required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          symbol,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          gender,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
