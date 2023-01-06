import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';

class AddExperienceScreen extends StatelessWidget {
  const AddExperienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Container(
        decoration: Get.isDarkMode ?  const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.darkBackground),
                fit: BoxFit.cover,
                opacity: 0.8
            )
        ) : const BoxDecoration(),
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(15.w),
              child: Column(
                children: [

                ],
              ),
            )
        ),
      ),
    );
  }
}
