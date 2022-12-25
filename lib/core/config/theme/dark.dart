import 'package:flutter/material.dart';

import '../constants/palette.dart';
import '../constants/sizes.dart';
import '../ui.dart';

class DarkTheme {
  static ColorScheme colorScheme() => const ColorScheme.dark(
        brightness: Brightness.light,
        primary: Palette.kPrimaryLightColor,
        secondary: Palette.kSecondaryLightColor,
      );

  static AppBarTheme appBarTheme() => const AppBarTheme(
        backgroundColor: Palette.black2,
        foregroundColor: Palette.kTextLightColor,
        elevation: 0,
      );

  static TabBarTheme tabBarTheme() => TabBarTheme(
        labelColor: Palette.white2,
        unselectedLabelColor: Palette.white1.withOpacity(0.5),
        indicator: BoxDecoration(
          color: Palette.black3,
          borderRadius: BorderRadius.circular(Sizes.defaultBorderRaduis),
        ),
      );

  static InputDecorationTheme inputDecorationTheme() => InputDecorationTheme(
        enabledBorder: UI.containerBorder(Palette.black3.withOpacity(0.2)),
        focusedBorder: UI.containerBorder(Palette.kSecondaryColor),
        errorBorder: UI.containerBorder(Palette.red),
        focusedErrorBorder: UI.containerBorder(Palette.red),
        filled: true,
      );
}
