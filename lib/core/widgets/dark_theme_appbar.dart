import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';

class DarkThemeAppbar extends StatelessWidget {
  const DarkThemeAppbar({
    Key? key,
    required this.leftIcon,
    required this.title,
    required this.rightText,
    required this.leftClick,
    required this.rightClick
  }) : super(key: key);

  final VoidCallback leftClick;
  final VoidCallback rightClick;
  final String leftIcon;
  final String rightText;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: (){
            leftClick();
          },
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.bottomSheet)
            ),
            child: Center(
              child: SvgPicture.asset(
                leftIcon,
                height: 15.h,
                width: 15.w,
              ),
            ),
          ),
        ),
        SizedBox(width: 15.w,),
        CustomText(
          text: title,
          fontSize: 18.sp,
          textColor: Colors.white,
        ),
        Expanded(child: SizedBox(width: 10.w,)),
        GestureDetector(
          onTap: (){
            rightClick();
          },
          child: Container(
            height: 25.h,
            width: 55.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: AppColors.blue.withOpacity(0.09)
            ),
            child: Center(
              child: CustomText(
                text: rightText,
                textColor: AppColors.blue,
                fontSize: 16.sp,
              ),
            ),
          ),
        )
      ],
    );
  }
}
