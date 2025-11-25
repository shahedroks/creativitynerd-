import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_scanner/core/constants/color_control/all_color.dart';

class ProcessingPopup extends StatelessWidget {
  final String title;
  final String subtitle;
  final String statusText;

  const ProcessingPopup({
    super.key,
    this.title = "Processing...",
    this.subtitle = "This may take a few moments",
    this.statusText = "Recognizing...",
  });

  static Future<void> show(BuildContext context,
      {String? title, String? subtitle, String? statusText}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.35),
      builder: (_) => ProcessingPopup(
        title: title ?? "Processing...",
        subtitle: subtitle ?? "This may take a few moments",
        statusText: statusText ?? "Recognizing...",
      ),
    );
  }

  static void hide(BuildContext context) {
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: 320.w,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: "sf_Pro",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: AllColor.black,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                subtitle,
                style: TextStyle(
                  fontFamily: "sf_Pro",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AllColor.iconColor
                ),
              ),
              SizedBox(height: 20.h),

              // progress bar (same feel as screenshot)
              ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: SizedBox(
                  height: 5.h,
                  child: LinearProgressIndicator(
                    minHeight: 5.h,
                    backgroundColor: AllColor.iconColor, // light gray track
                    color: AllColor.primary,           // blue moving segment
                  ),
                ),
              ),

              SizedBox(height: 12.h),
              Center(
                child: Text(
                  statusText,
                  style: TextStyle(
                    fontFamily: "sf_Pro",
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    color: AllColor.iconColor,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}
