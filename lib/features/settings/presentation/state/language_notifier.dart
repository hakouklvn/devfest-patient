import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/resources/error_object.dart';
import '../../domain/repositories/settings_repository.dart';

import 'language_state.dart';

class LanguageNotifier extends StateNotifier<LanguageState> {
  final SettingsRepository _settingsRepository;

  LanguageNotifier(this._settingsRepository)
      : super(const LanguageState.initial());

  Future<void> getLanguage() async {
    state = const LanguageState.loading();

    final updateResult = await _settingsRepository.getLanguage();

    state = updateResult.fold(
      (failure) => LanguageState.failure(
          ErrorObject.mapFailureToErrorObject(failure: failure)),
      (data) => LanguageState.loaded(data),
    );
  }

  Future<void> setLanguage(String locale) async {
    state = const LanguageState.loading();

    final updateResult = await _settingsRepository.setLanguage(locale);

    state = updateResult.fold(
      (failure) => LanguageState.failure(
          ErrorObject.mapFailureToErrorObject(failure: failure)),
      (data) => LanguageState.loaded(data),
    );
  }
}
