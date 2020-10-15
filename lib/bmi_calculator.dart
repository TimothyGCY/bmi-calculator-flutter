import 'dart:math';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class Calculator {
  Calculator({this.height, this.weight, this.age});

  final int height, weight, age;
  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String idealWeight() {
    return (2.2 * kNormalBMI + (kNormalBMI * 3.5) * (height/100 - 1.5)).toStringAsFixed(1);
  }

  String getComment() {
    if (_bmi > kOverBMI) {
      return 'Your body weight is higher than a normal individual. Highly recommend you to have a proper diet or exercise more regularly. Your ideal weight should be around ${idealWeight()} KG.';
    } else if (_bmi >= kNormalBMI) {
      return 'Wonderful! You have a normal body weight.';
    } else {
      return 'You have a lower body weight than a normal individual. Perhaps you should try to eat more or consult a dietitian. Your ideal weight should be around ${idealWeight()} KG.';
    }
  }

  String getStatus() {
    if (_bmi > 25.0) {
      return 'OVERWEIGHT';
    } else if (_bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }

  }
    Text bmiStatus() {
      return Text(
        getStatus().toString(),
        style: getStatus() == 'NORMAL'
            ? kBMINormal
            : getStatus() == 'OVERWEIGHT'
                ? kBMIOver
                : kBMILower,
      );
    }
}
