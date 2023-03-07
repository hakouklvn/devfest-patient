import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/resources/error_object.dart';

part 'language_state.freezed.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState.initial() = _Initial;
  const factory LanguageState.loading() = _Loading;
  const factory LanguageState.loaded(Locale locale) = _Loaded;
  const factory LanguageState.failure(ErrorObject failure) = _Failure;
}
