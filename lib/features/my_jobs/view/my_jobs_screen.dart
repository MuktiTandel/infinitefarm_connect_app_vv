import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/navigation/app_pages.dart';
import 'package:infinitefarm_connect_app_vv/core/navigation/app_routes.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_appbar.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_button.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_appbar.dart';

class MyJobsScreen extends StatelessWidget {
  const MyJobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: Get.isDarkMode ? const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.darkBackground),
                fit: BoxFit.cover,
                opacity: 0.8
            )
        ) : const BoxDecoration(),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding:  EdgeInsets.all(15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAppbar(
                      leftIcon: AppImages.backArrow,
                      title: 'My Jobs',
                      rightText: 'Saved',
                      leftClick: (){
                        Get.back();
                      },
                      rightClick: (){}
                  ),
                  Expanded(child: SizedBox(height: 10.h,)),
                  SvgPicture.asset(
                    Get.isDarkMode ? AppImages.jobEventDark : AppImages.jobEvent,
                    height: 230.h,
                    width: 230.w,
                  ),
                  SizedBox(height: 30.h,),
                  Text(
                      'Start saving jobs you are interested in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontFamily: 'Archia',
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  CustomText(
                      text: 'Once jobs are saved, you’ll find then here',
                    textColor: Get.isDarkMode ? Colors.white.withOpacity(0.8) : AppColors.gray,
                  ),
                  SizedBox(height: 30.h,),
                  CustomButton(
                      onPresses: (){
                        Get.toNamed(AppRoutes.EVENTS);
                      },
                      buttonText: 'Browse jobs for me',
                    fontWeight: FontWeight.w600,
                  ),
                  Expanded(child: SizedBox(height: 10.h,))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
