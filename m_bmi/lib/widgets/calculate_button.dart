import 'package:m_bmi/constants.dart';
import 'package:flutter/material.dart';
class CalculateButton extends StatelessWidget {
  VoidCallback onTap;
  final String text;
  CalculateButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(text, style: kCalculatebuttonTextStyle),
        ),
        width: double.infinity,
        height: kButtonHeight,
        color: kButtonColor,
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}