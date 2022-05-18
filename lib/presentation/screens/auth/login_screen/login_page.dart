import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/strings.dart';
import '../../../../logic/cubit/login_cubit/login_cubit.dart';
import '../../../router/app_router.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_input_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() {
    BlocProvider.of<LoginCubit>(context)
        .login(email: emailController.text, password: passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightElv1,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              Strings.logoWIthShapeImg,
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
                        "LOGIN",
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
                    Center(
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginFailed) {
                            SnackBar snackBar =
                                SnackBar(content: Text(state.errorMsg));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                          if (state is LoginUser) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRouter.landingPage,
                              (route) => false,
                            );
                          }
                          if (state is LoginAdmin) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRouter.deviceIdPage,
                              (route) => false,
                            );
                          }
                          if (state is LoginToMachine) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRouter.homePage,
                              (route) => false,
                              arguments: {
                                "deviceId": state.deviceId,
                                "vmUser": state.vmUser
                              },
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            );
                          }
                          return AuthButton(
                            text: "LOGIN",
                            onPress: () => login(),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      children: [
                        const Expanded(
                            child: Divider(
                          color: AppColors.darkElv1,
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Text(
                            "OR",
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const Expanded(
                            child: Divider(
                          color: AppColors.darkElv1,
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                      child: AuthButton(
                        text: "Scan Face",
                        onPress: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRouter.faceIdAuthPage,
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
                              text: "Have't an account? ",
                              style: TextStyle(
                                color: AppColors.darkElv0,
                                fontSize: 12.sp,
                              ),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        AppRouter.registerPage,
                                        (route) => false),
                              text: "REGISTER",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700,
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
