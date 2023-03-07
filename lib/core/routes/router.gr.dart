// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../../features/auth/presentation/views/login/login_screen.dart' as _i6;
import '../../features/auth/presentation/views/register/register_screen.dart'
    as _i5;
import '../../features/history/presentation/views/history_screen.dart' as _i8;
import '../../features/home/presentation/views/home_screen.dart' as _i2;
import '../../features/home/presentation/views/splash_screen.dart' as _i1;
import '../../features/home/presentation/views/wrapper.dart' as _i3;
import '../../features/order/presentation/views/order_screen.dart' as _i7;
import '../../features/service/presentation/views/service_screen.dart' as _i9;
import '../../features/settings/presentation/views/settings_screen.dart' as _i4;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    Wrapper.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.Wrapper(),
      );
    },
    SettingScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SettingScreen(),
      );
    },
    RegisterScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.RegisterScreen(),
      );
    },
    LoginScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.LoginScreen(),
      );
    },
    OrderScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.OrderScreen(),
      );
    },
    HistoryScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.HistoryScreen(),
      );
    },
    ServiceScreen.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ServiceScreen(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i10.RouteConfig(
          HomeScreen.name,
          path: '/home-screen',
          children: [
            _i10.RouteConfig(
              HistoryScreen.name,
              path: 'history-screen',
              parent: HomeScreen.name,
            ),
            _i10.RouteConfig(
              ServiceScreen.name,
              path: 'service-screen',
              parent: HomeScreen.name,
            ),
          ],
        ),
        _i10.RouteConfig(
          Wrapper.name,
          path: '/Wrapper',
        ),
        _i10.RouteConfig(
          SettingScreen.name,
          path: '/setting-screen',
        ),
        _i10.RouteConfig(
          RegisterScreen.name,
          path: '/register-screen',
        ),
        _i10.RouteConfig(
          LoginScreen.name,
          path: '/login-screen',
        ),
        _i10.RouteConfig(
          OrderScreen.name,
          path: '/order-screen',
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i10.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreen extends _i10.PageRouteInfo<void> {
  const HomeScreen({List<_i10.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          path: '/home-screen',
          initialChildren: children,
        );

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i3.Wrapper]
class Wrapper extends _i10.PageRouteInfo<void> {
  const Wrapper()
      : super(
          Wrapper.name,
          path: '/Wrapper',
        );

  static const String name = 'Wrapper';
}

/// generated route for
/// [_i4.SettingScreen]
class SettingScreen extends _i10.PageRouteInfo<void> {
  const SettingScreen()
      : super(
          SettingScreen.name,
          path: '/setting-screen',
        );

  static const String name = 'SettingScreen';
}

/// generated route for
/// [_i5.RegisterScreen]
class RegisterScreen extends _i10.PageRouteInfo<void> {
  const RegisterScreen()
      : super(
          RegisterScreen.name,
          path: '/register-screen',
        );

  static const String name = 'RegisterScreen';
}

/// generated route for
/// [_i6.LoginScreen]
class LoginScreen extends _i10.PageRouteInfo<void> {
  const LoginScreen()
      : super(
          LoginScreen.name,
          path: '/login-screen',
        );

  static const String name = 'LoginScreen';
}

/// generated route for
/// [_i7.OrderScreen]
class OrderScreen extends _i10.PageRouteInfo<void> {
  const OrderScreen()
      : super(
          OrderScreen.name,
          path: '/order-screen',
        );

  static const String name = 'OrderScreen';
}

/// generated route for
/// [_i8.HistoryScreen]
class HistoryScreen extends _i10.PageRouteInfo<void> {
  const HistoryScreen()
      : super(
          HistoryScreen.name,
          path: 'history-screen',
        );

  static const String name = 'HistoryScreen';
}

/// generated route for
/// [_i9.ServiceScreen]
class ServiceScreen extends _i10.PageRouteInfo<void> {
  const ServiceScreen()
      : super(
          ServiceScreen.name,
          path: 'service-screen',
        );

  static const String name = 'ServiceScreen';
}
