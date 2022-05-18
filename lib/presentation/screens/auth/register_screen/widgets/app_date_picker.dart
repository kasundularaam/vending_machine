import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constants/app_colors.dart';

class AppDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  const AppDatePicker({
    Key? key,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  final Color borderColor = AppColors.darkElv0.withOpacity(0.4);
  final Color contentColor = AppColors.darkElv0.withOpacity(0.5);
  String dobText = "Date Of Birth";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 100, 1),
        lastDate: DateTime(DateTime.now().year + 1),
      ).then((date) {
        if (date != null) {
          setState(() {
            dobText = "${date.year}-${date.month}-${date.day}";
          });
          widget.onDateSelected(date);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Date not picked!")));
        }
      }),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.2.w,
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(2.w),
        ),
        child: Row(
          children: [
            Icon(
              Icons.calendar_today_rounded,
              color: contentColor,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              dobText,
              style: TextStyle(
                  color: dobText != "Date Of Birth"
                      ? AppColors.darkElv0
                      : contentColor,
                  fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
