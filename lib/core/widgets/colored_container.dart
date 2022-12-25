import 'package:flutter/material.dart';

import '../config/config.dart';

class ColoredContainer extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final double width;
  final double height;
  final VoidCallback press;

  const ColoredContainer({
    super.key,
    required this.color,
    required this.text,
    required this.icon,
    this.width = double.maxFinite,
    this.height = 130,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: width,
        height: height,
        decoration: UI.boxDecoration(color, 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(icon, color: color),
            Text(text, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
