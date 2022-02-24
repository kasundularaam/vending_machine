import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/beverage.dart';

class HomeCard extends StatelessWidget {
  final Beverage beverage;
  const HomeCard({
    Key? key,
    required this.beverage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (() => showModalBottomSheet(
                context: context,
                builder: (sheetContext) {
                  return Container(
                    color: AppColors.primaryColor,
                    child: SizedBox(height: 30.h),
                  );
                },
              )),
          child: Container(
            padding: EdgeInsets.all(2.w),
            width: 45.w,
            height: 28.h,
            decoration: BoxDecoration(
              color: AppColors.lightElv0,
              borderRadius: BorderRadius.circular(3.w),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0.5.w, 0.5.w),
                    color: AppColors.darkElv0.withOpacity(0.1),
                    spreadRadius: 0.1.w,
                    blurRadius: 0.1.w),
              ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3.w),
                  child: Image.asset(
                    beverage.image,
                    height: 12.h,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Wrap(children: [
                        Text(
                          beverage.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.darkElv0,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      "${beverage.price}\$",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Wrap(children: [
                  Text(
                    beverage.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.darkElv0,
                      fontSize: 10.sp,
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
      ],
    );
  }
}
