import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';

class PaymentMethodCard extends StatelessWidget {
  final String image;
  final String number;
  final bool selected;
  const PaymentMethodCard({
    Key? key,
    required this.image,
    required this.number,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: AppColors.lightElv1,
        borderRadius: BorderRadius.circular(
          3.w,
        ),
      ),
      child: Row(
        children: [
          Image.asset(image),
          SizedBox(
            width: 3.w,
          ),
          Expanded(
            child: Text(number),
          ),
          Image.asset(
              selected ? "assets/selected.png" : "assets/not_selected.png"),
        ],
      ),
    );
  }
}
