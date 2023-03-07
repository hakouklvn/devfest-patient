import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback press;
  final String name;
  final Color? color;
  final double? height;
  final double? width;
  final double? radius;

  const CustomButton({
    super.key,
    required this.press,
    required this.name,
    this.height,
    this.width,
    this.radius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    const double defaultHeight = 43;
    const double defaultWidth = double.maxFinite;

    return SizedBox(
      width: width ?? defaultWidth,
      height: height ?? defaultHeight,
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              radius ?? Sizes.defaultBorderRaduis * 0.5,
            ),
          ),
        ),
        child: Text(name, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
