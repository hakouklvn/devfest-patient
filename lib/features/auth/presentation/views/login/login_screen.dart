import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/routes/router.gr.dart';
import 'package:patient/core/utils/screen_navigator.dart';
import 'package:patient/core/widgets/outline_button.dart';

import '../../widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: Body(screen: LoginForm())),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(Sizes.defaultPadding),
        child: OutlineButton(
          name: AppLocalizations.of(context)!.register,
          press: () {
            ScreenNavigator.goto(context, const RegisterScreen());
          },
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
