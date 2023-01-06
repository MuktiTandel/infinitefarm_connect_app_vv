import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextOverflow extends StatelessWidget {
  const CustomTextOverflow({
    Key? key,
    required this.text,
    this.fontSize,
    required this.color
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? 14.sp,
          color: color,
          overflow: TextOverflow.ellipsis,
          fontFamily: 'Archia'
      ),
    );
  }
}
