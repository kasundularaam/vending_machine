import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:vending_machine/data/models/beverage.dart';
import 'package:vending_machine/presentation/router/app_router.dart';
import 'package:vending_machine/presentation/screens/payment_screen/widgets/payment_method_card.dart';

import '../../../core/constants/app_colors.dart';
import '../../globlal_widgets/check_out_button.dart';

class PaymentPage extends StatefulWidget {
  final Beverage beverage;
  const PaymentPage({
    Key? key,
    required this.beverage,
  }) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          widget.beverage.image,
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
                                widget.beverage.name,
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
                              "${widget.beverage.price}\$",
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
                    SizedBox(
                      height: 4.h,
                    ),
                    InkWell(
                      onTap: (() => Navigator.pushNamed(
                            context,
                            AppRouter.addPaymentMethodPage,
                          )),
                      child: Text(
                        "add payment methods",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                        ),
                      ),
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
    );
  }
}
