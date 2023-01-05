import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/scroll_behavior.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/theme_service.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_button.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';

class MyNetworkScreen extends StatelessWidget {
   MyNetworkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: (){
              },
              child: Container(
                height: 50.h,
                padding: EdgeInsets.only(left: 15.w, right: 15.w),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Get.isDarkMode
                      ? Colors.white.withOpacity(0.05)
                      : Colors.white
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                          text: 'Manage my network',
                        textColor: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16.sp,
                      ),
                      SvgPicture.asset(
                          AppImages.rightArrow,
                        height: 15.h,
                        width: 15.w,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Get.isDarkMode
                    ? Colors.white.withOpacity(0.05)
                    : Colors.white
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Connections inquires',
                        textColor: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 16.sp,
                      ),
                      SvgPicture.asset(
                        AppImages.rightArrow,
                        height: 15.h,
                        width: 15.w,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      )
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Divider(
                    thickness: 1.w,
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.4)
                        : AppColors.gray.withOpacity(0.4),
                  ),
                  SizedBox(height: 10.h,),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: 2,
                      itemBuilder: (context, int index) {
                          return connectionsInquiresItem(
                            AppImages.cInquires1,
                            'Akansha Bhadani',
                            'Junior UI/UX Designer',
                            '10'
                          );
                      }
                  ),
                  Divider(
                    thickness: 1.w,
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.4)
                        : AppColors.gray.withOpacity(0.4),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: (){},
                    child: CustomText(
                        text: 'Show more',
                      fontSize: 16.sp,
                      textColor: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            CustomText(
                text: 'People you may know from Spark Foundation',
              fontSize: 14.sp,
              textColor: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            SizedBox(height: 20.h,),
            GridView.builder(
              shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 15.h,
                  childAspectRatio: 1.2.w/2.w,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    height: 300.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.bottomSheet,
                      image: DecorationImage(
                          image: AssetImage(AppImages.rectangle),
                        alignment: Alignment.topLeft,
                        scale: 1.w,
                      )
                    ),
                    child: Padding(
                      padding:  EdgeInsets.all(10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            maxRadius: 32.w,
                            child: Image.asset(AppImages.cInquires2),
                          ),
                          SizedBox(height: 10.h,),
                          CustomText(
                              text: 'Kevin Piter',
                            textColor: Colors.white,
                            fontSize: 16.sp,
                          ),
                          SizedBox(height: 5.h,),
                          Text(
                            'Junior UI/UX Designer',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white.withOpacity(0.5),
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'Archia'
                            ),
                          ),
                          SizedBox(height: 5.h,),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppImages.mutual,
                                height: 10.h,
                                width: 10.w,
                              ),
                              SizedBox(width: 5.w,),
                              CustomText(
                                text: '5',
                                textColor: Colors.white.withOpacity(0.5),
                                fontSize: 14.sp,
                              ),
                              SizedBox(width: 2.w,),
                              CustomText(
                                text: 'mutual',
                                textColor: Colors.white.withOpacity(0.5),
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                          CustomText(
                            text: 'connections',
                            textColor: Colors.white.withOpacity(0.5),
                            fontSize: 14.sp,
                          ),
                          SizedBox(height: 20.h,),
                          CustomButton(
                              onPresses: (){},
                              height: 40.h,
                              buttonText: 'Connect',
                            radius: 10,
                          )
                        ],
                      ),
                    ),
                  );
                }
            ),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }

  // connections inquires list item
  Widget connectionsInquiresItem(String image, String name,
      String work, String mutual) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              maxRadius: 30.w,
              child: Image.asset(image),
            ),
            SizedBox(width: 10.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: name,
                    textColor: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 15.sp,
                  ),
                  SizedBox(height: 1.h,),
                 /* CustomText(
                      text: 'Junior UI/UX Designer',
                    textColor: Colors.white.withOpacity(0.5),
                    fontSize: 14.sp,
                  ),*/
                  Text(
                      work,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.5)
                          : Colors.black.withOpacity(0.5),
                      overflow: TextOverflow.ellipsis,
                      fontFamily: 'Archia'
                    ),
                  ),
                  SizedBox(height: 1.5.h,),
                  Row(
                    children: [
                      SvgPicture.asset(
                          AppImages.mutual,
                        height: 7.h,
                        width: 7.w,
                        color: Get.isDarkMode
                            ? Colors.white
                            : Colors.black,
                      ),
                      SizedBox(width: 3.w,),
                      CustomText(
                          text: mutual,
                        textColor: Get.isDarkMode
                            ? Colors.white.withOpacity(0.5)
                            : Colors.black.withOpacity(0.5),
                        fontSize: 12.sp,
                      ),
                      SizedBox(width: 2.w,),
                      CustomText(
                        text: 'mutual',
                        textColor: Get.isDarkMode
                            ? Colors.white.withOpacity(0.5)
                            : Colors.black.withOpacity(0.5),
                        fontSize: 12.sp,
                      ),
                      SizedBox(width: 2.w,),
                      Expanded(
                        child: Text(
                          'connections',
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: Get.isDarkMode
                                  ? Colors.white.withOpacity(0.5)
                                  : Colors.black.withOpacity(0.5),
                              overflow: TextOverflow.ellipsis,
                              fontFamily: 'Archia'
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: 7.5.w,),
            GestureDetector(
              onTap: (){},
              child: SvgPicture.asset(
                  AppImages.uncheck,
                height: 30.h,
                width: 30.w,
              ),
            ),
            SizedBox(width: 10.w,),
            GestureDetector(
              onTap: (){},
              child: SvgPicture.asset(
                  AppImages.check,
                height: 30.h,
                width: 30.w,
              ),
            ),
          ],
        ),
        SizedBox(height: 15.h,)
      ],
    );
  }
}
