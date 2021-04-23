import 'package:flutter/material.dart';
import 'package:tokokita/screens/dashboard_screen/dashboard_screen.dart';
import 'package:tokokita/screens/login_screen/login_screen.dart';
import 'package:tokokita/screens/register_screen/register_screen.dart';
import 'package:tokokita/screens/splash_screen/splash_screen.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case '/':
        return MaterialPageRoute(
            settings: setting,
            builder: (BuildContext context) => SplashScreen());

      case '/login':
        return MaterialPageRoute(
            settings: setting,
            builder: (BuildContext context) => LoginScreen());

      case '/register':
        return MaterialPageRoute(
            settings: setting,
            builder: (BuildContext context) => RegisterScreen());
      case '/dashboard':
        return MaterialPageRoute(
            settings: setting,
            builder: (BuildContext context) => DashboardScreen());

      default:
        return null;
    }
  }
}
