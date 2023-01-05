import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.textAlign,
    this.fontSize,
    this.textColor,
    this.fontWeight
  }) : super(key: key);

  final String text;
  final TextAlign? textAlign;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.center,
      style: TextStyle(
          fontSize: fontSize ?? 15.sp,
          fontFamily: 'Archia',
          color: textColor ?? AppColors.gray,
          fontWeight: fontWeight ?? FontWeight.w500
      ),
    );
  }
}
