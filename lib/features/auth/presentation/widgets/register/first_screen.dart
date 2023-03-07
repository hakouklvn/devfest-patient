import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/widgets/widgets.dart';

import '../../state/auth_setter_notifier.dart';

class FirstScreen extends ConsumerWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = AppLocalizations.of(context)!;
    final notifier = ref.read(authEntityProvider.notifier);
    final user = ref.watch(authEntityProvider);

    return Column(
      children: [
        Text(
          locale.welcome,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: Sizes.defaultPadding),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                label: locale.firstName,
                icon: Icons.person,
                // validator: emptyTextFieldValidator,
                keyboardType: TextInputType.text,
                onChanged: (firstName) => notifier.setFirstName(firstName),
                value: user.firstName,
              ),
            ),
            const SizedBox(width: Sizes.defaultPadding * 0.5),
            Expanded(
              child: CustomTextField(
                label: locale.familyName,
                icon: Icons.person,
                // validator: emptyTextFieldValidator,
                keyboardType: TextInputType.text,
                onChanged: (value) => notifier.setFamilyName(value),
                value: user.familyName,
              ),
            ),
          ],
        ),
        const SizedBox(height: Sizes.defaultPadding * 0.5),
        CustomTextField(
          label: locale.phoneNumber,
          icon: Icons.phone_enabled,
          // validator: emptyTextFieldValidator,
          keyboardType: TextInputType.number,
          onChanged: (value) => notifier.setPhoneNumber(value),
          value: user.phoneNumber,
        ),
      ],
    );
  }
}
