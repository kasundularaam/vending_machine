import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/data_providers/data_provider.dart';
import '../../../logic/cubit/timer_cubit/timer_cubit.dart';
import '../../router/app_router.dart';
import 'widgets/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerCubit, TimerState>(
      listener: (context, state) {
        if (state is TimerTimeout) {
          SnackBar snackBar = const SnackBar(content: Text("Time out!"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pushNamedAndRemoveUntil(
              context, AppRouter.landingPage, (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                color: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 1.2.h, horizontal: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "assets/profile.png",
                        width: 10.w,
                        height: 10.w,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(1.5.w),
                      decoration: BoxDecoration(
                          color: AppColors.lightElv0.withOpacity(0.3),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.search_rounded,
                        color: AppColors.lightElv0,
                        size: 22.sp,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: AppColors.lightElv1,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5.w),
                            bottomRight: Radius.circular(5.w),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Lorem Ipsum!",
                                        style: TextStyle(
                                            color: AppColors.lightElv0,
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Wrap(children: [
                                        Text(
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
                                          style: TextStyle(
                                            color: AppColors.lightElv0,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ])
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  "assets/logo_light.png",
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Soft Drinks:",
                              style: TextStyle(
                                color: AppColors.darkElv0,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              width: 100.w,
                              height: 29.h,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: DataProvider.beverages.length,
                                itemBuilder: (context, index) {
                                  return HomeCard(
                                      beverage: DataProvider.beverages[index]);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "Special Drinks:",
                              style: TextStyle(
                                color: AppColors.darkElv0,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            SizedBox(
                              width: 100.w,
                              height: 29.h,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: DataProvider.beverages.length,
                                itemBuilder: (context, index) {
                                  return HomeCard(
                                    beverage: DataProvider.beverages[index],
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
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
    );
  }
}
