import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:patient/core/resources/failures.dart';

abstract class SettingsRepository {
  Future<Either<Failure, Locale>> setLanguage(String locale);
  Future<Either<Failure, Locale>> getLanguage();
  Future<Either<Failure, ThemeData>> setTheme(String theme);
  Future<Either<Failure, ThemeData>> getTheme();
}
