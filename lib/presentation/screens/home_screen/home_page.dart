import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/converters/converters.dart';
import '../../../data/models/product.dart';
import '../../../data/models/product_category.dart';
import '../../../data/models/vm_user.dart';
import '../../../logic/cubit/products_cubit/products_cubit.dart';
import '../../../logic/cubit/sign_out_cubit/sign_out_cubit.dart';
import '../../../logic/cubit/timer_cubit/timer_cubit.dart';
import '../../router/app_router.dart';
import 'widgets/home_card.dart';

class HomePage extends StatefulWidget {
  final String deviceId;
  final VMUser vmUser;
  const HomePage({
    Key? key,
    required this.deviceId,
    required this.vmUser,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String get deviceId => widget.deviceId;
  VMUser get vmUser => widget.vmUser;
  @override
  void initState() {
    BlocProvider.of<ProductsCubit>(context).load(deviceId: deviceId);
    BlocProvider.of<TimerCubit>(context).activate(seconds: 90);
    super.initState();
  }

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
          child: Container(
            color: AppColors.lightElv1,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(5.w),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () => showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(5.w),
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                  builder: (sheetContext) {
                                    return BlocProvider(
                                      create: (context) => SignOutCubit(),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.w),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ClipOval(
                                              child: Image.asset(
                                                "assets/profile.png",
                                                width: 30.w,
                                                height: 30.w,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.w,
                                                  vertical: 4.h),
                                              child: const Divider(
                                                color: AppColors.darkElv1,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Name:",
                                                  style: TextStyle(
                                                      color: AppColors.darkElv0,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    vmUser.name,
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkElv1,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 2.h),
                                            Row(
                                              children: [
                                                Text(
                                                  "Email:",
                                                  style: TextStyle(
                                                      color: AppColors.darkElv0,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    vmUser.email,
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkElv1,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 2.h),
                                            Row(
                                              children: [
                                                Text(
                                                  "Age:",
                                                  style: TextStyle(
                                                      color: AppColors.darkElv0,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    age(vmUser.dob),
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkElv1,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 2.h),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    "remove account from this device:",
                                                    style: TextStyle(
                                                        color:
                                                            AppColors.darkElv1,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                BlocConsumer<SignOutCubit,
                                                    SignOutState>(
                                                  listener: (context, state) {
                                                    if (state
                                                        is SignOutFailed) {
                                                      SnackBar snackBar =
                                                          SnackBar(
                                                              content: Text(state
                                                                  .errorMsg));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    }
                                                    if (state
                                                        is SignOutSucceed) {
                                                      Navigator
                                                          .pushNamedAndRemoveUntil(
                                                        context,
                                                        AppRouter.landingPage,
                                                        (route) => false,
                                                      );
                                                    }
                                                  },
                                                  builder: (context, state) {
                                                    return ElevatedButton(
                                                      onPressed: () => BlocProvider
                                                              .of<SignOutCubit>(
                                                                  context)
                                                          .signOut(),
                                                      child: const Text(
                                                        "SIGN OUT",
                                                        style: TextStyle(
                                                            color: AppColors
                                                                .lightElv0),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/profile.png",
                                    width: 12.w,
                                    height: 12.w,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                "Vending Machine",
                                style: TextStyle(
                                    color: AppColors.lightElv0,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 22.w,
                            child: Image.asset(
                              "assets/logo_light.png",
                              fit: BoxFit.fitWidth,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  "Balance: ",
                                  style: TextStyle(
                                      color: AppColors.lightElv0,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Rs.${vmUser.balance}",
                                  style: TextStyle(
                                    color: AppColors.lightElv0,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          TextButton(
                            onPressed: () => {},
                            child: Text(
                              "Recharge",
                              style: TextStyle(
                                  color: AppColors.lightElv0,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      SizedBox(
                        height: 2.h,
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
                          log(state.toString());
                          if (state is ProductsLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.primaryColor),
                            );
                          }
                          if (state is ProductsLoaded) {
                            return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.categories.length,
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
                                      Text(
                                        category.title,
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
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return HomeCard(
                                              product: products[index],
                                              categoryTitle: category.title,
                                              vmUser: vmUser,
                                            );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                    ],
                                  );
                                });
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
