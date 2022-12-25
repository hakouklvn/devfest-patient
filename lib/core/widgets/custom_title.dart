import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final Color? color;
  const CustomTitle({super.key, this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(
        top: Sizes.defaultPadding,
        bottom: Sizes.defaultPadding * 0.5,
      ),
      child: Text(
        title,
        style: theme.textTheme.headline6!.copyWith(color: color),
      ),
    );
  }
}
