import 'package:bmical/brain.dart';
import 'file:///D:/Projects/Working_with_flutter/bmical/lib/screen/resultPage.dart';
import 'package:bmical/shared/CustomRoundButton.dart';
import 'package:bmical/shared/GenderWidget.dart';
import 'package:bmical/shared/ReuseableCard.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../constant.dart';

enum Gender { male, female }

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int height = 180;
  int weight = 20;
  int age = 2;
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? cardColor
                        : kinactiveCardColor,
                    cardChild: GenderCardContent(
                      icon: Icons.accessibility,
                      text: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPressed: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      color: (selectedGender == Gender.female
                          ? cardColor
                          : kinactiveCardColor),
                      cardChild: GenderCardContent(
                        icon: Icons.pregnant_woman,
                        text: 'Female',
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: cardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: lableStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: textStyletwo,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
                      activeTrackColor: Colors.grey[200],
                      thumbColor: Colors.pink[400],
                      overlayColor: Colors.pink[400].withOpacity(0.15),
                    ),
                    child: Slider(
                      onChanged: (double newVlaue) {
                        setState(() {
                          height = newVlaue.round();
                        });
                      },
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      inactiveColor: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
          /*******************************************************************/
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  color: cardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: lableStyle),
                      Row(
                        textBaseline: TextBaseline.alphabetic,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(weight.toString(), style: textStyletwo),
                          Text('kg')
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          CustomRoundButton(
                            onPressed: () {
                              setState(() {
                                if (weight >= 2) {
                                  weight--;
                                }
                              });
                            },
                            iconData: Icons.chevron_left,
                          ),
                          CustomRoundButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            iconData: Icons.chevron_right,
                          )
                        ],
                      )
                    ],
                  ),
                  // cardChild:
                )),
                /**************************************************************************/
                Expanded(
                  child: ReusableCard(
                    color: cardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE', style: lableStyle),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: <Widget>[
                            Text(age.toString(), style: textStyletwo),
                            Text('yrs')
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CustomRoundButton(
                              onPressed: () {
                                setState(() {
                                  if (age >= 2) {
                                    age--;
                                  }
                                });
                              },
                              iconData: Icons.chevron_left,
                            ),
                            CustomRoundButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              iconData: Icons.chevron_right,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          //*
          //*
          //*******************************
          GestureDetector(
            onTap: () {
              brain bra = brain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return resultPage(
                  bmiResult: bra.calculateBMI(),
                  resultText: bra.getResult(),
                  interpretation: bra.getBMIDescrpition(),
                );
              }));
            },
            child: Container(
                height: bottomHeight,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                color: kButtonColor,
                child: Align(
                    child: Text('CALCULATE',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )))),
          )
        ],
      ),
    );
  }
}
