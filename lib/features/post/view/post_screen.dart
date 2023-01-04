import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/dark_theme_appbar.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration:  const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.darkBackground),
                fit: BoxFit.cover,
                opacity: 0.8
            )
        ),
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DarkThemeAppbar(
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white.withOpacity(0.05)
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: EdgeInsets.all(15.w),
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
                                  textColor: Colors.white,
                                  fontSize: 19.sp,
                                ),
                                Expanded(child: SizedBox(width: 10.w,)),
                                Container(
                                  height: 30.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.blue,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(8.w),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            AppImages.world,
                                          height: 15.h,
                                          width: 15.w,
                                        ),
                                        SizedBox(width: 5.w,),
                                        CustomText(
                                            text: 'Anyone',
                                          textColor: Colors.white,
                                          fontSize: 13.sp,
                                        ),
                                        SizedBox(width: 5.w,),
                                        SvgPicture.asset(
                                            AppImages.downArrow,
                                          height: 10.h,
                                          width: 10.w,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 15.h,),
                            Divider(
                              thickness: 1.w,
                              color: Colors.white.withOpacity(0.2),
                            ),
                            TextFormField(
                              cursorColor: Colors.white,
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                              style: TextStyle(
                                fontFamily: 'Archia'
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'What do you want to talk about?',
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontFamily: 'Archia',
                                )
                              ),
                            )
                          ],
                        ),
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
                        bottomItem(() { }, AppImages.more),
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
}
