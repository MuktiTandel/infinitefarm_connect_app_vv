import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_appbar.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Container(
        decoration: Get.isDarkMode ? const BoxDecoration(
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
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAppbar(
                    leftIcon: AppImages.backArrow,
                    title: 'Events',
                    rightText: 'Create',
                    leftClick: (){
                      Get.back();
                    },
                    rightClick: (){}
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    CustomText(
                        text: '0',
                      textColor: Get.isDarkMode
                          ? Colors.white.withOpacity(0.8)
                          : AppColors.gray,
                    ),
                    SizedBox(width: 5.w,),
                    CustomText(
                        text: 'Events',
                      textColor: Get.isDarkMode
                          ? Colors.white.withOpacity(0.8)
                          : AppColors.gray,
                    )
                  ],
                ),
                Expanded(child: SizedBox(height: 10.h,)),
                SvgPicture.asset(
                  Get.isDarkMode ? AppImages.jobEventDark : AppImages.jobEvent,
                  height: 230.h,
                  width: 230.w,
                ),
                SizedBox(height: 30.h,),
                CustomText(
                    text: 'Looks like you are not attending any events',
                  textColor: Get.isDarkMode
                      ? Colors.white.withOpacity(0.8)
                      : AppColors.gray
                  ,
                ),
                Expanded(child: SizedBox(height: 10.h,))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
