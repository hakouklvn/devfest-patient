import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:patient/core/config/theme/theme.dart';

abstract class SettingsLocalDataSource {
  Future<Locale> setLanguage(String locale);
  Future<Locale> getLanguage();
  Future<ThemeData> setTheme(String theme);
  Future<ThemeData> getTheme();
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final HiveInterface hive;
  SettingsLocalDataSourceImpl({required this.hive});

  Future<Box> _openBox() {
    return hive.openBox('hive');
  }

  @override
  Future<Locale> getLanguage() async {
    var box = await _openBox();
    String? locale = box.get('locale');

    if (locale == null) {
      return setLanguage('ar');
    }

    return Locale(locale);
  }

  @override
  Future<Locale> setLanguage(String locale) async {
    var box = await _openBox();
    box.put('locale', locale);
    return Locale(locale);
  }

  @override
  Future<ThemeData> getTheme() async {
    var box = await _openBox();
    String? theme = box.get('theme');

    if (theme == null) {
      return setTheme('light');
    }

    return theme == "dark" ? darkThemeData() : lightThemeData();
  }

  @override
  Future<ThemeData> setTheme(String theme) async {
    var box = await _openBox();
    box.put('theme', theme);
    return theme == "dark" ? darkThemeData() : lightThemeData();
  }
}
