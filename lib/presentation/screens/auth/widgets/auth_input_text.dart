import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:vending_machine/core/constants/app_colors.dart';

class AuthInputText extends StatelessWidget {
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool? isPassword;
  final String hintText;
  const AuthInputText({
    Key? key,
    this.onChanged,
    this.focusNode,
    required this.controller,
    this.textInputAction,
    this.textInputType,
    this.isPassword,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightElv1,
        borderRadius: BorderRadius.circular(2.w),
        boxShadow: [
          BoxShadow(
              offset: Offset(0.5.w, 0.5.w),
              color: AppColors.darkElv0.withOpacity(0.1),
              spreadRadius: 0.1.w,
              blurRadius: 0.1.w),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ?? false,
        onChanged: onChanged,
        focusNode: focusNode,
        keyboardType: textInputType,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.darkElv0,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.darkElv0.withOpacity(0.7),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
          border: InputBorder.none,
        ),
        textInputAction: textInputAction,
      ),
    );
  }
}
