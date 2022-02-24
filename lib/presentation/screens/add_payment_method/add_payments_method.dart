import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../globle_widgets/check_out_button.dart';

class AddPaymentMethodPage extends StatefulWidget {
  const AddPaymentMethodPage({Key? key}) : super(key: key);

  @override
  _AddPaymentMethodPageState createState() => _AddPaymentMethodPageState();
}

class _AddPaymentMethodPageState extends State<AddPaymentMethodPage> {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (() => Navigator.pop(context)),
              child: Padding(
                padding: EdgeInsets.all(2.w),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 22.sp,
                  color: AppColors.lightElv0,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                "Add credit/debit card",
                style: TextStyle(
                  color: AppColors.lightElv0,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(
                  5.w,
                ),
                decoration: BoxDecoration(
                  color: AppColors.lightElv0,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(
                      5.w,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                        color: AppColors.darkElv1,
                        fontSize: 14.sp,
                      ),
                    ),
                    TextField(
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                      decoration: InputDecoration(
                        hintText: "Valentine Morris",
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.darkElv0.withOpacity(0.7),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "Credit/Debit card number",
                      style: TextStyle(
                        color: AppColors.darkElv1,
                        fontSize: 14.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: nameController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: 14.sp,
                            ),
                            decoration: InputDecoration(
                              hintText: "5415   2424   2421   8394",
                              hintStyle: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.darkElv0.withOpacity(0.7),
                              ),
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 1.h),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Image.asset("assets/visa.png"),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expire",
                                style: TextStyle(
                                  color: AppColors.darkElv1,
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextField(
                                controller: nameController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                                decoration: InputDecoration(
                                  hintText: "04/26",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.darkElv0.withOpacity(0.7),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 1.h),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CVV",
                                style: TextStyle(
                                  color: AppColors.darkElv1,
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextField(
                                controller: nameController,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                                decoration: InputDecoration(
                                  hintText: "463",
                                  hintStyle: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.darkElv0.withOpacity(0.7),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 1.h),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Center(child: CheckOutButton(onPress: () {}, text: "Save"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
