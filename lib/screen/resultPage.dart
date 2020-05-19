import 'package:bmical/constant.dart';
import 'package:bmical/shared/ReuseableCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  resultPage({this.bmiResult, this.resultText, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Align(
              child: Text('Your Result',
                  style: TextStyle(fontSize: 35, color: Colors.white)),
            ),
          ),
          //*************************************************************//
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: cardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText.toUpperCase(),
                      style: TextStyle(fontSize: 15, color: Colors.green)),
                  Text(bmiResult,
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w900)),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(interpretation.toUpperCase()))
                ],
              ),
            ),
          ),
          //***************************************************//
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
                height: bottomHeight,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
                color: kButtonColor,
                child: Align(
                    child: Text('RE-CALCULATE',
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
//TODO: Make this app Responsive adaptable to multiple screen size.
