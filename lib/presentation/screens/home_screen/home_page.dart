import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vending_machine/data/models/product.dart';
import 'package:vending_machine/data/models/product_category.dart';
import 'package:vending_machine/logic/cubit/products_cubit/products_cubit.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/data_providers/data_provider.dart';
import '../../../logic/cubit/timer_cubit/timer_cubit.dart';
import '../../router/app_router.dart';
import 'widgets/home_card.dart';

class HomePage extends StatelessWidget {
  final String deviceId;
  const HomePage({
    Key? key,
    required this.deviceId,
  }) : super(key: key);

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
                      BlocConsumer<ProductsCubit, ProductsState>(
                        listener: (context, state) {
                          if (state is ProductsFailed) {
                            SnackBar snackBar =
                                SnackBar(content: Text(state.errorMsg));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        builder: (context, state) {
                          if (state is ProductsLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.primaryColor),
                            );
                          }
                          if (state is ProductsLoaded) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: ListView.builder(
                                  itemBuilder: (context, index) {
                                final ProductCategory category =
                                    state.categories[index];
                                final List<Product> products = [];
                                for (var product in state.products) {
                                  if (product.category == category.id) {
                                    products.add(product);
                                  }
                                }
                                return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Text(
                                        state.categories[index].title,
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
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: products.length,
                                          itemBuilder: (context, index) {
                                            return HomeCard(
                                                product: products[index]);
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                    ]);
                              }),
                            );
                          }
                          return const SizedBox();
                        },
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
