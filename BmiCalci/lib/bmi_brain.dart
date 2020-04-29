import 'dart:core';

import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

class BMIbrain{

  final GenderType selectedGender;
  final int humanHeight;
  final int humanWeight;
  final int humanAge;

  BMIbrain({@required this.selectedGender, @required this.humanHeight, @required this.humanWeight, @required this.humanAge});

  double _bmi;

  String calculateBmi() {
    _bmi = (humanWeight) / pow(humanHeight/100, 2);

    // Studies show that the bmi of men is 2.3 kg/m^2 higher than women!
    _bmi = (selectedGender == GenderType.male ? _bmi + 2.3 : _bmi);

    print(_bmi);

    return _bmi.toStringAsFixed(1);
  }

  String getInterpretation(){

      if (_bmi < 18.7){
        return 'UNDERWEIGHT' ;
      }
      else if(_bmi < 26.29){
        return 'NORMAL' ;
      }
      else if(_bmi < 29.69){
        return 'OVERWEIGHT' ;
      }
      else{
        return 'OBESE' ;
      }

  }

  String getRemark(){

      if (_bmi < 18.7){
        return 'A BMI in this range is considered obese, which puts you at the highest risk for diseases and health conditions such as heart disease, stroke, high blood pressure and some cancers.' ;
      }
      else if(_bmi < 26.29){
        return 'A BMI in this range is considered a healthy weight, which means your risk of weight-related conditions like type 2 diabetes, heart disease and high blood pressure is generally lower.' ;
      }
      else if(_bmi < 29.69){
        return 'A BMI in this range is considered overweight, which means your risk for health conditions, such as type 2 diabetes, heart disease and high blood pressure, increases.' ;
      }
      else{
        return 'A BMI in this range is considered obese, which puts you at the highest risk for diseases and health conditions such as heart disease, stroke, high blood pressure and some cancers.' ;
      }

  }
}