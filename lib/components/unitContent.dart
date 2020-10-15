import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/roundButton.dart';

class UnitContent extends StatelessWidget {
  const UnitContent(
      {this.label, this.value, this.inc, this.dec, this.longDec, this.longInc, this.endLongDec, this.endLongInc});

  final String label;
  final int value;
  final Function dec, longDec, endLongDec, inc, longInc, endLongInc;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: kLabelTextStyle),
        Text(value.toString(), style: kNumberTextStyle),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundButtton(
                press: dec, longPress: longDec, endLongPress: endLongDec, ico: FontAwesomeIcons.minus),
            // SizedBox(width: 16.0),
            RoundButtton(
                press: inc, longPress: longInc, endLongPress: endLongInc, ico: FontAwesomeIcons.plus),
          ],
        ),
      ],
    );
  }
}
