import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class RoundButtton extends StatelessWidget {
  const RoundButtton({
    this.press,
    this.longPress,
    this.endLongPress,
    this.ico,
  });

  final Function press, longPress, endLongPress;
  final IconData ico;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // adapted from floating action button
        onTap: press,
        onLongPress: longPress,
        onLongPressEnd: endLongPress,
        // fillColor: kCircularBtn,
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        // constraints: kBoxConstraint,
        // elevation: 12.0,
        child: Container(
          height: 56.0,
          width: 56.0,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12.0),
            color: kCircularBtn,
          ),
          child: Icon(ico),
        ));
  }
}
