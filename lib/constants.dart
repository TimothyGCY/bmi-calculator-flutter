import 'package:flutter/material.dart';

const kDefaultPanel = Color(0x22FFFFFF),
    kActivePanel = Color(0x10FFFFFF),
    kAccentColor = Color(0xFFEB1555),
    kCircularBtn = Color(0xFF4C4F5E);

const kMinHeight = 30.0,
    kMaxHeight = 250.0,
    kMinWeight = 25,
    kMaxWeight = 250,
    kMinAge = 3,
    kMaxAge = 150;

const kNormalBMI = 18.5, kOverBMI = 25.0;

const kLabelTextStyle = TextStyle(
      fontSize: 18.0,
      color: Color(0xFF8D8E98),
    ),
    kNumberTextStyle = TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.w900,
    );

const kBoxConstraint = BoxConstraints.tightFor(
  width: 56.0,
  height: 56.0,
);

const kBMINormal = TextStyle(color: Colors.green, fontWeight: FontWeight.bold);
const kBMIOver = TextStyle(color: Colors.red, fontWeight: FontWeight.bold);
const kBMILower = TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold);
