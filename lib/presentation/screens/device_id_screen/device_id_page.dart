import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../logic/cubit/device_id_cubit/device_id_cubit.dart';
import '../../router/app_router.dart';

class DeviceIdPage extends StatefulWidget {
  const DeviceIdPage({Key? key}) : super(key: key);

  @override
  State<DeviceIdPage> createState() => _DeviceIdPageState();
}

class _DeviceIdPageState extends State<DeviceIdPage> {
  TextEditingController deviceIdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Text(
            "Set Device Id",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 16.sp,
            ),
          ),
          TextField(
            controller: deviceIdController,
          ),
          BlocConsumer<DeviceIdCubit, DeviceIdState>(
            listener: (context, state) {
              if (state is DeviceIdFailed) {
                SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
              if (state is DeviceIdSucceed) {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRouter.landingPage, (route) => false);
              }
            },
            builder: (context, state) {
              if (state is DeviceIdLoading) {
                return const CircularProgressIndicator(
                    color: AppColors.primaryColor);
              }
              return ElevatedButton(onPressed: () => {}, child: Text("SET"));
            },
          )
        ],
      )),
    );
  }
}
