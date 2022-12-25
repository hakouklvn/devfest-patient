import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.length = 1,
    this.keyboardType,
    this.label,
    this.icon,
    this.suffixIcon,
    this.suffixPress,
    this.value,
    this.validator,
    this.obscureText = false,
    this.readonly = false,
  });
  final Function(String)? onChanged;
  final String? value;
  final String? label;
  final FormFieldValidator<String>? validator;
  final int length;
  final TextInputType? keyboardType;
  final IconData? icon;
  final IconData? suffixIcon;
  final VoidCallback? suffixPress;
  final bool obscureText;
  final bool readonly;

  @override
  Widget build(BuildContext context) {
    var themeColor = Theme.of(context);

    return TextFormField(
      onChanged: onChanged,
      validator: validator,
      keyboardType: keyboardType,
      initialValue: value,
      obscureText: obscureText,
      readOnly: readonly,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: themeColor.colorScheme.secondary),
        labelText: label,
      ),
      maxLines: length,
    );
  }
}
