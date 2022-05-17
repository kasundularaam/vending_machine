import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vending_machine/data/models/vm_user.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/strings.dart';
import '../../../logic/cubit/landing_cubit/landing_cubit.dart';
import '../../router/app_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  void navigateToHome(BuildContext context, VMUser vmUser) =>
      waiting().then((value) => Navigator.pushNamedAndRemoveUntil(
          context, AppRouter.scannerPage, (route) => false,
          arguments: vmUser));

  void navigateToLogin(BuildContext context) =>
      waiting().then((value) => Navigator.pushNamedAndRemoveUntil(
          context, AppRouter.loginPage, (route) => false));

  Future waiting() => Future.delayed(const Duration(seconds: 2));

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LandingCubit>(context).load();
    return BlocListener<LandingCubit, LandingState>(
      listener: (context, state) {
        if (state is LandingFailed) {
          SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is LandingToAuth) {
          navigateToLogin(context);
        }
        if (state is LandingToScanner) {
          navigateToHome(context, state.vmUser);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Strings.landingImg),
              SizedBox(
                height: 5.h,
              ),
              Text(
                "VENDING MACHINE",
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
