import 'package:bmical/constant.dart';
import 'package:flutter/material.dart';

class GenderCardContent extends StatelessWidget {
  final IconData icon;
  final String text;
  GenderCardContent({this.icon, this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 50, color: Colors.white),
        SizedBox(height: 5),
        Text(text, style: lableStyle)
      ],
    );
  }
}
