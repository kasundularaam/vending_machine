import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/strings.dart';
import '../../../logic/cubit/device_id_cubit/device_id_cubit.dart';
import '../../router/app_router.dart';
import '../auth/widgets/auth_button.dart';
import '../auth/widgets/auth_input_text.dart';

class DeviceIdPage extends StatefulWidget {
  const DeviceIdPage({Key? key}) : super(key: key);

  @override
  State<DeviceIdPage> createState() => _DeviceIdPageState();
}

class _DeviceIdPageState extends State<DeviceIdPage> {
  TextEditingController deviceIdController = TextEditingController();

  set() => BlocProvider.of<DeviceIdCubit>(context)
      .setDeviceId(id: deviceIdController.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightElv1,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              Strings.logoWIthShapeImg,
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
                        "SETTING-UP MACHINE",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Device Id",
                      style: TextStyle(
                        color: AppColors.darkElv1,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AuthInputText(
                      controller: deviceIdController,
                      hintText: "1234",
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                      child: BlocConsumer<DeviceIdCubit, DeviceIdState>(
                        listener: (context, state) {
                          if (state is DeviceIdFailed) {
                            SnackBar snackBar =
                                SnackBar(content: Text(state.errorMsg));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          if (state is DeviceIdSucceed) {
                            Navigator.pushNamedAndRemoveUntil(context,
                                AppRouter.landingPage, (route) => false);
                          }
                        },
                        builder: (context, state) {
                          if (state is DeviceIdLoading) {
                            return const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            );
                          }
                          return AuthButton(
                            text: "SET",
                            onPress: () => set(),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
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
}
