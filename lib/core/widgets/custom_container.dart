import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.image,
    required this.title,
    this.height,
    this.rightImageHeight,
    this.rightImageWidth,
    this.leftImageWidth,
    this.leftImageHeight,
    this.fontSize
  }) : super(key: key);

  final String image;
  final String title;
  final double? height;
  final double? rightImageHeight;
  final double? rightImageWidth;
  final double? leftImageHeight;
  final double? leftImageWidth;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 30.h,
      decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              height: leftImageHeight ??  15.h,
              width: leftImageWidth ?? 15.w,
            ),
            SizedBox(width: 5.w,),
            CustomText(
              text: title,
              textColor: Colors.white,
              fontSize: fontSize ?? 13.sp,
            ),
            SizedBox(width: 5.w,),
            SvgPicture.asset(
              AppImages.downArrow,
              height: rightImageHeight ?? 10.h,
              width: rightImageWidth ?? 10.w,
            )
          ],
        ),
      ),
    );
  }
}
