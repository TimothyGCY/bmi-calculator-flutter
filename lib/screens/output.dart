import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/panel.dart';
import 'package:bmi_calculator/components/bottomButton.dart';

import 'package:bmi_calculator/constants.dart';

class OutputScreen extends StatelessWidget {
  OutputScreen(
      {@required this.status, @required this.bmi, @required this.comment});

  final String bmi, comment;
  final Text status;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Panel(
              content: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    status,
                    Text(
                      bmi.toString(),
                      style: TextStyle(
                        fontSize: 42.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        comment.toString(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              colour: kDefaultPanel,
            ),
            BottomButton(
              label: 'RE-CALCULATE BMI',
              press: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
