import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vending_machine/data/models/product.dart';

import '../../../../core/constants/app_colors.dart';

class OrderDetailsCard extends StatelessWidget {
  final Product product;
  const OrderDetailsCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: AppColors.lightElv0,
        borderRadius: BorderRadius.circular(3.w),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You Ordered",
                  style: TextStyle(
                    color: AppColors.darkElv0,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Wrap(children: [
                  Text(
                    product.title,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.darkElv0,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "${product.price}\$",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(3.w),
            child: Image.asset(
              "assets/${product.category.toString()}.png",
              width: 25.w,
              height: 25.w,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
