import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'data_container.dart';
import 'container_layout.dart';

const activeColor = Color(0xFF0073dd);
const inActiveColor = Color(0xFF212121);

class BMIScreen extends StatefulWidget {
  const BMIScreen({Key? key}) : super(key: key);

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  Color? maleBoxColor = activeColor;
  Color? femaleBoxColor = inActiveColor;
  var height = 180;
  var weight = 30;
  var age = 18;
  var result = "";
  var resultDetails = "";
  double bmi = 0;

  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        maleBoxColor = inActiveColor;
        femaleBoxColor = activeColor;
      } else {
        maleBoxColor = activeColor;
        femaleBoxColor = inActiveColor;
      }
    }
  }

  String calculateBMI(int weight, int height) {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getResult(int bmi) {
    if (bmi <= 18) {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    } else if (bmi >= 18 && bmi <= 25) {
      return 'You have a normal body weight. Healthy person ';
    } else {
      return 'You have a higher than normal body weight, Try to exercise more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: activeColor,
          title: Center(
            child: Text(
              'BMI Calculator',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w700,
                fontSize: 26,
              ),
            ),
          )),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(1);
                    });
                  },
                  child: ContainerLayout(
                    boxColor: maleBoxColor,
                    childWidget: DataContainer(
                      icon: FontAwesomeIcons.person,
                      title: 'MALE',
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          updateBoxColor(2);
                        });
                      },
                      child: ContainerLayout(
                        boxColor: femaleBoxColor,
                        childWidget: DataContainer(
                          icon: FontAwesomeIcons.person,
                          title: 'FEMALE',
                        ),
                      ))),
            ],
          )),
          Expanded(
              child: ContainerLayout(
            boxColor: inActiveColor,
            childWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: textStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: textStyle1,
                    ),
                    Text(
                      'cm',
                      style: textStyle,
                    )
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 220,
                  activeColor: activeColor,
                  inactiveColor: inActiveColor,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ContainerLayout(
                boxColor: inActiveColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: textStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: textStyle1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          backgroundColor: activeColor,
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (weight > 0) weight--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        FloatingActionButton(
                          backgroundColor: activeColor,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ContainerLayout(
                boxColor: inActiveColor,
                childWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: textStyle,
                    ),
                    Text(
                      age.toString(),
                      style: textStyle1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FloatingActionButton(
                          backgroundColor: activeColor,
                          child: Icon(
                            FontAwesomeIcons.minus,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              if (age > 0) age--;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        FloatingActionButton(
                          backgroundColor: activeColor,
                          child: Icon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          )),
          GestureDetector(
            onTap: () {
              setState(() {
                result = calculateBMI(weight, height);
                resultDetails = getResult(bmi.toInt());
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor: inActiveColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          color: inActiveColor,
                          height: 200.0,
                          margin: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Result',
                                style: textStyle,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                result.toString(),
                                style: textStyle1,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                resultDetails,
                                style: textStyle,
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              });
            },
            child: Container(
              child: Center(
                  child: Text(
                'Calculate',
                style: textStyle2,
              )),
              width: double.infinity,
              height: 80.0,
              color: activeColor,
              margin: EdgeInsets.only(top: 10.0),
            ),
          )
        ],
      ),
    );
  }
}
