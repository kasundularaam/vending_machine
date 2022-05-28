import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:vending_machine/data/models/vm_user.dart';
import 'package:vending_machine/presentation/router/app_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../data/models/product.dart';

class MethodCard extends StatelessWidget {
  final Product product;
  final VMUser vmUser;
  const MethodCard({
    Key? key,
    required this.product,
    required this.vmUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Row(
          children: [
            Expanded(
                child: Text(
              "Via Card",
              style: TextStyle(
                  color: AppColors.darkElv0,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold),
            )),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(
                  context, AppRouter.viaCardPage,
                  arguments: {"product": product, "user": vmUser}),
              child: Text(
                "Pay",
                style: TextStyle(
                    color: AppColors.lightElv0,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
