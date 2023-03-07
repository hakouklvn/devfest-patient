import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/utils/validators.dart';
import 'package:patient/core/widgets/widgets.dart';

import '../../../domain/entities/user_entity.dart';
import '../../state/auth_state.dart';
import '../../state/providers.dart';
import '../widgets.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final notifier = ref.read(authNotifierProvider.notifier);
    // Validators().init(context);

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Form(
      key: formKey,
      child: Column(
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
            validator: emailValidator,
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email,
            onChanged: (value) => emailController.text = value,
          ),
          const SizedBox(height: Sizes.defaultPadding),
          PasswordField(
            onChanged: (value) => passwordController.text = value,
            validator: passwordValidator,
          ),
          const SizedBox(height: Sizes.defaultPadding),
          ref.watch<AuthState>(authNotifierProvider).maybeMap(
                initial: (_) => Container(),
                orElse: () => Container(),
                failure: (error) => FormError(errors: [error.failure.message]),
              ),
          const SizedBox(height: Sizes.defaultPadding),
          CustomButton(
            name: AppLocalizations.of(context)!.login,
            press: () async {
              bool isValid = formKey.currentState!.validate();

              UserEntity loginEntity = UserEntity(
                email: emailController.text,
                password: passwordController.text,
              );

              if (isValid) await notifier.login(loginEntity);
            },
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
