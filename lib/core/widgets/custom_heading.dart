import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? 16.sp,
          color: color ?? Colors.white,
          fontFamily: 'Archia',
          fontWeight: fontWeight ?? FontWeight.w600
      ),
    );
  }
}
