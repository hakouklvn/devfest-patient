import 'package:flutter/material.dart';
import 'package:patient/core/config/config.dart';

class FormError extends StatelessWidget {
  const FormError({super.key, required this.errors});
  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(Sizes.defaultPadding * 0.5),
      decoration: UI.boxDecoration(Theme.of(context).colorScheme.error, 0.7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          errors.length,
          (index) => Text(
            errors[index],
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
