import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_scanner/core/constants/color_control/all_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;
  final String? actionText;
  final VoidCallback? onActionTap;
  final bool centerTitle;
  final Color backgroundColor;
  final bool showBottomBorder;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.onBack,
    this.actionText,
    this.onActionTap,
    this.centerTitle = false,
    this.backgroundColor = Colors.white,
    this.showBottomBorder = true,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        border: showBottomBorder
            ? Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        )
            : null,
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            children: [
              // Back button
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AllColor.black,
                  size: 20.sp,
                ),
                onPressed: onBack ?? () => Navigator.of(context).pop(),
              ),

              // Title
              Expanded(
                child: centerTitle
                    ? Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: "sf_Pro",
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                      color: AllColor.black,
                    ),
                  ),
                )
                    : Padding(
                  padding: EdgeInsets.only(left: 12.w),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: "sf_Pro",
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                      color: AllColor.black,
                    ),
                  ),
                ),
              ),

              // Action text (e.g. Done)
              if (actionText != null)
                TextButton(
                  onPressed: onActionTap,
                  child: Text(
                    actionText!,
                    style: TextStyle(
                      fontFamily: "sf_Pro",
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                      color: AllColor.black,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
