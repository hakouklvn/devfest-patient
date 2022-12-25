import 'package:flutter/material.dart';

import '../config/config.dart';

class CustomTextFieldWithBtn extends StatelessWidget {
  const CustomTextFieldWithBtn({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.length,
    required this.press,
    required this.controller,
  }) : super(key: key);

  final ValueChanged<String>? onChanged;
  final VoidCallback press;
  final String? label;
  final int length;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).cardColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.defaultBorderRaduis),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Theme.of(context).colorScheme.onSurface),
          borderRadius: const BorderRadius.all(
            Radius.circular(Sizes.defaultBorderRaduis),
          ),
        ),
        suffixIcon: InkWell(
          onTap: press,
          child: Container(
            decoration: UI.boxDecoration(Theme.of(context).primaryColor, 0.8),
            child: Icon(Icons.add, color: Theme.of(context).iconTheme.color),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          minWidth: 85,
          minHeight: 75,
        ),
        filled: true,
        fillColor: Theme.of(context).cardColor.withOpacity(0.5),
        labelText: label,
      ),
      maxLines: length,
    );
  }
}
