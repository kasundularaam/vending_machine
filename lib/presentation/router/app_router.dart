import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vending_machine/logic/cubit/purchase_cubit/purchase_cubit.dart';
import 'package:vending_machine/presentation/screens/recharge_screen/rechearge_page.dart';

import '../../core/exceptions/route_exception.dart';
import '../../data/models/vm_user.dart';
import '../../logic/cubit/device_id_cubit/device_id_cubit.dart';
import '../../logic/cubit/face_id_auth_cubit/face_id_auth_cubit.dart';
import '../../logic/cubit/landing_cubit/landing_cubit.dart';
import '../../logic/cubit/login_cubit/login_cubit.dart';
import '../../logic/cubit/products_cubit/products_cubit.dart';
import '../../logic/cubit/register_cubit/register_cubit.dart';
import '../../logic/cubit/register_images_cubit/register_images_cubit.dart';
import '../../logic/cubit/scanner_cubit/scanner_cubit.dart';
import '../../logic/cubit/timer_cubit/timer_cubit.dart';
import '../screens/auth/face_id_auth_screen/face_id_auth_page.dart';
import '../screens/auth/login_screen/login_page.dart';
import '../screens/auth/register_screen/register_page.dart';
import '../screens/auth/take_pictures_screen/take_pictures_page.dart';
import '../screens/device_id_screen/device_id_page.dart';
import '../screens/home_screen/home_page.dart';
import '../screens/landing_screen/landing_page.dart';
import '../screens/payments/select_payment_method_screen/select_payment_method_screen.dart';
import '../screens/payments/via_card_screen/via_card_page.dart';
import '../screens/scanner_screen/scanner_page.dart';

class AppRouter {
  static const String landingPage = '/';
  static const String homePage = '/homePage';
  static const String loginPage = '/loginPage';
  static const String registerPage = '/registerPage';
  static const String faceIdAuthPage = '/faceIdAuthPage';
  static const String paymentPage = '/paymentPage';
  static const String selectPaymentMethodScreen = '/selectPaymentMethodScreen';
  static const String viaCardPage = '/viaCardPage';
  static const String takePicturesPage = '/takePicturesPage';
  static const String deviceIdPage = '/deviceIdPage';
  static const String scannerPage = '/scannerPage';
  static const String rechargePage = '/rechargePage';

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
        final Map<String, dynamic> args =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => TimerCubit(),
              ),
              BlocProvider(
                create: (context) => ProductsCubit(),
              ),
            ],
            child: HomePage(
              deviceId: args["deviceId"],
              vmUser: args["vmUser"],
            ),
          ),
        );
      case loginPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginPage(),
          ),
        );
      case rechargePage:
        return MaterialPageRoute(
          builder: (_) => const RechargePage(),
        );
      case faceIdAuthPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FaceIdAuthCubit(),
            child: const FaceIdAuthPage(),
          ),
        );
      case registerPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterCubit(),
            child: const RegisterPage(),
          ),
        );

      case selectPaymentMethodScreen:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => TimerCubit(),
            child: SelectPaymentMethodScreen(
                product: args["product"], vmUser: args["user"]),
          ),
        );

      case viaCardPage:
        Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => TimerCubit(),
              ),
              BlocProvider(
                create: (context) => PurchaseCubit(),
              )
            ],
            child: ViaCardPage(
              product: args["product"],
              user: args["user"],
            ),
          ),
        );
      case takePicturesPage:
        VMUser vmUser = settings.arguments as VMUser;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => RegisterImagesCubit(),
            child: TakePicturesPage(
              vmUser: vmUser,
            ),
          ),
        );
      case deviceIdPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => DeviceIdCubit(),
            child: const DeviceIdPage(),
          ),
        );
      case scannerPage:
        VMUser vmUser = settings.arguments as VMUser;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ScannerCubit(),
            child: ScannerPage(
              vmUser: vmUser,
            ),
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
