import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_constant.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text_overflow.dart';

class EditExperienceScreen extends StatelessWidget {
  const EditExperienceScreen({Key? key}) : super(key: key);

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
                Row(
                  children: [
                    backButton(() {
                      Get.back();
                    }, AppImages.backArrow),
                    SizedBox(width: 15.w,),
                    CustomText(
                      text: 'Experience',
                      fontSize: 18.sp,
                      textColor: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    Expanded(child: SizedBox(width: 10.w,)),
                    buttonContainer(() { }, AppImages.add),
                  ],
                ),
                SizedBox(height: 20.h,),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, int index) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Get.isDarkMode
                                    ? Colors.white.withOpacity(0.05)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(13.w),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    maxRadius: 26.w,
                                    child: Image.asset(AppImages.experience),
                                  ),
                                  SizedBox(width: 10.w,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: 'Freelance Developer',
                                          textColor: Get.isDarkMode
                                              ? Colors.white
                                              : AppColors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        SizedBox(height: 1.h,),
                                        CustomTextOverflow(
                                          text: 'Freelace, self-employed. Full-Time',
                                          fontSize: 13.sp,
                                          color :  Get.isDarkMode
                                                ? AppColors.white.withOpacity(0.8)
                                                : AppColors.gray
                                        ),
                                        SizedBox(height: 1.h,),
                                        CustomText(
                                          text: 'Jan 2022 - Present. 1yr 4 mon',
                                          fontSize: 13.sp,
                                          textColor: Get.isDarkMode
                                              ? AppColors.white.withOpacity(0.8)
                                              : AppColors.lightGray,
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 10.w,),
                                  GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.blue
                                      ),
                                      height: 30.h,
                                      width: 30.w,
                                      child: Center(
                                        child: SvgPicture.asset(
                                            AppImages.edit,
                                          height: 12.h,
                                          width: 12.w,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15.h,)
                        ],
                      );
                    }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
