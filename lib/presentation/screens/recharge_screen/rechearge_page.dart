import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_colors.dart';
import '../payments/select_payment_method_screen/widgets/card_details_form.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({Key? key}) : super(key: key);

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
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
            Expanded(
              child: ListView(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.lightElv1,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(5.w),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: CardDetailsForm(onValidPress: () => {}),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
