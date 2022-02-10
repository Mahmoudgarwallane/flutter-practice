import 'package:flutter/material.dart';

import 'package:m_bmi/screens/input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      theme: theme.copyWith(
          textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
          scaffoldBackgroundColor: Color(0xFF0A0D22),
          colorScheme: theme.colorScheme.copyWith(
              secondary: Colors.purple,
              primary: Color(0xFF0A0D22),
              background: Color(0xFF0A0D22))),
      home: InputPage(),
    );
  }
}


