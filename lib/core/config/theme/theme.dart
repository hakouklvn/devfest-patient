import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:patient/core/config/theme/dark.dart';
import 'package:patient/core/config/theme/light.dart';

import '../constants/palette.dart';

ThemeData lightThemeData() {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: Palette.white1,
    primaryColor: Palette.kPrimaryColor,
    cardColor: Palette.white2,
    appBarTheme: LightTheme.appBarTheme(),
    textTheme: GoogleFonts.cairoTextTheme()
        .apply(bodyColor: Palette.kTextColor, fontFamily: 'Cairo'),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: LightTheme.colorScheme(),
    tabBarTheme: LightTheme.tabBarTheme(),
    inputDecorationTheme: LightTheme.inputDecorationTheme(),
  );
}

ThemeData darkThemeData() {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: Palette.black2,
    primaryColor: Palette.kPrimaryColor,
    cardColor: Palette.black3,
    appBarTheme: DarkTheme.appBarTheme(),
    textTheme: GoogleFonts.cairoTextTheme()
        .apply(bodyColor: Palette.kTextLightColor, fontFamily: 'Cairo'),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: DarkTheme.colorScheme(),
    tabBarTheme: DarkTheme.tabBarTheme(),
    inputDecorationTheme: DarkTheme.inputDecorationTheme(),
    listTileTheme: const ListTileThemeData(
      textColor: Palette.kTextLightColor,
      dense: true,
    ),
  );
}
