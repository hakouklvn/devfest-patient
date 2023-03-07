import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:patient/core/resources/exceptions.dart';
import 'package:patient/core/resources/failures.dart';

import '../../domain/repositories/settings_repository.dart';
import '../datasources/settings_local_datasource.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource settingsLocalDataSource;
  SettingsRepositoryImpl({required this.settingsLocalDataSource});

  @override
  Future<Either<Failure, Locale>> getLanguage() async {
    try {
      Locale locale = await settingsLocalDataSource.getLanguage();
      return Right(locale);
    } on CacheException {
      return Left(Failure.cacheFailure());
    }
  }

  @override
  Future<Either<Failure, Locale>> setLanguage(String locale) async {
    try {
      Locale localeResult = await settingsLocalDataSource.setLanguage(locale);
      return Right(localeResult);
    } on CacheException {
      return Left(Failure.cacheFailure());
    }
  }

  @override
  Future<Either<Failure, ThemeData>> getTheme() async {
    try {
      ThemeData theme = await settingsLocalDataSource.getTheme();
      return Right(theme);
    } on CacheException {
      return Left(Failure.cacheFailure());
    }
  }

  @override
  Future<Either<Failure, ThemeData>> setTheme(String theme) async {
    try {
      ThemeData themeData = await settingsLocalDataSource.setTheme(theme);
      return Right(themeData);
    } on CacheException {
      return Left(Failure.cacheFailure());
    }
  }
}
