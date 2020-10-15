import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/bmi_calculator.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/panel.dart';
import 'package:bmi_calculator/components/iconContent.dart';
import 'package:bmi_calculator/components/unitContent.dart';
import 'package:bmi_calculator/components/bottomButton.dart';
import 'package:bmi_calculator/screens/output.dart';

enum Gender {
  female,
  male,
}

enum Operation {
  add,
  substract,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = (kMinHeight + kMaxHeight) ~/ 2;
  int weight = kMinWeight;
  int age = kMinAge;
  bool isPress = false;

  void updateWeight(Operation operation) async {
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      if (operation == Operation.add) {
        if (weight < kMaxWeight) weight++;
      } else {
        if (weight > kMinWeight) weight--;
      }
    });
    if (isPress) updateWeight(operation);
  }

  void updateAge(Operation operation) async {
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      if (operation == Operation.add) {
        if (age < kMaxAge) age++;
      } else {
        if (age > kMinAge) age--;
      }
    });
    if (isPress) updateAge(operation);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Panel(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActivePanel
                        : kDefaultPanel,
                    content: IconContent(
                      icon: FontAwesomeIcons.male,
                      label: 'male',
                    ),
                  ),
                  Panel(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActivePanel
                        : kDefaultPanel,
                    content: IconContent(
                      icon: FontAwesomeIcons.female,
                      label: 'female',
                    ),
                  ),
                ],
              ),
            ),
            Panel(
              colour: kDefaultPanel,
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: kAccentColor,
                      activeTrackColor: Colors.white,
                      overlayColor: Color(0x33EB15555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinHeight,
                      max: kMaxHeight,
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Panel(
                    colour: kDefaultPanel,
                    content: UnitContent(
                      label: 'WEIGHT',
                      value: weight,
                      dec: () {
                        updateWeight(Operation.substract);
                      },
                      longDec: () {
                        isPress = true;
                        updateWeight(Operation.substract);
                      },
                      endLongDec: (_) {
                        setState(() {
                          isPress = false;
                        });
                      },
                      inc: () {
                        updateWeight(Operation.add);
                      },
                      longInc: () {
                        isPress = true;
                        updateWeight(Operation.add);
                      },
                      endLongInc: (_) {
                        setState(() {
                          isPress = false;
                        });
                      },
                    ),
                  ),
                  Panel(
                    colour: kDefaultPanel,
                    content: UnitContent(
                      label: 'AGE',
                      value: age,
                      dec: () {
                        updateAge(Operation.substract);
                      },
                      longDec: () {
                        isPress = true;
                        updateAge(Operation.substract);
                      },
                      endLongDec: (_) {
                        setState(() {
                          isPress = false;
                        });
                      },
                      inc: () {
                        updateAge(Operation.add);
                      },
                      longInc: () {
                        isPress = true;
                        updateAge(Operation.add);
                      },
                      endLongInc: (_) {
                        setState(() {
                          isPress = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              label: 'CALCULATE BMI',
              press: () {
                Calculator calc =
                    Calculator(height: height, weight: weight, age: age);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OutputScreen(
                      bmi: calc.calculateBMI(),
                      status: calc.bmiStatus(),
                      comment: calc.getComment(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
