import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/converters/converters.dart';
import '../../../data/models/vm_user.dart';
import '../../../logic/cubit/scanner_cubit/scanner_cubit.dart';
import '../../../logic/cubit/sign_out_cubit/sign_out_cubit.dart';
import '../../router/app_router.dart';

class ScannerPage extends StatefulWidget {
  final VMUser vmUser;
  const ScannerPage({
    Key? key,
    required this.vmUser,
  }) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  VMUser get vmUser => widget.vmUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              color: AppColors.primaryColor,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Vending Machine",
                      style: TextStyle(
                          color: AppColors.lightElv0,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  InkWell(
                    onTap: () => showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5.w),
                        ),
                      ),
                      backgroundColor: Colors.white,
                      builder: (sheetContext) {
                        return BlocProvider(
                          create: (context) => SignOutCubit(),
                          child: Padding(
                            padding: EdgeInsets.all(5.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    "assets/profile.png",
                                    width: 30.w,
                                    height: 30.w,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 4.h),
                                  child: const Divider(
                                    color: AppColors.darkElv1,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Name:",
                                      style: TextStyle(
                                          color: AppColors.darkElv0,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        vmUser.name,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: AppColors.darkElv1,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  children: [
                                    Text(
                                      "Email:",
                                      style: TextStyle(
                                          color: AppColors.darkElv0,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        vmUser.email,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: AppColors.darkElv1,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  children: [
                                    Text(
                                      "Age:",
                                      style: TextStyle(
                                          color: AppColors.darkElv0,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        age(vmUser.dob),
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            color: AppColors.darkElv1,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "remove account from this device:",
                                        style: TextStyle(
                                            color: AppColors.darkElv1,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    BlocConsumer<SignOutCubit, SignOutState>(
                                      listener: (context, state) {
                                        if (state is SignOutFailed) {
                                          SnackBar snackBar = SnackBar(
                                              content: Text(state.errorMsg));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                        if (state is SignOutSucceed) {
                                          Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            AppRouter.landingPage,
                                            (route) => false,
                                          );
                                        }
                                      },
                                      builder: (context, state) {
                                        return ElevatedButton(
                                          onPressed: () =>
                                              BlocProvider.of<SignOutCubit>(
                                                      context)
                                                  .signOut(),
                                          child: const Text(
                                            "SIGN OUT",
                                            style: TextStyle(
                                                color: AppColors.lightElv0),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/profile.png",
                        width: 12.w,
                        height: 12.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "WELCOME",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 5.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(3.w),
              child: Image.asset(
                "assets/scanner.png",
                width: 70.w,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            const Divider(
              color: AppColors.darkElv1,
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Scan vending machine QR",
                      style: TextStyle(
                        color: AppColors.darkElv1,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  BlocConsumer<ScannerCubit, ScannerState>(
                    listener: (context, state) {
                      if (state is ScannerSucceed) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRouter.homePage,
                          (route) => false,
                          arguments: {
                            "deviceId": state.deviceId,
                            "vmUser": vmUser
                          },
                        );
                      }
                      if (state is ScannerFailed) {
                        SnackBar snackBar =
                            SnackBar(content: Text(state.errorMsg));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    builder: (context, state) {
                      if (state is ScannerScanning) {
                        return const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        );
                      }
                      return ElevatedButton(
                        onPressed: () =>
                            BlocProvider.of<ScannerCubit>(context).scanQRcode(),
                        child: const Text(
                          "Scan",
                          style: TextStyle(color: AppColors.lightElv0),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }
}
