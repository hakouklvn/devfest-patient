import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/widgets/widgets.dart';
import 'package:patient/features/auth/presentation/state/providers.dart';

import '../state/language_state.dart';
import '../state/providers.dart';
import '../state/theme_state.dart';
import '../widgets/custom_select_button.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = AppLocalizations.of(context)!;
    final lightThemeText = locale.lightTheme;
    final darkThemeText = locale.darkTheme;

    final arabicText = locale.arabic;
    final englishText = locale.english;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.defaultPadding),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(Sizes.defaultPadding),
                width: double.maxFinite,
                height: 300,
                child: Image.asset("assets/images/app-logo.png"),
              ),
              const SizedBox(height: Sizes.defaultPadding),
              CustomSelectButton(
                select: (val) {
                  ref
                      .read(languageNotifierProvider.notifier)
                      .setLanguage(val == arabicText ? 'ar' : 'en');
                },
                items: [arabicText, englishText],
                icon: Icons.language_rounded,
                initText:
                    ref.watch<LanguageState>(languageNotifierProvider).maybeMap(
                          initial: (_) => arabicText,
                          orElse: () => arabicText,
                          loaded: (data) => data.locale.languageCode == 'ar'
                              ? arabicText
                              : englishText,
                        ),
              ),
              const SizedBox(height: Sizes.defaultPadding),
              CustomSelectButton(
                select: (val) {
                  ref
                      .read(themeNotifierProvider.notifier)
                      .setTheme(val == lightThemeText ? 'light' : 'dark');
                },
                items: [lightThemeText, darkThemeText],
                icon: Icons.sunny,
                initText: ref.watch<ThemeState>(themeNotifierProvider).maybeMap(
                      initial: (_) => lightThemeText,
                      orElse: () => lightThemeText,
                      loaded: (data) => data.themeData == lightThemeData()
                          ? lightThemeText
                          : darkThemeText,
                    ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(Sizes.defaultPadding),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: CustomButton(
          press: () {
            ref.read(authNotifierProvider.notifier).logout();
          },
          name: locale.logout,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
