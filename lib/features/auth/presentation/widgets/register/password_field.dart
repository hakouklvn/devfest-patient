import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordField extends StatefulWidget {
  final Function(String) onChanged;
  final FormFieldValidator<String>? validator;

  const PasswordField({
    super.key,
    required this.onChanged,
    this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    var themeColor = Theme.of(context);

    return TextFormField(
      onChanged: widget.onChanged,
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
      obscureText: visible,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: themeColor.colorScheme.secondary),
        suffixIcon: IconButton(
          onPressed: () {
            visible = !visible;
            setState(() {});
          },
          icon: Icon(visible ? Icons.visibility_off : Icons.visibility),
          color: themeColor.colorScheme.secondary,
        ),
        labelText: AppLocalizations.of(context)!.password,
      ),
    );
  }
}
