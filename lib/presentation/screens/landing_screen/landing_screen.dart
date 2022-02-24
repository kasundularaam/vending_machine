import 'package:flutter/material.dart';

import '../../router/app_router.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToHome(BuildContext context) =>
      waiting().then((value) => Navigator.pushNamedAndRemoveUntil(
          context, AppRouter.loginPage, (route) => false));

  void navigateToLogin(BuildContext context) =>
      waiting().then((value) => Navigator.pushNamedAndRemoveUntil(
          context, AppRouter.loginPage, (route) => false));

  Future waiting() => Future.delayed(const Duration(seconds: 2));

  @override
  Widget build(BuildContext context) {
    navigateToLogin(context);
    return Scaffold(
      body: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}
