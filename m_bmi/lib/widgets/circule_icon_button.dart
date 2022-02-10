import 'package:flutter/material.dart';
class CirculeIconButton extends StatelessWidget {
  CirculeIconButton({Key? key, required this.icon, this.onTap})
      : super(key: key);
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onTap,
      fillColor: Color(0xff4C4F5E),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}