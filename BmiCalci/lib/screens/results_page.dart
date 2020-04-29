import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/resusable_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultsPage extends StatelessWidget {

  final String bmi;
  final String interpretation;
  final String remark;

  ResultsPage({@required this.bmi, @required this.interpretation, @required this.remark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: Theme
              .of(context)
              .textTheme
              .headline6,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Your Result',
              style: kResultPageTextStyle,
            ),
          ),
          Expanded(
            flex: 5,

            child: ReusableCard(
              colour: kCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '$interpretation',
                    style: kInterpretationTextStyle,
                  ),
                  Text(
                    '$bmi',
                    style: kBMInumberTextStyle,
                  ),
                  Text(
                    '$remark',

                    //  IMPORTANT!
                    textAlign: TextAlign.center,

                    style: kBMIremarkTextStyle,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            text: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
