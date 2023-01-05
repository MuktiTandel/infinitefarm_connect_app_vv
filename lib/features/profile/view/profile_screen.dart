import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/scroll_behavior.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/appbar_textfield.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_button.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_container.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';
import 'package:infinitefarm_connect_app_vv/features/profile/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);

   final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          height: 40.h,
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
                              AppImages.backArrow,
                              height: 15.h,
                              width: 15.w,
                              color: Get.isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w,),
                      CustomText(
                        text: 'Profile',
                        fontSize: 18.sp,
                        textColor: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      Expanded(child: SizedBox(width: 10.w,)),
                      GestureDetector(
                        onTap: (){},
                        child: SvgPicture.asset(
                            AppImages.setting,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          height: 25.h,
                          width: 25.w,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            AppbarTextfield(
                              hintText: 'Search',
                              controller: controller.search,
                            ),
                            SizedBox(height: 15.h,),
                            Container(
                              height: 250.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: const AssetImage(AppImages.Dprofile),
                                      scale: 1.w,
                                      alignment: Alignment.topCenter
                                  )
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(10.w),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: (){},
                                        child: Container(
                                          height: 35.h,
                                          width: 35.w,
                                          decoration: BoxDecoration(
                                              color: Colors.white.withOpacity(0.3),
                                              shape: BoxShape.circle
                                          ),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              AppImages.camera,
                                              height: 15.h,
                                              width: 15.w,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    SizedBox(
                                      height: 120.h,
                                      width: 120.w,
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                            AppImages.profile1,
                                            height: 115.h,
                                            width: 115.w,
                                          ),
                                          Positioned(
                                            right: 0,
                                            bottom: 0.w,
                                            child: GestureDetector(
                                              behavior: HitTestBehavior.opaque,
                                              onTap: (){},
                                              child: Container(
                                                height: 40.h,
                                                width: 40.w,
                                                decoration: BoxDecoration(
                                                    color: AppColors.blue,
                                                    shape: BoxShape.circle,
                                                    border: Border.all(color: Colors.white, width: 1.5.w)
                                                ),
                                                child: const Center(
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10.h,),
                                    CustomText(
                                      text: 'John Smith',
                                      textColor: Get.isDarkMode ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp,
                                    ),
                                    CustomText(
                                      text: 'Junior UI/UX designer',
                                      fontSize: 14.sp,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: '500',
                                          textColor: Get.isDarkMode
                                              ? Colors.white
                                              : AppColors.lightGray.withOpacity(0.5),
                                        ),
                                        CustomText(
                                          text: '+ Connections',
                                          textColor: Get.isDarkMode
                                              ? Colors.white
                                              : AppColors.lightGray.withOpacity(0.5),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomButton(
                                  onPresses: (){},
                                  buttonText: 'Open to',
                                  width: 140.w,
                                  height: 35.h,
                                  radius: 10,
                                ),
                                Expanded(child: SizedBox(width: 10.w,)),
                                CustomButton(
                                  onPresses: (){},
                                  buttonText: 'Add Section',
                                  width: 140.w,
                                  height: 35.w,
                                  radius: 10,
                                  backgroundColor: AppColors.blue.withOpacity(0.1),
                                  textColor: AppColors.blue,
                                ),
                                Expanded(child: SizedBox(width: 10.w,)),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: (){},
                                  child: Container(
                                    height: 32.h,
                                    width: 32.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: AppColors.blue.withOpacity(0.1)
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        AppImages.more,
                                        color: AppColors.blue,
                                        height: 15.h,
                                        width: 15.w,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15.h,),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Get.isDarkMode
                                      ? AppColors.bottomSheet
                                      : Colors.white
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: 'Show recuiters you’re open to work - you control who see this',
                                      textAlign: TextAlign.start,
                                      textColor: Get.isDarkMode ? Colors.white : AppColors.black,
                                    ),
                                    SizedBox(height: 5.h,),
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: (){},
                                      child: Container(
                                        height: 22.h,
                                        width: 110.w,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: AppColors.blue
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text: 'Get Started',
                                            textColor: Colors.white,
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 15.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Analytics',
                                  fontSize: 16.sp,
                                  textColor: Get.isDarkMode ? Colors.white : AppColors.black,
                                ),
                                SizedBox(width: 10.w,),
                                CustomContainer(
                                  image: AppImages.eye,
                                  title: 'Private',
                                  leftImageHeight: 9.h,
                                  leftImageWidth: 9.w,
                                  rightImageHeight: 7.h,
                                  rightImageWidth: 7.w,
                                  height: 25.h,
                                  fontSize: 11.sp,
                                )
                              ],
                            ),
                            SizedBox(height: 15.h,),
                            item(AppImages.profileView, 'profile view', '123'),
                            SizedBox(height: 10.h,),
                            item(AppImages.profileView, 'post view', '2,008'),
                            SizedBox(height: 10.h,),
                            item(AppImages.profileView, 'search appearances', '165'),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

   Widget item(String image, String title, String count) {
     return Row(
       children: [
         Container(
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
         ),
         SizedBox(width: 20.w,),
         Row(
           children: [
             CustomText(
               text: count,
               fontSize: 15.sp,
               textColor: Get.isDarkMode ? Colors.white : Colors.black,
               fontWeight: FontWeight.w600,
             ),
             SizedBox(width: 10.w,),
             CustomText(
               text: title,
               fontSize: 15.sp,
               textColor: Get.isDarkMode ? Colors.white : Colors.black,
               fontWeight: FontWeight.w600,
             ),
           ],
         )
       ],
     );
   }
}
