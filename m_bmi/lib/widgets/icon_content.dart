import 'package:flutter/material.dart';

import 'package:m_bmi/constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80.0,
            color: Colors.white,
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            label,
            style: kLabelTextStyle,
          )
        ],
      ),
    );
  }
}
