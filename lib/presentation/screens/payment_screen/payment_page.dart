import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/product.dart';
import '../../../logic/cubit/timer_cubit/timer_cubit.dart';
import '../../globlal_widgets/check_out_button.dart';
import '../../router/app_router.dart';
import 'widgets/payment_method_card.dart';

class PaymentPage extends StatefulWidget {
  final Product product;
  const PaymentPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Product get product => widget.product;

  @override
  void initState() {
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
              Container(
                margin: EdgeInsets.all(5.w),
                padding: EdgeInsets.all(5.w),
                decoration: BoxDecoration(
                  color: AppColors.lightElv0,
                  borderRadius: BorderRadius.circular(3.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You Ordered",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                      color: AppColors.lightElv0,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(5.w))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "payment methods",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const PaymentMethodCard(
                        image: "assets/visa.png",
                        number: "***345",
                        selected: true,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      const PaymentMethodCard(
                        image: "assets/mastercard.png",
                        number: "***345",
                        selected: false,
                      ),
                      SizedBox(height: 5.h),
                      CheckOutButton(onPress: () {}, text: "Pay Now")
                    ],
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
