import 'dart:math';

import 'package:bmi_calculator/screens/list_checker.dart';

class CalculatorBrain {
  CalculatorBrain(
      {this.height,
      this.weight,
      this.oxygenlevel,
      this.heartbeat,
      this.age,
      this.cardio_,
      this.respiratory_,
      this.hyper_,
      this.immune_});

  final int height;
  final int weight;
  final int oxygenlevel;
  final int heartbeat;
  final int age;
  final int cardio_;
  final int respiratory_;
  final int hyper_;
  final int immune_;
  double _bmi;
  double totalrisk = 0;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  int ageof() {
    return age;
  }

  String calculatehealth() {
    if (cardio_ == 1) totalrisk++;
    if (respiratory_ == 1) totalrisk++;
    if (hyper_ == 1) totalrisk++;
    if (immune_ == 1) totalrisk++;
    if (age > 60)
      totalrisk++;
    else if (age >= 50 && age < 60) {
      totalrisk += 0.5;
    } else if (age >= 40 && age < 50) {
      totalrisk += 0.2;
    } else
      totalrisk += 0;

    return (totalrisk * 100).toStringAsFixed(0);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  String getInterpretation2() {
    if (oxygenlevel >= 100) {
      return 'There might  be some error in the oxygen level of the app.';
    } else if (oxygenlevel >= 95 && oxygenlevel < 100) {
      return 'Your oxygen level is normal.Maintain the level above 94.Keep doing breathing exercise daily.';
    } else if (oxygenlevel >= 92 && oxygenlevel < 95) {
      return 'Your oxygen level is deviant.You should go for a check up or apply the proning exercise as suggested by the GOI';
    } else if (oxygenlevel >= 80 && oxygenlevel < 92) {
      return 'Your oxygen level is lower than average.You are at a risk.Please contact the hospital.';
    } else if (oxygenlevel >= 65 && oxygenlevel < 80) {
      return 'Your oxygen level is very low.You are at a high risk.';
    } else {
      return 'There might  be some error in the oxygen level of the app.';
    }
  }

  String getInterpretation3() {
    if (age <= 10 && heartbeat < 70 || heartbeat > 110) {
      return 'Your heartbeat is not normal.The average hearbeat rate of this age group is 70-110 bpm.Please visit nearest hospital.';
    } else if (age > 10 && age <= 14 && heartbeat < 60 || heartbeat > 105) {
      return 'Your heartbeat is not normal.The average hearbeat rate of this age group is 60-105 bpm.Please visit nearest hospital.';
    } else if (age >= 15 && heartbeat < 60 || heartbeat > 100) {
      return 'Your heartbeat is not normal.The average hearbeat rate of this age group is 60-100 bpm.Please visit nearest hospital.';
    } else {
      return 'Your heartbeat is perfect.Maintain your health just like this.';
    }
  }

  String cardiodisease() {
    if (cardio_ == 1) {
      return 'As you have heart related disease,please stay at home';
    } else
      return 'You are free from heart related diseases.';
  }

  String respiratorydisease() {
    if (respiratory_ == 1) {
      return 'You have a respiratory disease.So,Please maintain regular exercise and take care of your health.';
    } else
      return 'You are free from respiratory diseases.';
  }

  String hypertension() {
    if (hyper_ == 1) {
      return 'You are dealing with hypertension.Try to be in a healthy environment.';
    } else
      return 'You are free from hypertension.';
  }

  String immunedisease() {
    if (immune_ == 1) {
      return 'Your immune system is very weak.Try to exercise daily,eat healthy food and take a regular sleep.';
    } else
      return 'You are free from Immune related diseases.';
  }
}
