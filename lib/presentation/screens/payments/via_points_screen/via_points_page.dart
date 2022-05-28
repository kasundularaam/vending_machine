import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:vending_machine/data/models/product.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../logic/cubit/timer_cubit/timer_cubit.dart';
import '../../../router/app_router.dart';
import '../widgets/order_details_card.dart';

class ViaPointsPage extends StatefulWidget {
  final Product product;
  const ViaPointsPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ViaPointsPage> createState() => _ViaPointsPageState();
}

class _ViaPointsPageState extends State<ViaPointsPage> {
  Product get product => widget.product;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: AppColors.lightElv0,
                    size: 22.sp,
                  ),
                ),
              ),
              OrderDetailsCard(product: product),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.lightElv1,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(5.w))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          "Via Points",
                          style: TextStyle(
                              color: AppColors.darkElv1,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
