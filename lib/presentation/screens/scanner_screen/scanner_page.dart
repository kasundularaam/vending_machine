import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/vm_user.dart';
import '../../../logic/cubit/scanner_cubit/scanner_cubit.dart';
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
