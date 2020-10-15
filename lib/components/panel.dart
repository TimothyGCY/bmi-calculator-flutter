import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  Panel({@required this.colour, this.content, this.onTap});
  final Color colour;
  final Widget content;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: content,
        ),
      ),
    );
  }
}
