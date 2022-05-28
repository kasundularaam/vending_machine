import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../data/models/product.dart';
import '../../../../../data/models/vm_user.dart';
import '../../../../router/app_router.dart';

class MethodPoints extends StatelessWidget {
  final Product product;
  final VMUser vmUser;
  const MethodPoints({
    Key? key,
    required this.product,
    required this.vmUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Balance: ",
                  style: TextStyle(
                      color: AppColors.darkElv0,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  "Rs.${vmUser.balance}",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
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
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(
                      context, AppRouter.viaPointsPage,
                      arguments: {"product": product, "user": vmUser}),
                  child: Text(
                    "Pay",
                    style: TextStyle(
                      color: AppColors.lightElv0,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
