import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:vending_machine/data/models/vm_user.dart';
import 'package:vending_machine/presentation/screens/payments/select_payment_method_screen/widgets/card_details_form.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/new_cart_item.dart';
import '../../../../data/models/product.dart';
import '../../../../logic/cubit/purchase_cubit/purchase_cubit.dart';
import '../../../../logic/cubit/timer_cubit/timer_cubit.dart';
import '../../../router/app_router.dart';
import '../widgets/order_details_card.dart';

class ViaCardPage extends StatefulWidget {
  final Product product;
  final VMUser user;
  const ViaCardPage({
    Key? key,
    required this.product,
    required this.user,
  }) : super(key: key);

  @override
  State<ViaCardPage> createState() => _ViaCardPageState();
}

class _ViaCardPageState extends State<ViaCardPage> {
  Product get product => widget.product;
  VMUser get user => widget.user;

  pay() {
    final NewCartItem cartItem = NewCartItem(
        user: user.id,
        item: product.id,
        status: "PAID",
        device: product.lockerId,
        quantity: 1);
    BlocProvider.of<PurchaseCubit>(context).purchase(item: cartItem);
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
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
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
                      child: CardDetailsForm(
                        onValidPress: () => (pay()),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
