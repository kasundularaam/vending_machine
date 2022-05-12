import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/landing_cubit/landing_cubit.dart';
import '../../router/app_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  void navigateToHome(BuildContext context) =>
      waiting().then((value) => Navigator.pushNamedAndRemoveUntil(
          context, AppRouter.loginPage, (route) => false));

  void navigateToLogin(BuildContext context) =>
      waiting().then((value) => Navigator.pushNamedAndRemoveUntil(
          context, AppRouter.loginPage, (route) => false));

  Future waiting() => Future.delayed(const Duration(seconds: 2));

  @override
  Widget build(BuildContext context) {
    return BlocListener<LandingCubit, LandingState>(
      listener: (context, state) {
        if (state is LandingFailed) {
          SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is LandingToAuth) {
          navigateToLogin(context);
        }
        if (state is LandingToHome) {
          navigateToHome(context);
        }
      },
      child: Scaffold(
        body: Center(
          child: Image.asset("assets/logo.png"),
        ),
      ),
    );
  }
}
