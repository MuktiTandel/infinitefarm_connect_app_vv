import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';

class AppConstant {

  void Debug(String message){
    if(kDebugMode){
      print("***** ${message} *****");
    }
  }

}

Widget imageContainer (String image) {
  return  Container(
    height: 35.h,
    width: 35.h,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.blue
    ),
    child: Center(
      child: SvgPicture.asset(
        image,
        height: 15.h,
        width: 15.w,
      ),
    ),
  );
}

Widget backButton(VoidCallback ontap, String icon) {
  return GestureDetector(
    onTap: (){
      ontap();
    },
    child: Container(
      height: 35.h,
      width: 40.w,
      decoration: BoxDecoration(
          color: AppColors.blue.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          border: Get.isDarkMode
              ? Border.all(color: AppColors.bottomSheet)
              : const Border()
      ),
      child: Center(
        child: SvgPicture.asset(
          icon,
          height: 15.h,
          width: 15.w,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
    ),
  );
}

// rounded container button with image
Widget buttonContainer(VoidCallback onTap, String image) {
  return GestureDetector(
    onTap: (){
      onTap();
    },
    child: Container(
      height: 30.h,
      width: 35.w,
      decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(6)
      ),
      child: Center(
        child: SvgPicture.asset(
          image,
          height: 12.h,
          width: 12.w,
        ),
      ),
    ),
  );
}