import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback press;
  final String name;
  final Color? color;
  final double? height;

  const CustomButton({
    super.key,
    required this.press,
    required this.name,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: height ?? 60,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color ?? Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        child: Text(name),
      ),
    );
  }
}
