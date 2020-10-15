import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 56.0,
          ),
          SizedBox(height: 25.0),
          Text(
            label.toUpperCase(),
            style: kLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
