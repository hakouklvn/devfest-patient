import 'package:auto_route/auto_route.dart';

import '../../features/auth/presentation/views/login/login_screen.dart';
import '../../features/auth/presentation/views/register/register_screen.dart';
import '../../features/history/presentation/views/history_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/home/presentation/views/splash_screen.dart';
import '../../features/home/presentation/views/wrapper.dart';
import '../../features/order/presentation/views/order_screen.dart';
import '../../features/service/presentation/views/service_screen.dart';
import '../../features/settings/presentation/views/settings_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: HomeScreen, children: [
      MaterialRoute(page: HistoryScreen),
      MaterialRoute(page: ServiceScreen),
    ]),
    MaterialRoute(page: Wrapper),
    MaterialRoute(page: SettingScreen),
    // Authentication screens
    MaterialRoute(page: RegisterScreen),
    MaterialRoute(page: LoginScreen),
    // order screens
    MaterialRoute(page: OrderScreen),
  ],
)
class $AppRouter {}
