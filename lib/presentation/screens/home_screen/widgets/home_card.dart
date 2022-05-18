import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/product.dart';
import '../../../global_widgets/check_out_button.dart';
import '../../../router/app_router.dart';

class HomeCard extends StatelessWidget {
  final Product product;
  final String categoryTitle;
  const HomeCard({
    Key? key,
    required this.product,
    required this.categoryTitle,
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
                                "assets/${product.category.toString()}.png",
                                width: 45.w,
                                height: 45.w,
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
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    categoryTitle,
                                    style: TextStyle(
                                      color: AppColors.darkElv1,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
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
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3.w),
            child: Container(
              width: 45.w,
              height: 28.h,
              decoration: BoxDecoration(
                color: AppColors.lightElv0,
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
                  Stack(
                    children: [
                      Image.asset(
                        "assets/${product.category.toString()}.png",
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        top: 2.w,
                        right: 1.w,
                        child: Container(
                          padding: EdgeInsets.all(2.w),
                          decoration: const BoxDecoration(
                            color: AppColors.lightElv0,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            product.lockerId,
                            style: TextStyle(
                              color: AppColors.darkElv0,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              product.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.darkElv0,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "${product.price}\$",
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
