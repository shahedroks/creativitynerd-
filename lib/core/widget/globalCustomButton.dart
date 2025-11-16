import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_control/all_color.dart';

class GlobalCustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? height;
  final double? fontSize;
  final FontWeight? fontWeight;

  const GlobalCustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height ?? 54.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AllColor.primary,
          shape: const StadiumBorder(),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize ?? 17.sp,
            fontWeight: fontWeight ?? FontWeight.w600,
            fontFamily: "sf_Pro",
            color: textColor ?? AllColor.white,
          ),
        ),
      ),
    );
  }
}
