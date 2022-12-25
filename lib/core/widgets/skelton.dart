import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    this.width,
    this.height,
    this.child,
    this.margin,
    this.padding = const EdgeInsets.all(Sizes.defaultPadding),
  });

  final double? width;
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: UI.boxDecoration(Theme.of(context).cardColor, 0.9),
      width: width,
      height: height,
      child: child,
    );
  }
}
