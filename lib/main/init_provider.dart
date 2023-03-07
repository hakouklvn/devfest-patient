import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../features/auth/presentation/state/providers.dart';
import '../features/settings/presentation/state/providers.dart';

final initAppProvider = FutureProvider<Unit>((ref) async {
  final authNotifier = ref.read(authNotifierProvider.notifier);
  Future.microtask(() => authNotifier.isLoggedIn());

  final themeNotifier = ref.watch(themeNotifierProvider.notifier);
  Future.microtask(() => themeNotifier.getTheme());

  final languageNotifier = ref.watch(languageNotifierProvider.notifier);
  Future.microtask(() => languageNotifier.getLanguage());

  return unit;
});
