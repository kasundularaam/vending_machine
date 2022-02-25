import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vending_machine/presentation/router/app_router.dart';

import '../../../../core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/cubit/pick_image_cubit/pick_image_cubit.dart';
import '../widgets/auth_button.dart';
import 'widgets/show_image_box.dart';

class TakePicturesPage extends StatefulWidget {
  const TakePicturesPage({Key? key}) : super(key: key);

  @override
  _TakePicturesPageState createState() => _TakePicturesPageState();
}

class _TakePicturesPageState extends State<TakePicturesPage> {
  List<File> imageList = [];
  File? image1;
  File? image2;
  File? image3;
  File? image4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Text(
                "Please position your face inside dotted face and capture ",
                style: TextStyle(
                    color: AppColors.lightElv0,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              decoration: BoxDecoration(
                  color: AppColors.lightElv0,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(5.w))),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocProvider(
                            create: (context) => PickImageCubit(),
                            child: ShowImageBox(
                              number: 1,
                              onCapture: (selfie1) => image1 = selfie1,
                            ),
                          ),
                          SizedBox(width: 3.w),
                          BlocProvider(
                            create: (context) => PickImageCubit(),
                            child: ShowImageBox(
                              onCapture: (selfie2) => image2 = selfie2,
                              number: 2,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 3.w),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BlocProvider(
                            create: (context) => PickImageCubit(),
                            child: ShowImageBox(
                              onCapture: (selfie3) => image3 = selfie3,
                              number: 3,
                            ),
                          ),
                          SizedBox(width: 3.w),
                          BlocProvider(
                            create: (context) => PickImageCubit(),
                            child: ShowImageBox(
                              onCapture: (selfie4) => image4 = selfie4,
                              number: 4,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Center(
                      child: AuthButton(
                          onPress: () {
                            if (image1 != null &&
                                image2 != null &&
                                image3 != null &&
                                image4 != null) {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  AppRouter.homePage, (route) => false);
                            }
                          },
                          text: "OK")),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
