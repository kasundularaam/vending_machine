import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../router/app_router.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_input_text.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightElv1,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              "assets/logo_with_shape.png",
              width: 100.w,
              fit: BoxFit.fitWidth,
            ),
          ),
          ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            children: [
              SizedBox(
                height: 38.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: AppColors.lightElv0,
                  borderRadius: BorderRadius.circular(3.w),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0.w, 0.w),
                      color: AppColors.darkElv0.withOpacity(0.1),
                      spreadRadius: 0.3.w,
                      blurRadius: 0.3.w,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "REGISTER",
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Name",
                      style: TextStyle(
                        color: AppColors.darkElv1,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AuthInputText(
                      controller: nameController,
                      hintText: "Valentine Morris",
                      textInputType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Age",
                      style: TextStyle(
                        color: AppColors.darkElv1,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AuthInputText(
                      controller: ageController,
                      hintText: "26",
                      textInputType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Email",
                      style: TextStyle(
                        color: AppColors.darkElv1,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AuthInputText(
                      controller: emailController,
                      hintText: "ValentineMorris@gmail.com",
                      textInputType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Password",
                      style: TextStyle(
                        color: AppColors.darkElv1,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AuthInputText(
                      isPassword: true,
                      controller: passwordController,
                      hintText: "* * * * * *",
                      textInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      "Confirm Password",
                      style: TextStyle(
                        color: AppColors.darkElv1,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    AuthInputText(
                      isPassword: true,
                      controller: confirmPasswordController,
                      hintText: "* * * * * *",
                      textInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                      child: AuthButton(
                        text: "REGISTER",
                        onPress: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRouter.takePicturesPage,
                          (route) => false,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Have an account already? ",
                              style: TextStyle(
                                color: AppColors.darkElv0,
                                fontSize: 12.sp,
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        AppRouter.loginPage, (route) => false),
                              text: "LOGIN",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
            ],
          )
        ],
      ),
    );
  }
}
