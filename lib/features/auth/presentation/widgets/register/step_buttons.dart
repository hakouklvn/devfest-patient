import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/widgets/outline_button.dart';
import 'package:patient/core/widgets/widgets.dart';

import '../../../domain/entities/user_entity.dart';
import '../../state/auth_setter_notifier.dart';
import '../../state/providers.dart';

class StepsButtons extends ConsumerWidget {
  final PageController pageController;
  const StepsButtons({super.key, required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserEntity user = ref.watch(authEntityProvider);

    return Row(
      children: [
        Expanded(
          child: OutlineButton(
            name: AppLocalizations.of(context)!.previous,
            color: Theme.of(context).primaryColor,
            press: () {
              pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.bounceOut,
              );
            },
          ),
        ),
        const SizedBox(width: Sizes.defaultPadding),
        Expanded(
          child: CustomButton(
            name: AppLocalizations.of(context)!.next,
            press: () {
              GlobalKey<FormState> formKey = ref.watch(formProvider);
              bool isValid = formKey.currentState!.validate();

              if (isValid) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceOut,
                );

                if (pageController.page == 1.0) {
                  ref.read(authNotifierProvider.notifier).register(user);
                }
              }
            },
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
