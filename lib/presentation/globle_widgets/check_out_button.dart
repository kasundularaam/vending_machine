import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class CheckOutButton extends StatelessWidget {
  final Function onPress;
  final String text;
  const CheckOutButton({
    Key? key,
    required this.onPress,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.5.h),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(4.h),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0.5.w, 0.5.w),
                  color: AppColors.darkElv0.withOpacity(0.1),
                  spreadRadius: 0.1.w,
                  blurRadius: 0.1.w),
            ]),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.lightElv0,
            fontSize: 16.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
