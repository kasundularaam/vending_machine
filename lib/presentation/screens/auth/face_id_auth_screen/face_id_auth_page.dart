import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/vm_user.dart';
import '../../../../logic/cubit/face_id_auth_cubit/face_id_auth_cubit.dart';
import '../../../router/app_router.dart';
import 'widgets/face_scan_box.dart';

class FaceIdAuthPage extends StatefulWidget {
  const FaceIdAuthPage({Key? key}) : super(key: key);

  @override
  State<FaceIdAuthPage> createState() => _FaceIdAuthPageState();
}

class _FaceIdAuthPageState extends State<FaceIdAuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightElv1,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/logo_with_shape.png",
              width: 100.w,
              fit: BoxFit.fitWidth,
            ),
          ),
          ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            children: [
              SizedBox(
                height: 38.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: AppColors.lightElv0,
                  borderRadius: BorderRadius.circular(3.w),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.w, 0.w),
                      color: AppColors.darkElv0.withOpacity(0.1),
                      spreadRadius: 0.3.w,
                      blurRadius: 0.3.w,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "FACE SCAN",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    BlocConsumer<FaceIdAuthCubit, FaceIdAuthState>(
                      listener: (context, state) {
                        if (state is FaceIdAuthFailed) {
                          SnackBar snackBar =
                              SnackBar(content: Text(state.errorMsg));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      builder: (context, state) {
                        if (state is FaceIdAuthForMachine) {
                          return buildUserCard(
                            state.vmUser,
                            () => Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRouter.homePage,
                              (route) => false,
                              arguments: {
                                "deviceId": state.deviceId,
                                "vmUser": state.vmUser
                              },
                            ),
                          );
                        }
                        if (state is FaceIdAuthForUser) {
                          return buildUserCard(
                              state.vmUser,
                              () => Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    AppRouter.landingPage,
                                    (route) => false,
                                  ));
                        }
                        return FaceScanBox(
                            onCapture: (image) =>
                                BlocProvider.of<FaceIdAuthCubit>(context)
                                    .authenticateUser(image: image));
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          )
        ],
      ),
    );
  }

  buildUserCard(VMUser vmUser, Function onYes) {
    return Column(
      children: [
        Text(
          "Is this you?",
          style: TextStyle(
              color: AppColors.darkElv0,
              fontSize: 16.sp,
              fontWeight: FontWeight.bold),
        ),
        Text(
          vmUser.name,
          style: TextStyle(
              color: AppColors.darkElv0,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
        ),
        Text(
          vmUser.email,
          style: TextStyle(
            color: AppColors.darkElv1,
            fontSize: 12.sp,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () =>
                    BlocProvider.of<FaceIdAuthCubit>(context).tryAgain(),
                child: const Text("No")),
            ElevatedButton(onPressed: () => onYes(), child: const Text("Yes"))
          ],
        )
      ],
    );
  }
}
