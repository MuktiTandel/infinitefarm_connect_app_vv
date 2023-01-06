import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';

Widget bottomsheetContainer(double height, Widget column) {
  return Container(
    height: height,
    decoration:
    BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
        ),
        color: Get.isDarkMode
            ?  AppColors.dark_theme
            : Colors.white
    ),
    child: Padding(
        padding: EdgeInsets.all(15.w),
      child: column,
    ),
  );
}

Widget dividerContainer() {
  return Container(
    height: 4.h,
    width: 55.w,
    decoration: BoxDecoration(
        color: AppColors.lightGray,
        borderRadius: BorderRadius.circular(10)
    ),
  );
}

Widget bottomSheetItem(VoidCallback onTap, String image, String title,
    double imageHeight, double imageWidth) {
  return GestureDetector(
    onTap: (){
      Get.back();
      onTap();
    },
    child: Row(
      children: [
        Container(
          height: 42.h,
          width: 42.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blue
          ),
          child: Center(
            child: SvgPicture.asset(
              image,
              height: imageHeight,
              width: imageWidth,
            ),
          ),
        ),
        SizedBox(width: 20.w,),
        CustomText(
          text: title,
          fontSize: 16.sp,
          textColor: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
        )
      ],
    ),
  );
}