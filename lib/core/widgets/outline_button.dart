import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final VoidCallback press;
  final String name;
  final Color? color;

  const OutlineButton({
    super.key,
    required this.press,
    required this.name,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 50,
      child: TextButton(
        onPressed: press,
        style: TextButton.styleFrom(
          elevation: 0,
          foregroundColor: Theme.of(context).primaryColor,
          side: BorderSide(color: Theme.of(context).primaryColor),
        ),
        child: Text(name),
      ),
    );
  }
}
