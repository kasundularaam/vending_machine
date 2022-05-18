import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../logic/cubit/pick_image_cubit/pick_image_cubit.dart';

class ShowImageBox extends StatelessWidget {
  final int number;
  final String fileName;
  final Function(File) onCapture;
  const ShowImageBox({
    Key? key,
    required this.number,
    required this.fileName,
    required this.onCapture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: GestureDetector(
        onTap: () => BlocProvider.of<PickImageCubit>(context)
            .pickImage(fileName: fileName),
        child: BlocConsumer<PickImageCubit, PickImageState>(
          listener: (context, state) {
            if (state is PickImageFailed) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (state is PickImagePicked) {
              onCapture(state.file);
            }
          },
          builder: (context, state) {
            if (state is PickImagePicked) {
              return SizedBox(
                height: 30.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.w),
                  child: Image.file(state.file),
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.all(2.w),
                height: 30.h,
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(5.w)),
                child: Column(
                  children: [
                    Image.asset("assets/selfie.png"),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "$number",
                      style: TextStyle(
                        color: AppColors.lightElv0,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
