import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/utils/validators.dart';
import 'package:patient/core/widgets/widgets.dart';

import '../../state/auth_setter_notifier.dart';
import 'password_field.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(authEntityProvider.notifier);

    return Column(
      children: [
        Text(
          AppLocalizations.of(context)!.welcome,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: Sizes.defaultPadding),
        CustomTextField(
          label: AppLocalizations.of(context)!.email,
          icon: Icons.email,
          keyboardType: TextInputType.emailAddress,
          validator: emailValidator,
          onChanged: (value) => notifier.setEmail(value),
        ),
        const SizedBox(height: Sizes.defaultPadding * 0.5),
        PasswordField(
          onChanged: (val) => notifier.setPassword(val),
          validator: passwordValidator,
        ),
      ],
    );
  }
}
