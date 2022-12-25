import 'package:flutter/material.dart';

import '../constants/palette.dart';
import '../constants/sizes.dart';
import '../ui.dart';

class LightTheme {
  static ColorScheme colorScheme() => const ColorScheme.light(
        brightness: Brightness.light,
        primary: Palette.kPrimaryColor,
        secondary: Palette.kSecondaryColor,
      );

  static AppBarTheme appBarTheme() => const AppBarTheme(
        backgroundColor: Palette.white1,
        foregroundColor: Palette.kTextColor,
        elevation: 0,
      );

  static TabBarTheme tabBarTheme() => TabBarTheme(
        labelColor: Palette.kPrimaryColor,
        unselectedLabelColor: Palette.black2.withOpacity(0.7),
        indicator: BoxDecoration(
          color: Palette.white2,
          borderRadius: BorderRadius.circular(Sizes.defaultBorderRaduis),
        ),
      );

  static InputDecorationTheme inputDecorationTheme() => InputDecorationTheme(
        enabledBorder:
            UI.containerBorder(Palette.kPrimaryColor.withOpacity(0.2)),
        focusedBorder: UI.containerBorder(Palette.kSecondaryColor),
        errorBorder: UI.containerBorder(Palette.red),
        focusedErrorBorder: UI.containerBorder(Palette.red),
        filled: true,
      );
}
