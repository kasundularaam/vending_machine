import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constants/app_colors.dart';

class ShowImageBox extends StatelessWidget {
  final int number;
  const ShowImageBox({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
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
      ),
    );
  }
}
