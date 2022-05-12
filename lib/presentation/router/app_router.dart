import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vending_machine/logic/cubit/timer_cubit/timer_cubit.dart';

import '../../core/exceptions/route_exception.dart';
import '../../data/models/beverage.dart';
import '../../logic/cubit/device_id_cubit/device_id_cubit.dart';
import '../../logic/cubit/landing_cubit/landing_cubit.dart';
import '../../logic/cubit/login_cubit/login_cubit.dart';
import '../../logic/cubit/register_cubit/register_cubit.dart';
import '../screens/add_payment_method/add_payments_method.dart';
import '../screens/auth/login_screen/login_page.dart';
import '../screens/auth/register_screen/register_page.dart';
import '../screens/auth/take_pictures_screen/take_pictures_page.dart';
import '../screens/device_id_screen/device_id_page.dart';
import '../screens/home_screen/home_page.dart';
import '../screens/landing_screen/landing_page.dart';
import '../screens/payment_screen/payment_page.dart';

class AppRouter {
  static const String landingPage = '/';
  static const String homePage = '/homePage';
  static const String loginPage = '/loginPage';
  static const String registerPage = '/registerPage';
  static const String paymentPage = '/paymentPage';
  static const String addPaymentMethodPage = '/addPaymentMethodPage';
  static const String takePicturesPage = '/takePicturesPage';
  static const String deviceIdPage = '/deviceIdPage';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LandingCubit(),
            child: const LandingPage(),
          ),
        );
      case homePage:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => TimerCubit(),
              ),
            ],
            child: const HomePage(),
          ),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginPage(),
          ),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterPage(),
          ),
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
      case deviceIdPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DeviceIdCubit(),
            child: const DeviceIdPage(),
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
