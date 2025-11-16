import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:pdf_scanner/core/constants/color_control/all_color.dart';
import 'package:pdf_scanner/features/files/screen/files_screen.dart';

class PersonalDocumentsScreen extends StatelessWidget {
  const PersonalDocumentsScreen({super.key});

  static const String routeName = '/personalDocuments';

  @override
  Widget build(BuildContext context) {
    final docs = List.generate(
      3,
          (i) => const _DocItem(
        title: '04 Aug, document 1',
        pages: 25,
        sizeKb: 536,
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFF4F7FB),
        centerTitle: true,
        leadingWidth: 52.w,
        leading: IconButton(
          onPressed: () {
            context.push(FilesScreen.routeName);
          },
          icon: Icon(
            CupertinoIcons.back,
            color: AllColor.black,
            size: 20.sp,
          ),
        ),
        title: Text(
          'Personal Documents',
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w600,
            color: AllColor.black,
            fontFamily: 'sf_Pro',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              CupertinoIcons.arrow_up_arrow_down,
              color: AllColor.black,
              size: 20.sp,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              color: AllColor.black,
              size: 20.sp,
            ),
          ),
          SizedBox(width: 4.w),
        ],
      ),
      body: Stack(
        children: [
          // Documents list
          ListView.separated(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 120.h),
            itemCount: docs.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (context, index) {
              final item = docs[index];
              return _DocumentCard(item: item);
            },
          ),

          // Bottom success banner
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: 16.h + MediaQuery.of(context).padding.bottom,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: AllColor.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      color: AllColor.primary,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      'Your documents successfully moved',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AllColor.black,
                        fontFamily: 'sf_Pro',
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Simple data model for a document
class _DocItem {
  final String title;
  final int pages;
  final int sizeKb;

  const _DocItem({
    required this.title,
    required this.pages,
    required this.sizeKb,
  });
}

class _DocumentCard extends StatelessWidget {
  final _DocItem item;

  const _DocumentCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AllColor.black.withOpacity(0.03),
            blurRadius: 10.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      child: Row(
        children: [
          // Thumbnail with grey border (fixed: color moved into BoxDecoration)
          Container(
            width: 58.w,
            height: 58.h,
            decoration: BoxDecoration(
              color: AllColor.white,
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                width: 2.w,
                color: AllColor.gery,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Image.asset(
                'assets/images/books.png',
                width: 58.w,
                height: 58.h,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // Text info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: AllColor.black,
                    fontFamily: 'sf_Pro',
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      '${item.pages} pages',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AllColor.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'sf_Pro',
                      ),
                    ),
                    Text(
                      '  •  ',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AllColor.black,
                        fontFamily: 'sf_Pro',
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      '${item.sizeKb} KB',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AllColor.black,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'sf_Pro',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // More icon
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              size: 22.sp,
              color: AllColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
