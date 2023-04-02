import 'package:flutter/material.dart';
import 'package:smart_home_app/features/auth/auth_page.dart';
import 'package:smart_home_app/features/home_page.dart';
import 'package:smart_home_app/features/auth/login/login_page.dart';
import 'package:smart_home_app/features/settings_page.dart';
import 'package:smart_home_app/resources/managers/string_manager.dart';

import '../../features/boarding_page.dart';

class Routes {
  static const String boardingRoute = '/';
  static const String homeRoute = '/home';
  static const String settingsRoute = '/settings';
  static const String loginRoute = '/login';
  static const String authRoute = '/auth';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.boardingRoute:
        return MaterialPageRoute(builder: (_) => const BoardingPage());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.authRoute:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(StringsManager.noRouteFound),
        ),
        body: const Center(
          child: Text(StringsManager.noRouteFound),
        ),
      ),
    );
  }
}
