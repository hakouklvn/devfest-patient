import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:patient/core/config/config.dart';
import 'package:patient/core/routes/router.gr.dart';
import 'package:patient/core/utils/notification_handler.dart';

import '../features/auth/presentation/state/auth_state.dart';
import '../features/auth/presentation/state/providers.dart';
import '../features/settings/presentation/state/language_state.dart';
import '../features/settings/presentation/state/providers.dart';
import '../features/settings/presentation/state/theme_state.dart';
import 'init_provider.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    ref.watch(initAppProvider);

    ref.listen<AuthState>(
      authNotifierProvider,
      (_, state) {
        state.maybeMap(
          orElse: () {},
          authenticating: (_) => const SplashScreen(),
          authenticated: (_) => appRouter.pushAndPopUntil(
            const Wrapper(),
            predicate: (route) => false,
          ),
          unauthenticated: (_) => appRouter.pushAndPopUntil(
            const LoginScreen(),
            predicate: (route) => false,
          ),
          signedOut: (_) => appRouter.pushAndPopUntil(
            const LoginScreen(),
            predicate: (route) => false,
          ),
        );
      },
    );

    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      locale: ref.watch<LanguageState>(languageNotifierProvider).maybeMap(
            initial: (_) => const Locale("ar"),
            orElse: () => const Locale("ar"),
            loaded: (data) => data.locale,
          ),
      theme: ref.watch<ThemeState>(themeNotifierProvider).maybeMap(
            initial: (_) => lightThemeData(),
            orElse: () => lightThemeData(),
            loaded: (data) => data.themeData,
          ),
      debugShowCheckedModeBanner: false,
      title: 'MyHanuut',
    );
  }

  @override
  void initState() {
    super.initState();
    setupToken();
    showNotification();
  }

  Future<void> showNotification() async {
    NotificatioService notificatioService = NotificatioService();
    notificatioService.init();

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          String title = notification.title ?? "";
          String body = notification.body ?? "";
          notificatioService.displayNotification(title, body);
        }
      },
    );
  }

  Future<void> setupToken() async {
    // String? token = await FirebaseMessaging.instance.getToken();
    // final shopOwnerProvider = ref.read(shopNotifierProvider.notifier);
    // await shopOwnerProvider.updateFirebaseToken(token!);
    // FirebaseMessaging.instance.onTokenRefresh
    //     .listen(shopOwnerProvider.updateFirebaseToken);
  }
}
