import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/navigation/app_routes.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_constant.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/bottomsheet_container.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/scroll_behavior.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/appbar_textfield.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_button.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_container.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text_overflow.dart';
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
                            SizedBox(height: 10.h,),
                            Container(
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
                                        onTap: (){
                                          showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              backgroundColor: Colors.transparent,
                                              builder: (context) {
                                                return bottomsheetContainer(
                                                    200.h,
                                                    Column(
                                                      children: [
                                                        dividerContainer(),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        Align(
                                                          alignment: Alignment.topLeft,
                                                          child: CustomText(
                                                            text: 'Add Profile Photo',
                                                            textAlign: TextAlign.start,
                                                            textColor: Get.isDarkMode
                                                                ? Colors.white
                                                                : AppColors.black,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 17.sp,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        bottomSheetItem(
                                                                () { },
                                                            AppImages.camera_,
                                                            'Take a Photo',
                                                            15.h,
                                                            15.w
                                                        ),
                                                        SizedBox(height: 15.h,),
                                                        bottomSheetItem(
                                                                () { },
                                                            AppImages.gallery_,
                                                            'Upload From Photo',
                                                            15.h,
                                                            15.w
                                                        )
                                                      ],
                                                    )
                                                );
                                              }
                                          );
                                        },
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
                                              onTap: (){
                                                showModalBottomSheet(
                                                    context: context,
                                                    isScrollControlled: true,
                                                    backgroundColor: Colors.transparent,
                                                    builder: (context) {
                                                      return bottomsheetContainer(
                                                          210.h,
                                                          Column(
                                                            children: [
                                                              dividerContainer(),
                                                              SizedBox(height: 20.h,),
                                                              bottomSheetItem(
                                                                      () { },
                                                                  AppImages.camera_,
                                                                  'Add Profile Photo',
                                                                  15.h,
                                                                  18.w
                                                              ),
                                                              SizedBox(height: 15.h,),
                                                              bottomSheetItem(
                                                                      () { },
                                                                  AppImages.video_,
                                                                  'Add Profile Video',
                                                                  10.h,
                                                                  10.w
                                                              ),
                                                              SizedBox(height: 15.h,),
                                                              bottomSheetItem(
                                                                      () { },
                                                                  AppImages.gallery_,
                                                                  'Add Frame',
                                                                  15.h,
                                                                  15.w
                                                              ),
                                                            ],
                                                          )
                                                      );
                                                    }
                                                );
                                              },
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
                                      textColor: Get.isDarkMode
                                          ? AppColors.white.withOpacity(0.5)
                                          : AppColors.gray,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: '500',
                                          fontSize: 13.sp,
                                          textColor: Get.isDarkMode
                                              ? AppColors.white.withOpacity(0.5)
                                              : AppColors.lightGray.withOpacity(0.5),
                                        ),
                                        CustomText(
                                          text: '+ Connections',
                                          fontSize: 13.sp,
                                          textColor: Get.isDarkMode
                                              ? AppColors.white.withOpacity(0.5)
                                              : AppColors.lightGray.withOpacity(0.5),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h,),
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
                                  textColor: Get.isDarkMode
                                      ? Colors.white
                                      : AppColors.blue,
                                ),
                                Expanded(child: SizedBox(width: 1.w,)),
                                GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: (){},
                                  child: Container(
                                    height: 32.h,
                                    width: 32.w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        border: Get.isDarkMode
                                            ? Border.all(
                                          color: AppColors.blue,
                                          width: 1.w
                                        )
                                            : Border(),
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
                                      textColor: Get.isDarkMode ? AppColors.white : AppColors.black,
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
                                  fontWeight: FontWeight.w600,
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
                            item(AppImages.postView, 'post view', '2,008'),
                            SizedBox(height: 10.h,),
                            item(AppImages.search, 'search appearances', '165'),
                            SizedBox(height: 20.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(
                                  text: 'Resources',
                                  fontSize: 16.sp,
                                  textColor: Get.isDarkMode ? Colors.white : AppColors.black,
                                  fontWeight: FontWeight.w600,
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
                            resourceItem(
                                AppImages.creatorMode,
                                'Creator Mode',
                                'Get discovered, showcase content on your profile, and get access to creator tools'
                            ),
                            SizedBox(height: 15.h,),
                            resourceItem(
                                AppImages.profileView,
                                'My Network',
                                'See and manage your connections and interests'
                            ),
                            SizedBox(height: 15.h,),
                            showItem('Show all 5 resources', (){}),
                            SizedBox(height: 25.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   CustomText(
                                     text: 'Activity',
                                     fontSize: 16.sp,
                                     textColor: Get.isDarkMode ? Colors.white : AppColors.black,
                                     fontWeight: FontWeight.w600,
                                   ),
                                   SizedBox(height: 5.h,),
                                   Row(
                                     children: [
                                       CustomText(
                                           text: '1.2k',
                                         textColor: AppColors.blue,
                                         fontWeight: FontWeight.w600,
                                         fontSize: 12.sp,
                                       ),
                                       SizedBox(width: 2.w,),
                                       CustomText(
                                           text: 'followers',
                                         textColor: AppColors.blue,
                                         fontWeight: FontWeight.w600,
                                         fontSize: 12.sp,
                                       ),
                                     ],
                                   )
                                 ],
                                ),
                                Container(
                                  height: 22.h,
                                  width: 90.w,
                                  decoration: BoxDecoration(
                                    color: AppColors.blue,
                                    borderRadius: BorderRadius.circular(13)
                                  ),
                                  child: Center(
                                    child: CustomText(
                                        text: 'Start a Post',
                                      textColor: Colors.white,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15.h,),
                            activityItem(
                                AppImages.cInquires1,
                                'Pream Aaswani',
                                '134'
                            ),
                            SizedBox(height: 15.h,),
                            activityItem(
                                AppImages.cInquires1,
                                'Pream Aaswani',
                                '134'
                            ),
                            SizedBox(height: 15.h,),
                            showItem('Show all 5 activity', (){}),
                            SizedBox(height: 25.h,),
                            titleRow('Experience', () {

                            }, () {
                               Get.toNamed(AppRoutes.EDITEXPERIENCESCREEN);
                            }),
                            SizedBox(height: 15.h,),
                            ListView.builder(
                              itemCount: 2,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, int index) {
                                  return experienceItem(
                                      AppImages.experience,
                                      'Freelance Developer',
                                      'Freelace, self-employed. Full-Time',
                                      'Jan 2022 - Present. 1yr 4 mon'
                                  );
                                }
                            ),
                            SizedBox(height: 10.h,),
                            titleRow('Education', () { }, () { }),
                            SizedBox(height: 15.h,),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 1,
                                itemBuilder: (context, int index) {
                                  return educationItem(
                                      AppImages.education,
                                      'JIET Group Of Institutions Jodhpur Computer Engineering',
                                      '2018 - 2021'
                                  );
                                }
                                ),
                            SizedBox(height: 10.h,),
                            titleRow('Skills', () { }, () { }),
                            SizedBox(height: 15.h,),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: 3,
                                itemBuilder: (context, int index) {
                                  return skillItem('Flutter');
                                }
                            ),
                            SizedBox(height: 5.h,),
                            showItem('Show all', () { }),
                            SizedBox(height: 15.h,)
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

  // Analytics items
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

   // Resources items
   Widget resourceItem(String image, String title, String subtitle) {
      return Container(
        decoration: BoxDecoration(
            color: Get.isDarkMode
                ? Colors.white.withOpacity(0.05)
                : Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: EdgeInsets.all(13.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageContainer(image),
              SizedBox(width: 10.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: title,
                      textColor: Get.isDarkMode
                          ? Colors.white
                          : AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 5.h,),
                    CustomText(
                      text: subtitle,
                      textAlign: TextAlign.start,
                      textColor: Get.isDarkMode
                          ? AppColors.white.withOpacity(0.8)
                          : AppColors.gray,
                      fontSize: 12.sp,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
   }

   // Activity items
   Widget activityItem(String image, String name, String comments) {
     return Container(
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: Get.isDarkMode
               ? Colors.white.withOpacity(0.05)
               : Colors.white
       ),
       child: Padding(
         padding: EdgeInsets.all(13.w),
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             CircleAvatar(
               maxRadius: 18.w,
               child: Image.asset(image),
             ),
             SizedBox(width: 10.w,),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Row(
                     children: [
                       Expanded(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             CustomText(
                               text: name,
                               textColor: Get.isDarkMode
                                   ? Colors.white
                                   : AppColors.black,
                               fontWeight: FontWeight.w600,
                             ),
                             SizedBox(width: 10.w,),
                             Expanded(
                                 child: CustomTextOverflow(
                                   text: 'Commented on a post',
                                   color: Get.isDarkMode
                                       ? Colors.white.withOpacity(0.5)
                                       : Colors.black.withOpacity(0.5),
                                 )
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 5.h,),
                   CustomText(
                     text: '“Congrats”',
                     textAlign: TextAlign.start,
                     textColor: Get.isDarkMode
                         ? AppColors.white
                         : AppColors.black,
                   ),
                   SizedBox(height: 5.h,),
                   Row(
                     children: [
                       CustomText(
                         text: comments,
                         fontSize: 13.sp,
                         textColor: Get.isDarkMode 
                             ? AppColors.white.withOpacity(0.8)
                             : AppColors.gray,
                       ),
                       SizedBox(width: 5.w,),
                       CustomText(
                         text: 'comments',
                         fontSize: 13.sp,
                         textColor: Get.isDarkMode
                             ? AppColors.white.withOpacity(0.8)
                             : AppColors.gray,
                       )
                     ],
                   )
                 ],
               ),
             )
           ],
         ),
       ),
     );
   }

   // show button
   Widget showItem(String text, VoidCallback onTap) {
      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: (){
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: text,
              textColor: AppColors.blue,
            ),
            SizedBox(width: 10.w,),
            SvgPicture.asset(
              AppImages.forwardArrow,
              height: 10.h,
              width: 10.w,
            )
          ],
        ),
      );
   }

   // experience items
   Widget experienceItem(String image, String title, String subtitle, String present) {
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
                  child: Image.asset(image),
                ),
                SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: title,
                      textColor: Get.isDarkMode
                          ? Colors.white
                          : AppColors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 1.h,),
                    CustomText(
                      text: subtitle,
                      fontSize: 13.sp,
                      textColor: Get.isDarkMode
                          ? AppColors.white.withOpacity(0.8)
                          : AppColors.gray,
                    ),
                    SizedBox(height: 1.h,),
                    CustomText(
                      text: present,
                      fontSize: 13.sp,
                      textColor: AppColors.lightGray,
                    )
                  ],
                )
              ],
            ),
          ),
          ),
          SizedBox(height: 15.h,)
        ],
      );
   }

   // experience, education and skill title widget
   Widget titleRow (String title, VoidCallback addClick, VoidCallback editClick) {
     return Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         CustomText(
           text: title,
           fontSize: 16.sp,
           textColor: Get.isDarkMode ? Colors.white : AppColors.black,
           fontWeight: FontWeight.w600,
         ),
         Expanded(child: SizedBox(width: 10.w,)),
         buttonContainer(() {
           addClick();
         }, AppImages.add),
         SizedBox(width: 15.w,),
         buttonContainer(() {
           editClick();
         }, AppImages.edit)
       ],
     );
   }

   // education item
  Widget educationItem (String image, String institute, String duration) {
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
                  child: Image.asset(image),
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: institute,
                        textColor: Get.isDarkMode
                            ? Colors.white
                            : AppColors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 5.h,),
                      CustomText(
                        text: duration,
                        fontSize: 13.sp,
                        textColor: AppColors.lightGray,
                      )
                    ],
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

  // skill item
  Widget skillItem(String skill) {
    return Column(
      children: [
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Get.isDarkMode
                ? Colors.white.withOpacity(0.05)
                : Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(15.w),
            child: CustomText(
              text: skill,
              textAlign: TextAlign.start,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              textColor: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ),
        SizedBox(height: 10.h,)
      ],
    );
  }

}
