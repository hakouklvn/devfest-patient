import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/routes/router.gr.dart';
import 'package:patient/core/utils/screen_navigator.dart';
import 'package:patient/core/widgets/outline_button.dart';
import '../../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: Body(screen: RegisterForm())),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(Sizes.defaultPadding),
        child: OutlineButton(
          name: AppLocalizations.of(context)!.login,
          press: () {
            ScreenNavigator.replaceWith(context, const LoginScreen());
          },
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
