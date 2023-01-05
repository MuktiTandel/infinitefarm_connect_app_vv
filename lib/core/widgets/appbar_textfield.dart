import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';

class AppbarTextfield extends StatelessWidget {
  const AppbarTextfield({
    Key? key,
    required this.hintText,
    required this.controller
  }) : super(key: key);

  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Get.isDarkMode
          ? Colors.white
          : Colors.black,
      style: const TextStyle(
          fontFamily: 'Archia'
      ),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none
          ),
          fillColor: Get.isDarkMode
              ? Colors.white.withOpacity(0.05)
              : Colors.white,
          filled: true,
          prefixIcon: Padding(
            padding:  EdgeInsets.all(12.w),
            child: SvgPicture.asset(
              AppImages.search,
              width: 5.w,
              height: 5.h,
              fit: BoxFit.cover,
              color: Get.isDarkMode ? Colors.white : AppColors.gray,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
              color: Get.isDarkMode
                  ? Colors.white.withOpacity(0.3)
                  : AppColors.gray,
              fontFamily: 'Archia'
          )
      ),
    );
  }
}
