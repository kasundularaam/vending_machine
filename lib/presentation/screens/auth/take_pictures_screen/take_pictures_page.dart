import 'dart:io';

import 'package:flutter/material.dart';
import 'package:vending_machine/presentation/screens/auth/take_pictures_screen/widgets/show_image_box.dart';
import 'package:vending_machine/presentation/screens/auth/widgets/auth_button.dart';

import '../../../../core/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class TakePicturesPage extends StatefulWidget {
  const TakePicturesPage({Key? key}) : super(key: key);

  @override
  _TakePicturesPageState createState() => _TakePicturesPageState();
}

class _TakePicturesPageState extends State<TakePicturesPage> {
  List<File> imageList = [];
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
                          ShowImageBox(
                            number: 1,
                          ),
                          SizedBox(width: 3.w),
                          ShowImageBox(
                            number: 2,
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
                          ShowImageBox(
                            number: 3,
                          ),
                          SizedBox(width: 3.w),
                          ShowImageBox(
                            number: 4,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Center(child: AuthButton(onPress: () {}, text: "OK")),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
