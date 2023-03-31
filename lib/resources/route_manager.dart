import 'package:flutter/material.dart';
import 'package:smart_home_app/pages/home_page.dart';
import 'package:smart_home_app/pages/login_page.dart';
import 'package:smart_home_app/pages/settings_page.dart';
import 'package:smart_home_app/resources/string_manager.dart';

import '../pages/splash_page.dart';

class Routes {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String settingsRoute = '/settings';
  static const String loginRoute = '/login';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.settingsRoute:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
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
