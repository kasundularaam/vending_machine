import 'package:flutter/material.dart';

import '../../core/exceptions/route_exception.dart';
import '../../data/models/beverage.dart';
import '../screens/add_payment_method/add_payments_method.dart';
import '../screens/auth/login_screen/login_page.dart';
import '../screens/auth/register_screen/register_page.dart';
import '../screens/auth/take_pictures_screen/take_pictures_page.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/landing_screen/landing_screen.dart';
import '../screens/payment_screen/payment_page.dart';

class AppRouter {
  static const String landingScreen = '/';
  static const String homePage = '/homePage';
  static const String loginPage = '/loginPage';
  static const String registerPage = '/registerPage';
  static const String paymentPage = '/paymentPage';
  static const String addPaymentMethodPage = '/addPaymentMethodPage';
  static const String takePicturesPage = '/takePicturesPage';

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
      case paymentPage:
        Beverage beverage = settings.arguments as Beverage;
        return MaterialPageRoute(
          builder: (_) => PaymentPage(
            beverage: beverage,
          ),
        );
      case addPaymentMethodPage:
        return MaterialPageRoute(
          builder: (_) => const AddPaymentMethodPage(),
        );
      case takePicturesPage:
        return MaterialPageRoute(
          builder: (_) => const TakePicturesPage(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
