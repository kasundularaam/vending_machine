import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/product.dart';
import '../../../../data/payment_services/payment_services.dart';
import '../../../../logic/cubit/timer_cubit/timer_cubit.dart';
import '../../../router/app_router.dart';
import '../../auth/widgets/auth_button.dart';
import '../widgets/order_details_card.dart';

class ViaCardPage extends StatefulWidget {
  final Product product;
  const ViaCardPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ViaCardPage> createState() => _ViaCardPageState();
}

class _ViaCardPageState extends State<ViaCardPage> {
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: AuthButton(
                            onPress: () async {
                              PaymentServices.makePayment(
                                  amount: product.price, currency: 'LKR');
                            },
                            text: "PAY",
                          ),
                        )
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
