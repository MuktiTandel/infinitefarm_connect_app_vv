import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({
    Key? key,
    required this.backImage,
    required this.title,
    required this.actionTitle
  }) : super(key: key);

  final String backImage;
  final String title;
  final String actionTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(
              left: 15.w,
              top: 9.h,
              bottom: 9.h
          ),
          child: GestureDetector(
            child: Container(
              width: 20.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.light_blue.withOpacity(0.05)
              ),
              child: Center(
                child: SvgPicture.asset(
                  backImage,
                  height: 15.h,
                  width: 15.w,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontFamily: 'Archia',
            fontWeight: FontWeight.w600
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                top: 10.h,
                bottom: 10.h,
                right: 20.w
            ),
            child: GestureDetector(
              child: Container(
                width: 65.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.blue.withOpacity(0.1)
                ),
                child: Center(
                    child: Text(
                      actionTitle,
                      style: TextStyle(
                          color: AppColors.blue,
                          fontSize: 15.sp,
                          fontFamily: 'Archia',
                        fontWeight: FontWeight.w500
                      ),
                    )
                ),
              ),
            ),
          ),
        ]
    );
  }
}
