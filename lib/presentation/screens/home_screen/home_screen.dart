import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vending_machine/core/constants/app_colors.dart';
import 'package:vending_machine/data/data_providers/data_provider.dart';
import 'package:vending_machine/presentation/screens/home_screen/widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
