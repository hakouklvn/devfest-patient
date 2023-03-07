import 'package:flutter/material.dart';

import '../../views/account_screen.dart';
import '../routes/router.gr.dart';
import '../utils/screen_navigator.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          ScreenNavigator.goto(context, const Account());
        },
        icon: const Icon(Icons.account_circle),
      ),
      title: const Text("saveme"),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            ScreenNavigator.goto(context, const SettingScreen());
          },
          icon: const Icon(Icons.settings),
        )
      ],
    );
  }
}
