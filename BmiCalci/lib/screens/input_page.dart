import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../constants.dart';
import '../components/gender_column.dart';
import '../components/resusable_card.dart';
import '../components/reusable_column.dart';

enum GenderType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectedGender;

  // can't be constant because it'll change frequently by the user!
  int humanHeight = 180;
  int humanWeight = 60;
  int humanAge = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'BMI CALCULATOR',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    tap: () {
                      setState(() {
                        selectedGender = GenderType.male;
                      });
                    },
                    colour: (selectedGender == GenderType.male
                        ? kMaleCardColour
                        : kCardColour),
                    cardChild: GenderColumn(
                        symbol: FontAwesomeIcons.mars, gender: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    tap: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    colour: (selectedGender == GenderType.female
                        ? kFemaleCardColour
                        : kCardColour),
                    cardChild: GenderColumn(
                      symbol: FontAwesomeIcons.venus,
                      gender: 'FEMALE',
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                colour: kCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReusableColumn(
                      measurement: 'HEIGHT',
                      humanDimension: humanHeight,
                      unit: 'cm',
                      columnChild: Container(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: kSliderInactiveTrackColour,
                            activeTrackColor: kSliderActiveTrackColour,
                            thumbColor: kSliderBallColour,
                            overlayColor: kSliderBallOverlayColour,
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: humanHeight.toDouble(),
                            min: kMinSlideValue,
                            max: kMaxSlideValue,
                            onChanged: (newValue) {
                              setState(() {
                                humanHeight = newValue.round();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      colour: kCardColour,
                      cardChild: ReusableColumn(
                        measurement: 'WEIGHT',
                        humanDimension: humanWeight,
                        unit: 'kg',
                        columnChild: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  humanWeight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  humanWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: ReusableCard(
                    colour: kCardColour,
                    cardChild: ReusableColumn(
                      measurement: 'AGE',
                      humanDimension: humanAge,
                      columnChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                humanAge--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                humanAge++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ),
            BottomButton(text: 'CALCULATE', onTap: () {

              BMIbrain calc = BMIbrain(selectedGender: selectedGender, humanHeight: humanHeight, humanWeight: humanWeight, humanAge: humanAge);

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultsPage(
                  bmi: calc.calculateBmi(),
                  interpretation: calc.getInterpretation(),
                  remark: calc.getRemark(),
                )),
              );
            },),
          ],
        ));
  }
}
