import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/theme_service.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_container.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_appbar.dart';

class PostScreen extends StatelessWidget {
   PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.theme.backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomAppbar(
                      leftIcon: AppImages.close,
                      title: 'Share Post',
                      rightText: 'Post',
                      leftClick: (){
                        Get.back();
                      },
                      rightClick: (){

                      }
                  ),
                  SizedBox(height: 10.h,),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Get.isDarkMode
                                  ? Colors.white.withOpacity(0.05)
                                  : Colors.white
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                      maxRadius: 28.w,
                                      child: Image.asset(AppImages.profile),
                                    ),
                                    SizedBox(width: 15.w,),
                                    CustomText(
                                      text: 'Jhon Smith',
                                      textColor: Get.isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 19.sp,
                                    ),
                                    Expanded(child: SizedBox(width: 10.w,)),
                                    CustomContainer(
                                        image: AppImages.world,
                                        title: 'Anyone'
                                    )
                                  ],
                                ),
                                SizedBox(height: 15.h,),
                                Divider(
                                  thickness: 1.w,
                                  color: Get.isDarkMode
                                      ? Colors.white.withOpacity(0.2)
                                      : AppColors.lightGray_,
                                ),
                                TextFormField(
                                  cursorColor: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 22,
                                  style: const TextStyle(
                                      fontFamily: 'Archia'
                                  ),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'What do you want to talk about?',
                                      contentPadding: EdgeInsets.zero,
                                      hintStyle: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.white.withOpacity(0.5)
                                            : AppColors.lightGray,
                                        fontFamily: 'Archia',
                                      )
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: SizedBox(height: 15.h,)),
                        Container(
                          height: 45.h,
                          padding: EdgeInsets.all(14.w),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.blue
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              bottomItem(() { }, AppImages.camera),
                              bottomItem(() { }, AppImages.video),
                              bottomItem(() { }, AppImages.gallery),
                              textItem(AppImages.hashtag, 'Hashtag', (){}),
                              textItem(AppImages.message, 'Anyone', (){}),
                              bottomItem(() {
                                showModalBottomSheet(
                                    context: context,
                                    barrierColor: Colors.transparent,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 500.h,
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
                                          padding:  EdgeInsets.all(15.w),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 4.h,
                                                width: 55.w,
                                                decoration: BoxDecoration(
                                                  color: AppColors.lightGray,
                                                  borderRadius: BorderRadius.circular(10)
                                                ),
                                              ),
                                              SizedBox(height: 20.h,),
                                              bottomSheetItem(AppImages.gallery_, 'Add Photo', (){}),
                                              SizedBox(height: 15.h,),
                                              GestureDetector(
                                                onTap: (){
                                                  Get.back();
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
                                                          AppImages.video_,
                                                          height: 10.h,
                                                          width: 10.w,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 20.w,),
                                                    CustomText(
                                                      text: 'Take Video',
                                                      fontSize: 16.sp,
                                                      textColor: Get.isDarkMode ? Colors.white : Colors.black,
                                                      fontWeight: FontWeight.w600,
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 15.h,),
                                              bottomSheetItem(AppImages.celebrate, 'Celebrate an Occasion', (){}),
                                              SizedBox(height: 15.h,),
                                              bottomSheetItem(AppImages.document, 'Add Document', (){}),
                                              SizedBox(height: 15.h,),
                                              bottomSheetItem(AppImages.share, 'Share that you’re hiring', (){}),
                                              SizedBox(height: 15.h,),
                                              bottomSheetItem(AppImages.expert, 'Find an Expert', (){}),
                                              SizedBox(height: 15.h,),
                                              bottomSheetItem(AppImages.poll, 'Create a Poll', (){}),
                                              SizedBox(height: 15.h,),
                                              bottomSheetItem(AppImages.event, 'Create event', (){}),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                );
                              }, AppImages.more),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
      ),
    );
  }

  Widget bottomItem(VoidCallback onTap, String image) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: SvgPicture.asset(
        image,
        height: 18.h,
        width: 18.w,
      ),
    );
  }

  Widget textItem(String image, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Row(
          children: [
            SvgPicture.asset(
              image,
              height: 18.h,
              width: 18.w,
            ),
            SizedBox(width: 5.w,),
            CustomText(
              text: title,
              textColor: Colors.white,
            ),
          ],
      ),
    );
  }

  Widget bottomSheetItem(String image, String title, VoidCallback onTap) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        onTap();
        Get.back();
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
                height: 15.h,
                width: 15.w,
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
}
