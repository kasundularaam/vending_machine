import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/product.dart';
import '../../../globlal_widgets/check_out_button.dart';
import '../../../router/app_router.dart';

class HomeCard extends StatelessWidget {
  final Product product;
  const HomeCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: (() => showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(5.w),
                  ),
                ),
                backgroundColor: Colors.white,
                builder: (sheetContext) {
                  return Padding(
                    padding: EdgeInsets.all(5.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 15.w,
                          height: 1.2.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.h),
                            color: AppColors.lightElv2,
                          ),
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(3.w),
                              child: Image.asset(
                                "assets/images/${product.category.toString()}",
                                width: 30.w,
                                height: 30.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Wrap(children: [
                                    Text(
                                      product.title,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: AppColors.darkElv0,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    "${product.price}\$",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Wrap(children: [
                          Text(
                            product.lockerId,
                            style: TextStyle(
                              color: AppColors.darkElv1,
                              fontSize: 14.sp,
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 10.h,
                        ),
                        CheckOutButton(
                          onPress: () {
                            Navigator.pop(sheetContext);
                            Navigator.pushNamed(context, AppRouter.paymentPage,
                                arguments: product);
                          },
                          text: "Proceed To Pay",
                        )
                      ],
                    ),
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
                    "assets/images/${product.category.toString()}",
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
                          product.title,
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
                      "${product.price}\$",
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
                    product.lockerId,
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
