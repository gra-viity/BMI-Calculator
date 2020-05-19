import 'package:bmical/constant.dart';
import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final Function onPressed;
  final IconData iconData;
  CustomRoundButton({this.onPressed, this.iconData});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Icon(iconData, size: 30, color: Colors.white),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kFloatingButoonColor,
        ),
        padding: EdgeInsets.all(8),
      ),
    );
  }
}
