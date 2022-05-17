import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../logic/cubit/pick_image_cubit/pick_image_cubit.dart';

class FaceScanBox extends StatelessWidget {
  final Function(File) onCapture;
  const FaceScanBox({
    Key? key,
    required this.onCapture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => BlocProvider.of<PickImageCubit>(context).pickImage(),
      child: BlocListener<PickImageCubit, PickImageState>(
        listener: (context, state) {
          if (state is PickImageFailed) {
            SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else if (state is PickImagePicked) {
            onCapture(state.file);
          }
        },
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(2.w),
              width: 100.w,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(5.w)),
              child: Image.asset(
                "assets/selfie.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              "Touch here to scan face",
              style: TextStyle(
                color: AppColors.darkElv1,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
