import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:vending_machine/data/models/new_cart_item.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../data/models/product.dart';
import '../../../../../data/models/vm_user.dart';
import '../../../../../logic/cubit/purchase_cubit/purchase_cubit.dart';
import '../../../../router/app_router.dart';

class MethodPoints extends StatefulWidget {
  final Product product;
  final VMUser vmUser;
  const MethodPoints({
    Key? key,
    required this.product,
    required this.vmUser,
  }) : super(key: key);

  @override
  State<MethodPoints> createState() => _MethodPointsState();
}

class _MethodPointsState extends State<MethodPoints> {
  Product get product => widget.product;
  VMUser get user => widget.vmUser;
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
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Balance: ",
                        style: TextStyle(
                            color: AppColors.darkElv0,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Rs.${widget.vmUser.balance}",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRouter.rechargePage),
                    child: const Text(
                      "Recharge",
                      style: TextStyle(color: AppColors.lightElv0),
                    ))
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            const Divider(),
            SizedBox(
              height: 1.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Via Points",
                  style: TextStyle(
                      color: AppColors.darkElv0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold),
                )),
                BlocConsumer<PurchaseCubit, PurchaseState>(
                  listener: (context, state) {
                    if (state is PurchaseFailed) {
                      SnackBar snackBar =
                          SnackBar(content: Text(state.errorMsg));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    if (state is PurchaseMachine) {
                      SnackBar snackBar = const SnackBar(
                          content: Text("Purchased successfully"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRouter.landingPage, (route) => false);
                    }
                    if (state is PurchaseUser) {
                      SnackBar snackBar = const SnackBar(
                          content: Text("Purchased successfully"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, state) {
                    if (state is PurchaseLoading) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () => pay(),
                      child: Text(
                        "Pay",
                        style: TextStyle(
                          color: AppColors.lightElv0,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
