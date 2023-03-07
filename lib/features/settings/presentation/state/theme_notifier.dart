import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/resources/error_object.dart';
import '../../domain/repositories/settings_repository.dart';
import 'theme_state.dart';

class ThemeNotifier extends StateNotifier<ThemeState> {
  final SettingsRepository _settingsRepository;

  ThemeNotifier(this._settingsRepository) : super(const ThemeState.initial());

  Future<void> getTheme() async {
    state = const ThemeState.loading();
    final themeResult = await _settingsRepository.getTheme();

    state = themeResult.fold(
      (failure) => ThemeState.failure(
          ErrorObject.mapFailureToErrorObject(failure: failure)),
      (data) => ThemeState.loaded(data),
    );
  }

  Future<void> setTheme(String theme) async {
    state = const ThemeState.loading();
    final themeResult = await _settingsRepository.setTheme(theme);

    state = themeResult.fold(
      (failure) => ThemeState.failure(
          ErrorObject.mapFailureToErrorObject(failure: failure)),
      (data) => ThemeState.loaded(data),
    );
  }
}
