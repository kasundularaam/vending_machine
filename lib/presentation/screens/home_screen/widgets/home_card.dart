import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vending_machine/presentation/router/app_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/beverage.dart';
import '../../../globlal_widgets/check_out_button.dart';

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
                                beverage.image,
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
                                      beverage.name,
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
                                    "${beverage.price}\$",
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
                            beverage.description,
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
                                arguments: beverage);
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
