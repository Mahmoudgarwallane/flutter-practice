import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  Widget? child;
  final VoidCallback? onTap;
  ReusableCard({required this.color, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: child),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
