import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/screens/auth/register_screen/register_page.dart';

import '../../core/exceptions/route_exception.dart';
import '../screens/auth/login_screen/login_page.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/landing_screen/landing_screen.dart';

class AppRouter {
  static const String landingScreen = '/';
  static const String homePage = '/homePage';
  static const String loginPage = '/loginPage';
  static const String registerPage = '/registerPage';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingScreen:
        return MaterialPageRoute(
          builder: (_) => const LandingScreen(),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (_) => const RegisterPage(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
