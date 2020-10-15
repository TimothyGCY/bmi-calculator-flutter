import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.press, this.label});

  final Function press;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 60.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kAccentColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: FlatButton(
        onPressed: press,
        child: Text(
          label,
          style: kLabelTextStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}