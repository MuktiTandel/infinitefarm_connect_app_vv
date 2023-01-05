import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_appbar.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_button.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';
import 'package:infinitefarm_connect_app_vv/features/events/controller/event_group_request_controller.dart';

class EventGroupRequestScreen extends StatelessWidget {
   EventGroupRequestScreen({Key? key}) : super(key: key);

   final controller = Get.put(EventGroupRequestController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.isDarkMode ? AppColors.dark_theme : Colors.white,
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
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Get.isDarkMode ? AppColors.dark_theme : AppColors.white
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(6.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(() => GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: (){
                              controller.selectRequest();
                            },
                            child: Container(
                              width: 152.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: !controller.isGroup.value
                                      ? Get.isDarkMode ? AppColors.bottomSheet : Colors.white
                                      : Colors.transparent
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'My groups',
                                  textColor: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          )),
                          SizedBox(width: 10.w,),
                          Obx(() => GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: (){
                              controller.selectGroup();
                            },
                            child: Container(
                              width: 152.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: !controller.isRequest.value
                                      ?  Get.isDarkMode ? AppColors.bottomSheet : Colors.white
                                      : Colors.transparent
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Requests',
                                  textColor: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ))
                        ],
                      ),
                    )
                  ),
                  Expanded(child: SizedBox(height: 10.h,)),
                  SvgPicture.asset(
                      Get.isDarkMode ? AppImages.groupDark : AppImages.group,
                    height: 160.h,
                    width: 160.w,
                  ),
                  SizedBox(height: 40.h,),
                  Text(
                    'Discover groups',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25.sp,
                        fontFamily: 'Archia',
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  CustomText(
                      text: 'Find other trusted communities that share and support your goals',
                    textColor: Get.isDarkMode
                        ? Colors.white.withOpacity(0.8)
                        : AppColors.gray,
                  ),
                  SizedBox(height: 30.h,),
                  CustomButton(
                      onPresses: (){},
                      buttonText: 'Discover',
                    fontWeight: FontWeight.w600,
                  ),
                  Expanded(child: SizedBox(height: 10.h,))
                ],
              ),
            )
        ),
      ),
    );
  }
}
